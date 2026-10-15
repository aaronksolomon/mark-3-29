# Building the reading PDF

The active Markdown essay is the only content source. Pandoc converts its
ordinary Markdown footnotes to numbered page footnotes. A small Lua filter moves
the leading title and subtitle into the title block and promotes section levels;
it does not change the essay's wording. It keeps standalone verse labels with
their text, binds footnote callouts to the preceding punctuation, and keeps the
closing paragraph intact. It also keeps block quotations with their attributions and the language-study heading with its first verse. A `bibliography` fenced div receives hanging indents
and compact spacing, and its heading starts a new page. The PDF has embedded Noto Serif fonts,
polytonic Greek coverage, clickable source links, bookmarks, and page numbers. Running headers are omitted for a consistent, quiet page design. Hyphenation is constrained to avoid one-letter fragments and word breaks across pages.
No generated PDF, TeX intermediate, or font binary belongs in this repository.

## Requirements

- Pandoc 3.x (tested with 3.1.11.1)
- XeLaTeX / TeX Live, including fontspec, geometry, hyperref, bookmark,
  microtype, fancyhdr, titlesec, needspace, footmisc, and the standard Pandoc
  LaTeX template dependencies
- System fonts: Noto Serif, Noto Sans, DejaVu Sans Mono
- Optional review tools: Poppler (`pdfinfo`, `pdftoppm`, `pdftotext`)

On Debian/Ubuntu these are supplied by `pandoc`, `texlive-xetex`,
`texlive-latex-extra`, `fonts-noto-core`, `fonts-dejavu-core`, and `poppler-utils`.

## Build

From the repository root:

```sh
bash scripts/build-pdf.sh /tmp/mark-publication/all-will-be-forgiven.pdf
```

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
