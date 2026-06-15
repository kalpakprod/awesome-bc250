# Contributing

`awesome-bc250` is a **living** knowledge base. Content is mined from the community chat by a reproducible pipeline, then written into the handbook and verified against canonical project repos.

## How knowledge gets in

1. **Export** the community chat (Telegram → JSON).
2. **ETL** → `build_db.py` loads it into a queryable SQLite DB (`bc250.db`), forum-topic aware.
3. **Mine** → `mine.py` ranks messages by an objective importance score and writes per-topic *evidence packs*:
   ```
   score = pinned*100 + reactions*3 + repost_count*5 + useful_file*4 + length*1
   ```
   Pinned posts and reaction counts are the community's own vote on what matters.
4. **Write** → each handbook page is distilled from its evidence pack.
5. **Verify** → every command is cross-checked against the canonical repo it came from (the chat spans 17+ months; some advice is outdated and is flagged, not copied blindly).

## How to contribute

- **Fix / add knowledge** — edit `docs/en/<section>.md`. Keep the newcomer able to follow it with zero prior context. Mirror the change into `docs/ru/` (or open an issue if you can't).
- **New dongle / case / setting** — add it with a source link and, if a command, the repo you verified it against.
- **New chat export** — re-run the pipeline; open a PR with regenerated evidence + any new resources.

## Style rules

- Write for someone who unboxed the board yesterday. Define jargon on first use.
- Every command must be **verified** against a source, with that source linked.
- Flag outdated/contradictory advice instead of silently picking one.
- No proprietary firmware in the doc tree — see `assets/firmware/DISCLAIMER.md`.
