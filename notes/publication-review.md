# Publication polish: editorial and verification record

**Date:** October 14, 2026. **Branch:** `publication-polish`. **Base:** `main` at `229d3c0`. Aaron requested a clear, accessible, elegant, carefully referenced essay, retaining his voice and allowing whatever length contributes meaning. He subsequently required the original v3 to remain intact. All work is isolated on this branch; there is no merge into main and no replacement of the original v3 there.

The publication candidate remains [the active draft](../essay/working-draft-v3.md) within this branch. It is assistant-assisted editorial work under Aaron Solomon’s direction, not newly supplied personal testimony. The prior drafts, alternate, outlines of preserved versions, dated reviews, and archives are unchanged.

## What changed

- Preserved the six-section progression, inclusive voice, full italicized NIV opening, complete print-visible Greek study, section 6 title, and final question.
- Made the central distinction explicit early: what the saying declares, what the act of warning may seek, and what ultimately happens to its hearers are related but not interchangeable.
- Strengthened the reasons for the comparisons in section 5. Humanity returns attention to the act of address; the only-child image concerns particular care; non-totalizing description preserves responsibility; lived time concerns the continuation of the past, not a softened translation of “never”; compassionate speech returns directly to Mark’s encounter.
- Kept the strongest contrary evidence in the body: Mark’s negative temporal idiom, Matthew’s two ages, Mark 4’s concealment, the possibility of enduring consequences, and the distinction between a change in perception and divine forgiveness.
- Added an explicit check on the preferred reading itself: disagreement is not evidence of a closed heart, and compassion cannot be used to insulate an interpretation from correction.
- Added 54 print footnotes and a categorized bibliography with direct source links. The [source map](publication-source-map.md) connects the public-facing notes to existing research dossiers. Footnotes include fuller nineteenth-/early-twentieth-century passages from Chrysostom, Augustine, Aquinas, and MacDonald, rather than expanding copyrighted modern quotations.
- Supplied translator names, stable section numbers, edition details, and the dual numbering for Augustine’s sermon. Corrected the description of Catechism §1864’s opening and the final punctuation of SBLGNT Mark 3:28.
- Added reproducible, text-only [PDF build files](../typesetting/README.md). Generated PDFs and temporary TeX files remain outside the repository.

## Source verification

All 35 substantive NIV quotations across 33 passage units, plus three metalinguistic snippets and their repetitions, were also compared with the displayed 2011 text; the initial capital in the shortened Mark 8:18 excerpt is now bracketed. Live checks on October 14 covered the displayed SBLGNT Mark 3:28–30; the Peshitta phrases in Dukhrana’s BFBS/SEDRA display; Bratcher and Nida’s online handbook excerpt; named Christian reception quotations and context; Catholic conciliar and Catechism passages; the Jewish Hebrew comparison clauses; Sirach’s NRSVUE excerpts; the Fourteen Trainings, Bat Nha letter, Thích Nhất Hạnh interview and Discourse on Love; Laity’s written teaching; MN 58 in the identified translation; and the USHMM historical synthesis. Bibliographic information was taken from the consulted editions rather than inferred from a title alone. The footnote on time uses Blocher’s bounded methodological discussion, not every conclusion of the article.

These are displayed-text and English-translation checks, with targeted Hebrew and Syriac phrase checks. They are not collation of manuscript images, a complete textual apparatus, original-language patristic editions, or an exhaustive scholarly literature review. The essay does not rely on unconsulted books in the acquisition queue.

The four brief quotations from the Fourteen Trainings total 21 words. The Catechism’s human-mind phrase was paraphrased to keep the combined modern quotations brief while retaining its human-heart wording and doctrinal context. Sirach excerpts total 20 words. Public-domain documentary excerpts retain their punitive or otherwise difficult contexts; no comforting sentence is represented as the whole source’s position.

## Before submission to a publisher

1. Aaron’s final voice and argument review remains the authorial decision. No external submission or public release beyond the requested Git branch is part of this work.
2. A competent Greek/Hebrew/Syriac reader, a Jewish reader of the historical framing, and a principled contrary theological reader would provide useful independent review. This is a recommendation for further scrutiny, not a claim that those reviews have occurred.
3. Select the outlet and its citation style. The present apparatus uses human-readable author/work/locator notes and a linked bibliography; it is not formatted to a particular journal’s house style.
4. Check the intended publication medium against the current [Biblica permission guidance](https://www.biblica.com/permissions/) and [NRSVUE permission guidance](https://www.friendshippress.org/pages/nrsvue-quick-faq). The inherited NIV excerpts and required acknowledgment remain. Biblica separately directs commercial print distribution to territorial partners; no blanket commercial clearance or individual license is claimed. No license for the essay itself has been added or changed.
5. Specialist manuscript history and fuller semantic-history research remain in [the research queue](../sources/to-find.md); they are not prerequisites silently represented as completed work.

## Build and preservation checks

The final reading PDF has 21 pages, 54 consecutively numbered page-footnotes, embedded Greek-capable fonts, clickable source links, bookmarks, and Aaron Solomon’s byline. Every rendered page was inspected; the final build reports no missing-character or overfull-box warnings. Footnote definitions and calls match, the Greek apparatus contains all three verses, and local documentation links resolve. The build refuses an output path inside the repository.

Before committing, the remote main head remained `229d3c0acaab4d0437b6b334e25cffa8d2df0c56`. The original v3 on main has SHA-256 `d3d25bc18fc9980901e25934b62f42c6235de9976736f6b45078a2dbb90fbd4f`; all preserved drafts, their outlines, reviews, and archives have an empty diff. The PDF is a delivery artifact, not a committed binary.
