#!/usr/bin/env bash
# Reproducible, text-only source build; generated files stay outside the repository.
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
OUT="${1:-${TMPDIR:-/tmp}/mark-publication/all-will-be-forgiven.pdf}"
PANDOC="${PANDOC:-pandoc}"
mkdir -p "$(dirname -- "$OUT")"
OUT="$(cd -- "$(dirname -- "$OUT")" && pwd -P)/$(basename -- "$OUT")"
for target in "$OUT" "$OUT.build.txt" "$OUT.build.log"; do
  if [[ -L "$target" ]]; then
    echo "Refusing a symbolic-link output path: $target" >&2
    exit 1
  fi
done
case "$OUT" in
  "$ROOT"/*) echo "PDF output must be outside the repository: $OUT" >&2; exit 1 ;;
esac
for tool in "$PANDOC" xelatex; do
  command -v "$tool" >/dev/null || { echo "Required tool missing: $tool" >&2; exit 1; }
done
if command -v sha256sum >/dev/null; then
  HASH=(sha256sum)
else
  command -v shasum >/dev/null || { echo "Required tool missing: shasum or sha256sum" >&2; exit 1; }
  HASH=(shasum -a 256)
fi
# Ephemeral writable caches also support read-only/container TeX installations.
BUILD="$(mktemp -d "${TMPDIR:-/tmp}/mark-pdf.XXXXXXXX")"
trap 'rm -rf "$BUILD"' EXIT
export XDG_CACHE_HOME="$BUILD/cache"
export TEXMFVAR="$BUILD/texmf-var"
export TEXMFCONFIG="$BUILD/texmf-config"
mkdir -p "$XDG_CACHE_HOME" "$TEXMFVAR" "$TEXMFCONFIG"
# Debian's file index can be absent in minimal images. Permit direct traversal.
if ! kpsewhich article.cls >/dev/null 2>&1 && [[ -d /usr/share/texlive/texmf-dist ]]; then
  export TEXMF="{$TEXMFVAR,$TEXMFCONFIG,/usr/share/texlive/texmf-dist,/usr/share/texmf,/etc/texmf}"
fi
if ! kpsewhich xelatex.fmt >/dev/null 2>&1; then
  mkdir -p "$TEXMFVAR/web2c/xetex"
  (cd "$TEXMFVAR/web2c/xetex" && \
    xetex -ini -etex -no-shell-escape -jobname=xelatex \
      -interaction=batchmode '*xelatex.ini') >"$BUILD/format.log" 2>&1 || {
    cat "$BUILD/format.log" >&2
    exit 1
  }
  export TEXFORMATS="$TEXMFVAR/web2c/xetex//:"
fi
cd "$ROOT"
"$PANDOC" essay/working-draft-v4.md \
  --from=markdown+footnotes --standalone \
  --lua-filter=typesetting/publication.lua \
  --metadata-file=typesetting/metadata.yaml \
  --include-in-header=typesetting/header.tex \
  --output="$BUILD/essay.tex"
for pass in 1 2; do
  xelatex -interaction=nonstopmode -halt-on-error -no-shell-escape -recorder \
    -output-directory="$BUILD" "$BUILD/essay.tex" >"$BUILD/compile.log" 2>&1 || {
      cat "$BUILD/compile.log" >&2
      exit 1
    }
done
if grep -E 'Missing character:|Overfull \\[hv]box' "$BUILD/essay.log"; then
  echo "Typography warnings above require review." >&2
fi
cp "$BUILD/essay.pdf" "$OUT"
cp "$BUILD/essay.log" "$OUT.build.log"
{
  printf 'PDF build receipt\nUTC: %s\n' "$(date -u +%FT%TZ)"
  printf 'Source commit: %s\n' "$(git rev-parse HEAD)"
  printf '\nWorking tree status (empty means clean):\n'
  git status --short
  printf '\nPlatform:\n'
  uname -sm
  if command -v sw_vers >/dev/null; then sw_vers; fi
  printf '\nTools:\n'
  command -v "$PANDOC" xelatex
  "$PANDOC" --version
  xelatex --version
  printf '\nRecipe: Pandoc with publication.lua, metadata.yaml, header.tex; two XeLaTeX passes.\n'
  printf '\nSHA-256 of source, build recipe, Pandoc executable, and PDF:\n'
  "${HASH[@]}" essay/working-draft-v4.md scripts/build-pdf.sh \
    typesetting/publication.lua typesetting/metadata.yaml typesetting/header.tex \
    "$(command -v "$PANDOC")" "$OUT"
  printf '\nSHA-256 of font files recorded by XeLaTeX (if exposed by the engine):\n'
  awk '/^INPUT / {sub(/^INPUT /, ""); if ($0 ~ /\.(ttf|otf|ttc)$/) print}' \
    "$BUILD/essay.fls" | sort -u | while IFS= read -r font; do
      "${HASH[@]}" "$font"
    done
  if command -v pdfinfo >/dev/null; then printf '\nPDF information:\n'; pdfinfo "$OUT"; fi
  if command -v pdffonts >/dev/null; then printf '\nEmbedded fonts:\n'; pdffonts "$OUT"; fi
  printf '\nTypography warnings:\n'
  grep -E 'Missing character:|Overfull \\[hv]box' "$BUILD/essay.log" || printf 'None.\n'
  printf '\nVisual review is separate from this automated receipt.\n'
} >"$OUT.build.txt"
printf 'Built %s\n' "$OUT"
printf 'Receipt: %s.build.txt\nLaTeX log: %s.build.log\n' "$OUT" "$OUT"
