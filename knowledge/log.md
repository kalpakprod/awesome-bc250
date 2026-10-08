---
type: Log
title: Update log
---

# Directory Update Log

This log records documentation/source work. Historical author reports are not new hardware measurements by this review.

## 2026-10-08

- The EN/RU/UK starting pages now describe a baseline board-to-first-game route, with hardware-renderer checks and recovery rather than mandatory BIOS flashing or overclocking.
- Remaining power, governor and display corrections distinguish LED measurements from inferred green-state behavior, the packaged SMU profile from the source-checkout profile and SMU-plus fork, and kernel clock bugs from historical adapter/codec reports.
- The fixed elektricM delta (`0524002c3be78e9926a3fc6fb9b40415b7b43b1f` → `954b706f0f2a426385229507c1acba00cc812f66`) contains 55 commits and 32 changed files. Their patches were read; the per-file decisions and limits are recorded in [source review](../SOURCE_REVIEW.md), not described as a whole-project or hardware certification.
- The recent accessible chat snapshots were scanned for project links. 64 leads outside the catalog URL set received direct GitHub metadata readback; significant forks were compared with parent revisions. The thematic catalog preserves distinct continuations and unsuccessful experiments without treating copied files as independent evidence.
- Current Windows development is no longer described as categorically impossible: D-Ogi reports one-unit rendering trials, with open recovery/stability/conformance work. The handbook and FAQ distinguish that stack from older attempts and from a first-build recommendation.
- Ukrainian navigation and changed procedures were aligned with the EN/RU chapters. This is not a claim that every historical quoted community observation is current.
- Coverage limits remain: two known Discord channels returned `50001` (missing access) on fresh readback; unknown archived threads, attached media and unverified chat-only claims remain outside closure. Queue selection is not semantic or hardware verification. See [source status](../SOURCE_STATUS.md).
- No firmware flashing, wiring, driver installation, OS rebase or hardware stress run was performed for this documentation pass.

## 2026-08-18

- Refreshed chat coverage: the bundle previously stopped at 2026-06-18. Added 260 facts
  extracted from 4,936 Telegram messages spanning 2026-06-18 to 2026-08-17, distributed
  across all twelve concepts. Every added fact carries a working message link generated
  from the message id, not produced by a model.
- New file: [hands-on.md](hands-on.md) — 18 first-party findings measured on a single
  working build (CachyOS, kernel 7.1.8, gamescope, AIC8800D80 dongle). These have no chat
  citation by design; each states the command output or log line it rests on. Single-board
  results: reproducible method, not population statistics.
- Known gaps in this pass: Telegram export is capped at 200 messages per request, so busy
  days are partially covered; Discord history could not be paged through the browser, so
  only currently rendered messages and forum thread openers were captured.

## 2026-06-18

- Initial bundle: 9961 facts, 12 concepts. Sources: Discord channels + forum threads, Telegram, Reddit (r/BC250Gaming + keyword sweep), the elektricM amd-bc250-docs manual, and 19 canonical GitHub repos. Chat facts are reaction-ranked; all run through an anti-hallucination pipeline where attribution is mapped from the source, not the model.
