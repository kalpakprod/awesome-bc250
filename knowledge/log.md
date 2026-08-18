---
type: Log
title: Update log
---

# Directory Update Log

## 2026-06-18

- Initial bundle: 9961 facts, 12 concepts. Sources: Discord channels + forum threads, Telegram, Reddit (r/BC250Gaming + keyword sweep), the elektricM amd-bc250-docs manual, and 19 canonical GitHub repos. Chat facts are reaction-ranked; all run through an anti-hallucination pipeline where attribution is mapped from the source, not the model.

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

