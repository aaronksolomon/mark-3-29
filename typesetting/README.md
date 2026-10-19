# Building the reading PDF

The active Markdown essay is the only content source. Pandoc converts its
ordinary Markdown footnotes to numbered page footnotes. A small Lua filter moves
the leading title and subtitle into the title block and promotes section levels;
it does not change the essay's wording. It keeps standalone verse labels with
their text, binds footnote callouts to the preceding punctuation, and keeps the
closing paragraph intact. It also keeps block quotations with their attributions and the language-study heading with its first verse. A `bibliography` fenced div receives hanging indents
and compact spacing, and its heading starts a new page. The PDF has embedded Noto Serif fonts,
polytonic Greek coverage, clickable source links, bookmarks, and page numbers. Running headers are omitted for a consistent, quiet page design. Hyphenation is constrained to avoid one-letter fragments and word breaks across pages.
Generated PDFs normally stay outside this repository, as do TeX intermediates
and font binaries. At Aaron's request, `output/pdf/all-will-be-forgiven-v4-noto.pdf`
is retained as a build snapshot. Rebuild it after source changes when a current
reading copy is needed. The build script continues to require an output path
outside the repo; copy the reviewed PDF and receipt into `output/pdf` afterward.

## Requirements

- Pandoc 3.x (tested with 3.1.11.1)
- XeLaTeX / TeX Live, including fontspec, geometry, hyperref, bookmark,
  microtype, fancyhdr, titlesec, needspace, footmisc, and the standard Pandoc
  LaTeX template dependencies
- System fonts: Noto Serif, Noto Sans, DejaVu Sans Mono
- Optional review tools: Poppler (`pdfinfo`, `pdftoppm`, `pdftotext`)

On Debian/Ubuntu these are supplied by `pandoc`, `texlive-xetex`,
`texlive-latex-extra`, `fonts-noto-core`, `fonts-dejavu-core`, and `poppler-utils`.

### macOS setup

The local setup verified on October 16, 2026 uses macOS 15.6.1 (Apple Silicon),
MacTeX / TeX Live 2024, Pandoc 3.1.11.1, Noto Serif 2.015, Noto Sans 2.015,
DejaVu 2.37, and Homebrew Poppler. The original review did not record its OS,
TeX version, or font versions, so these are the local versions, not a claim
of an identical historical environment.

Homebrew supplies the fonts and review tools:

```sh
brew install --cask font-noto-serif font-noto-sans font-dejavu
brew install poppler
```

If XeLaTeX is absent, install MacTeX (including its LaTeX packages). This Mac
already had TeX Live 2024 and all packages needed by the build.

The Noto Serif 2.015 cask installs variable fonts. Its downloaded package also
contains static fonts. The four static faces have been installed into
`~/Library/Fonts` from the cask's `NotoSerif/hinted/ttf` directory:
`NotoSerif-Regular.ttf`, `NotoSerif-Bold.ttf`, `NotoSerif-Italic.ttf`, and
`NotoSerif-BoldItalic.ttf`. Keep these available to XeLaTeX.

Pandoc 3.1.11.1 is installed separately under
`~/.local/share/mark-3-29/tools/pandoc-3.1.11.1-arm64/bin/pandoc`, from the
[official release](https://github.com/jgm/pandoc/releases/tag/3.1.11.1).
The downloaded `pandoc-3.1.11.1-arm64-macOS.zip` has SHA-256
`fa38ad91d8f1f09549ae16830ade3a26650b03cb9a29c68b41b55ea7fab0aa2d`
(locally measured, not an independently published checksum). Homebrew's
Pandoc remains installed separately. Use the command below to select the
documented 3.1.11.1 version explicitly.

On this Mac, sandboxed XeLaTeX could not resolve the installed fonts, while
the same build with access to macOS font services succeeded. Run from a normal
Terminal session; an agent may need approved execution outside its sandbox.
Font lookup failure alone does not establish that a font is missing.

## Build

From the repository root:

```sh
bash scripts/build-pdf.sh /tmp/mark-publication/all-will-be-forgiven.pdf
```

For the installed macOS setup matching the documented Pandoc version:

```sh
PANDOC="$HOME/.local/share/mark-3-29/tools/pandoc-3.1.11.1-arm64/bin/pandoc" \
  bash scripts/build-pdf.sh /tmp/mark-publication/all-will-be-forgiven-v4-noto.pdf
```

`PANDOC` may name any installed Pandoc executable; it defaults to `pandoc` on
`PATH`. Each successful build also writes `<output>.build.txt` (source commit,
working-tree status, tool versions, source/PDF hashes, recorded font hashes,
PDF information when Poppler is available, and typography warnings) and
`<output>.build.log` (the final LaTeX log). These remain beside the PDF outside
the repository. The receipt records the build; visual review is still required.

An omitted output argument uses that path under the system temporary directory.
Temporary TeX/font caches are isolated and removed after the build. The script rejects output paths inside the repository. It does not install
software or change system configuration. For Debian containers missing a TeX
filename index or XeLaTeX format, it permits direct package lookup and builds
the format in its temporary cache; these generated files are removed on exit.
The result is reproducible from these sources and installed dependencies;
byte-identical output is not promised across TeX/font versions or timestamps.

## Review

```sh
pdfinfo /tmp/mark-publication/all-will-be-forgiven.pdf
pdftotext /tmp/mark-publication/all-will-be-forgiven.pdf -
mkdir -p /tmp/mark-publication/review
pdftoppm -r 130 -png /tmp/mark-publication/all-will-be-forgiven.pdf \
  /tmp/mark-publication/review/page
```

Inspect every rendered page for Greek glyphs, line breaks, notes, orphaned
headings, and clipping after any content or layout change.
