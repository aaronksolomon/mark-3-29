# Publication polish: editorial and verification record

**Prepared:** October 14, 2026. **Branch:** `publication-polish`. **Base:** `main` at `229d3c0`. Aaron requested a clear, accessible, elegant, carefully referenced essay, retaining his voice and allowing whatever length contributes meaning. He subsequently required the original v3 to remain intact. The branch was initially kept separate; it was later merged into `main` as v4 after the pre-publication v3 draft and outline were frozen for comparison.

The publication candidate is now the active [v4 draft](../essay/working-draft-v4.md), renamed from `working-draft-v3.md` when this branch was merged. It is assistant-assisted editorial work under Aaron Solomon’s direction, not newly supplied personal testimony. The immediately preceding v3 draft and outline are preserved in the frozen comparison files; other prior drafts, the alternate, dated reviews, and archives remain unchanged.

## Initial publication pass

### What changed

- Preserved the six-section progression, inclusive voice, full italicized NIV opening, complete print-visible Greek study, section 6 title, and final question.
- Made the central distinction explicit early: what the saying declares, what the act of warning may seek, and what ultimately happens to its hearers are related but not interchangeable.
- Strengthened the reasons for the comparisons in section 5. Humanity returns attention to the act of address; the only-child image concerns particular care; non-totalizing description preserves responsibility; lived time concerns the continuation of the past, not a softened translation of “never”; compassionate speech returns directly to Mark’s encounter.
- Kept the strongest contrary evidence in the body: Mark’s negative temporal idiom, Matthew’s two ages, Mark 4’s concealment, the possibility of enduring consequences, and the distinction between a change in perception and divine forgiveness.
- Added an explicit check on the preferred reading itself: disagreement is not evidence of a closed heart, and compassion cannot be used to insulate an interpretation from correction.
- Added 54 print footnotes and a categorized bibliography with direct source links. The [source map](publication-source-map.md) connects the public-facing notes to existing research dossiers. Footnotes include fuller nineteenth-/early-twentieth-century passages from Chrysostom, Augustine, Aquinas, and MacDonald, rather than expanding copyrighted modern quotations.
- Supplied translator names, stable section numbers, edition details, and the dual numbering for Augustine’s sermon. Corrected the description of Catechism §1864’s opening and the final punctuation of SBLGNT Mark 3:28.
- Added reproducible, text-only [PDF build files](../typesetting/README.md). Generated PDFs and temporary TeX files remain outside the repository.

### Source verification

All 35 substantive NIV quotations across 33 passage units, plus three metalinguistic snippets and their repetitions, were also compared with the displayed 2011 text; the initial capital in the shortened Mark 8:18 excerpt is now bracketed. Live checks on October 14 covered the displayed SBLGNT Mark 3:28–30; the Peshitta phrases in Dukhrana’s BFBS/SEDRA display; Bratcher and Nida’s online handbook excerpt; named Christian reception quotations and context; Catholic conciliar and Catechism passages; the Jewish Hebrew comparison clauses; Sirach’s NRSVUE excerpts; the Fourteen Trainings, Bat Nha letter, Thích Nhất Hạnh interview and Discourse on Love; Laity’s written teaching; MN 58 in the identified translation; and the USHMM historical synthesis. Bibliographic information was taken from the consulted editions rather than inferred from a title alone. The footnote on time uses Blocher’s bounded methodological discussion, not every conclusion of the article.

These are displayed-text and English-translation checks, with targeted Hebrew and Syriac phrase checks. They are not collation of manuscript images, a complete textual apparatus, original-language patristic editions, or an exhaustive scholarly literature review. The essay does not rely on unconsulted books in the acquisition queue.

The four brief quotations from the Fourteen Trainings total 21 words. The Catechism’s human-mind phrase was paraphrased to keep the combined modern quotations brief while retaining its human-heart wording and doctrinal context. Sirach excerpts total 20 words. Public-domain documentary excerpts retain their punitive or otherwise difficult contexts; no comforting sentence is represented as the whole source’s position.

## Before submission to a publisher

1. Aaron’s final voice and argument review remains the authorial decision. No external submission or public release beyond the requested Git branch is part of this work.
2. A competent Greek/Hebrew/Syriac reader, a Jewish reader of the historical framing, and a principled contrary theological reader would provide useful independent review. This is a recommendation for further scrutiny, not a claim that those reviews have occurred.
3. Select the outlet and its citation style. The present apparatus uses human-readable author/work/locator notes and a linked bibliography; it is not formatted to a particular journal’s house style.
4. Check the intended publication medium against the current [Biblica permission guidance](https://www.biblica.com/permissions/) and [NRSVUE permission guidance](https://www.friendshippress.org/pages/nrsvue-quick-faq). The inherited NIV excerpts and required acknowledgment remain. Biblica separately directs commercial print distribution to territorial partners; no blanket commercial clearance or individual license is claimed. No license for the essay itself has been added or changed.
5. Specialist manuscript history and fuller semantic-history research remain in [the research queue](../sources/to-find.md); they are not prerequisites silently represented as completed work.

## Initial build and preservation checks

The final reading PDF has 21 pages, 54 consecutively numbered page-footnotes, embedded Greek-capable fonts, clickable source links, bookmarks, and Aaron Solomon’s byline. Every rendered page was inspected; the final build reports no missing-character or overfull-box warnings. Footnote definitions and calls match, the Greek apparatus contains all three verses, and local documentation links resolve. The build refuses an output path inside the repository.

Before committing, the remote main head remained `229d3c0acaab4d0437b6b334e25cffa8d2df0c56`. The original v3 on main has SHA-256 `d3d25bc18fc9980901e25934b62f42c6235de9976736f6b45078a2dbb90fbd4f`; all preserved drafts, their outlines, reviews, and archives have an empty diff. The PDF is a delivery artifact, not a committed binary.


## Author-directed revision after c448513

The October 14 author commit was fetched and inspected before editing. Its seven changes guide this pass: “a Warning” in the subtitle; more measured claims about compassion; disruption of harmful speech and possible effect on witnesses; the named Order of Interbeing; the explicit request for a concrete Jewish counterpart; “confront” rather than “unsettle”; and the more open conclusion. Grammar was repaired and source apparatus retained rather than applying the main-branch patch mechanically. Main and its v3 were not modified.

### Substantive additions and verification

- The opening now includes Mishnah Eduyot 1:4 and a brief Jonathan Sacks quotation. Section 4 develops Eruvin 13b’s practice of learning and presenting another school’s view. Rabbi Akiva’s final words in Yoma 8:9 complete the earlier account of obligation with the same unit’s hope of divine purification.
- New Jewish passages were checked against the displayed Hebrew/Aramaic at Mechon Mamre; Sacks’s exact sentence was checked in his official essay. The marked study renderings are project translations, not published English editions. No independent specialist certification is claimed. Chronological and conceptual limits are explicit.
- The Syriac paragraph now includes the attested forgiveness clause and the noun’s remission usage. Dukhrana’s BFBS/SEDRA display and CAL’s lexical entry were inspected; the Deuteronomy example is a directly inspected lexical citation, not a new manuscript collation. Jesus’s exact Aramaic remains unrecovered, and the denial of forgiveness is not softened.
- Walter Wink’s *Jesus and Nonviolence* chapter 2 was inspected, and the quoted sentence visually checked on printed p. 26. The publisher and edition record corroborate bibliographic details. His authorized online essay supplies the explicit distinction between nonviolence and absence of coercive pressure. Matthew 5 is his immediate subject; the Mark application is this essay’s qualified comparison.
- The crowd-framed setting is checked against Mark 3:20–35. Jesus summons the scribes in 3:23; wider effects are plausible, not newly asserted narrative facts. No successful change in anyone’s mind is claimed.
- Independent editorial review checked the new claims, quotations, footnote calls, author-framing integration, and distinctions among textual observation, later interpretation, and constructive comparison. Local refinements clarified the Sacks referent and Syriac wording. This is not a substitute for external theological or language-specialist review.

### Current build and preservation checks

The revised PDF is generated from the same single Markdown source. It contains 59 defined footnotes, each called once. Visual review found and corrected a stranded language-study heading, a split quotation and attribution, one-letter hyphenation fragments, and words broken across pages. All 24 pages of the final render were inspected individually. Greek and romanized Hebrew/Syriac glyphs, all footnotes, page numbers, and linked bibliography render cleanly; the build reports no missing-character or overfull-box warnings. Quote and attribution remain together, and there are no stranded headings or clipped text.

Remote main at the start of this revision was `c448513`; its v3 SHA-256 was `57ff02bb0c0f93286c050abdcf46bd597e8d9e64836c9db7aa8a5202e656bdff`. Preserved versions, their outlines, reviews, and archives remain outside the change set. The publication branch alone receives the revised text and source/build records. No generated PDF or other binary is committed, and no publisher submission or merge into main is authorized or performed.


## October 16 flow-and-paradox pass

Aaron requested a whole-essay flow review and then approved a detailed revision centered on the role of paradox, reasoning, and deeper practical understanding. The active v4 remains the publication candidate; no new version or alternate draft was created.

The pass resolves the remaining inline author comments. It replaces the underdeveloped Mark 7 boundary-crossing example with Luke’s Good Samaritan; clarifies *grammateis* as scribes and uses Torah/interpretation language rather than modern legal associations; reframes Exodus 34 through mercy and accountability together; explains the Holy/impure contrast through Mark 3:30; locates Wink’s comparison in Matthew 5:38–42; and makes the “A saying that unsettles” subsection grow out of the summons/parables/warning sequence.

The language section now states the multilingual setting without assigning a language to the encounter, standardizes the literal Greek annotations, connects the Textus Receptus and Peshitta judgment wording, and bounds *l-ʿālam* and *aiōn* more carefully. Mark 4 now emphasizes that parabolic teaching can both reveal and expose an inability to hear.

The conceptual addition in section 4 distinguishes reasoning from attachment to a conceptual frame. A new ND-10 record uses Thích Nhất Hạnh’s official translation of the *Diamond Sutra* to illustrate a deliberate religious paradox in which conventional designation is not treated as exhaustive. The essay expressly does not classify Mark 3 as the same literary form. The comparison supports disciplined inquiry: reason, philology, history, experience, and contemplative insight may disclose different levels of meaning, while paradox is not permission for arbitrary interpretation.

The source apparatus adds Fassberg and Porter to the multilingual-language note and a new footnote `n63` for the Diamond Sutra comparison. The official Plum Village sutra text, Plum Village/Parallax book records, Exodus 34:6–7 NIV wording, Luke 10:33 NIV wording, and Mark 2:6 translation comparison were checked in this pass. The committed PDF was not rebuilt because no generated PDF is stored in the repository; any next publication render should be regenerated from the updated Markdown and visually rechecked.
