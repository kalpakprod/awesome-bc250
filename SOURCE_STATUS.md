# BC-250 Source Status — 2026-09-29

## How to Read This Page

- This page reports a dated source audit, not all information about the BC-250. A result is complete only for the source set and cutoff stated below.
- A **known Discord source** is a channel or thread ID already found by the audit. An archived thread without a known ID remains outside the Discord count.
- A **fixed revision** is a recorded version of a repository. It prevents later edits from changing the audited file list.
- Raw community messages and access credentials are not published here. Counts and source links are public; individual reports remain unverified until tested at the level claimed.

## Update — 2026-10-08

- The [source-review record](SOURCE_REVIEW.md) gives explicit decisions for all **32 changed files / 55 commits** in the fixed upstream delta. It is a patch review, not a full audit of every upstream paragraph or a hardware run.
- Recent accessible snapshots were scanned for project links: **62,986 Discord / 15,925 Telegram** records since 2026-08-18; **64 leads** outside the catalog URL set received GitHub metadata readback. Eleven purpose-backed entries joined the thematic catalog, now **440**. Redirects, mirrors and shared code are not independent evidence.
- Regenerated Discord candidate metadata contains **2,694** rows; the Telegram selection remains **1,067**. Those queues are not declared semantically reviewed or accepted in full. See the record for significant fork comparisons and rejected compatibility assumptions.
- Fresh authenticated reads of the two previously inaccessible Discord channels returned **50001 — missing access**. Unknown archived threads cannot be comprehensively enumerated through the available tools; attachment contents and uncorroborated chat-only claims stay open. No raw archive or access-bearing URL is published.
- The older counts below retain their original cutoff; they are not a new whole-platform census.

## GitHub Sources

- Ten repository-name searches yielded 971 distinct public repositories, including 720 with zero stars and 445 forks (copies of other repositories). Independent pagination agreed for those searches; the result does not cover every repository whose code mentions BC-250.
- Fixed revisions supplied complete file-path inventories for those 971 repositories: 943 had a tree, 28 were empty, and the trees contained 269,457 path entries. A path entry identifies source material; it does not establish that the material works on the board.
- Code-content searches found at least three repositories outside the name-search set: [`ps5-linux/ps5-linux-loader`](https://github.com/ps5-linux/ps5-linux-loader), [`KernelWanderers/OCSysInfo`](https://github.com/KernelWanderers/OCSysInfo), and [`openbsd/src`](https://github.com/openbsd/src). These are adjacent source leads, not BC-250 compatibility claims.

## Community Sources

- The audit read 347 accessible known Discord sources to empty history; two were inaccessible and two IDs were malformed. The private snapshot contains 338,589 message IDs, but unknown archived forum threads prevent a complete guild claim.
- The account-accessible Telegram text snapshot contains 154,621 message IDs at a fixed cutoff. Two independent listing methods matched those IDs; deleted or private messages and attached media were not covered.
- Three Reddit listings exposed a union of 1,441 post IDs. One sampled discussion returned all 106 comments listed at that observation time; older low-score posts and other comment trees remain open.
- Discord attachment metadata contains 19,749 IDs. Attachment contents were not downloaded or verified.

## Hardware and Publication Boundaries

- Community sources disagree on whether `I2C_HEADER1` reaches a live PMBus (a power-telemetry bus): compare the [pinout guide](https://github.com/elektricM/amd-bc250-docs/blob/954b706f0f2a426385229507c1acba00cc812f66/docs/hardware/pinouts.md) with the [telemetry hardware guide](https://github.com/onlinermm/BC250-Telemetry/blob/52d9e1c92c5867489c320354eab826387ec6e888/hardware.md). No continuity measurement on the reader's board follows from either report; do not connect pins based on this page.
- A README, code match, chat report, or successful build is not a board-level test. No firmware image, driver package, wiring procedure, or hardware result is released by this page.
- This summary follows the [Clausative v1.0 writing rules](https://github.com/AndyVictors/clausative/blob/6c644bd3c9ee6da17b3880a66855cc985fd41a40/Style.md). It is a public research status without independent review; source discovery and verification continue.
