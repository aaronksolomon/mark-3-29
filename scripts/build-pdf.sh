#!/usr/bin/env bash
# Reproducible, text-only source build; generated files stay outside the repository.
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
OUT="${1:-${TMPDIR:-/tmp}/mark-publication/all-will-be-forgiven.pdf}"
mkdir -p "$(dirname -- "$OUT")"
OUT="$(cd -- "$(dirname -- "$OUT")" && pwd -P)/$(basename -- "$OUT")"
if [[ -L "$OUT" ]]; then
  echo "Refusing a symbolic-link output path: $OUT" >&2
  exit 1
fi
case "$OUT" in
  "$ROOT"/*) echo "PDF output must be outside the repository: $OUT" >&2; exit 1 ;;
esac
for tool in pandoc xelatex; do
  command -v "$tool" >/dev/null || { echo "Required tool missing: $tool" >&2; exit 1; }
done
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
pandoc essay/working-draft-v4.md \
  --from=markdown+footnotes --standalone \
  --lua-filter=typesetting/publication.lua \
  --metadata-file=typesetting/metadata.yaml \
  --include-in-header=typesetting/header.tex \
  --output="$BUILD/essay.tex"
for pass in 1 2; do
  xelatex -interaction=nonstopmode -halt-on-error -no-shell-escape \
    -output-directory="$BUILD" "$BUILD/essay.tex" >"$BUILD/compile.log" 2>&1 || {
      cat "$BUILD/compile.log" >&2
      exit 1
    }
done
if grep -E 'Missing character:|Overfull \\[hv]box' "$BUILD/essay.log"; then
  echo "Typography warnings above require review." >&2
fi
cp "$BUILD/essay.pdf" "$OUT"
printf 'Built %s\n' "$OUT"
