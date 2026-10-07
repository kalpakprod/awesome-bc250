# Contributing

`awesome-bc250` is a **project/resource catalog and a full handbook** for the ASRock AMD BC-250. The catalog maps the ecosystem; the handbook explains assembly, setup and use. Community reports and originating project documentation provide sources for both.

## Adding projects and resources

- Start with the [catalog](catalog/README.md), its [project records](catalog/resources.json), and the [discovery inventory](catalog/discovery.md). Search for an existing entry before adding a resource.
- Include every distinct resource whose relationship to BC-250 is established: code, firmware research, drivers, images, hardware mods, CAD, documentation, experiments, useful discussions and historical work. Stars, popularity and local installation success are not admission requirements.
- Describe **what the project does and how it differs**, link its canonical source and available documentation, and choose the relevant topic. Record a source revision/date when available; do not invent a pin or a compatibility result.
- Keep significant forks, continuations and alternative approaches discoverable. Explain an origin or replacement relationship only when the source supports it; an identical README is not proof of identical code or independent evidence.
- Retain archived, superseded and unsuccessful work with its status. Listing an experiment does not recommend running it. Keep unclassified search hits in the discovery inventory rather than presenting all search matches as board projects.
- Separate **existence/relevance** from **tested behavior**. A source-backed catalog entry does not require our board test; stability, electrical safety, performance and hardware-enablement claims do require evidence appropriate to that claim.
- Keep EN/RU/UK catalog identities and links in sync, update the public records with the descriptions, and preserve meaningful non-English resources. The external resource's language need not match the catalog language.
- For articles, videos, models and discussions, use the [topic bibliography](catalog/en/topics.md). Preserve attribution; do not copy raw private messages, attachments, credentials, signed URLs or local cache paths into a contribution.

## How handbook knowledge gets in

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

- **Fix / add handbook knowledge** — edit `docs/en/<section>.md`. Keep the newcomer able to follow it with zero prior context. Mirror the change into `docs/ru/` and `docs/uk/`, or explicitly document any translation lag.
- **New dongle / case / setting** — add it with a source link and, if a command, the repo you verified it against.
- **New chat export** — re-run the pipeline; open a PR with regenerated evidence + any new resources.

## Translation status

- **`docs/en/` is the source of truth and `docs/ru/` is kept in sync** — mirror every change there.
- Supported languages are English (`en`), Russian (`ru`) and Ukrainian (`uk`). The other language versions have been removed.
- Ukrainian remains an older snapshot until its factual content is checked against EN/RU; do not treat the language selector as a claim that all three versions are synchronized.
- When you correct a factual claim in EN, note that this also invalidates any translated copy of that sentence; refresh the translation or leave the lag documented here.

## Style rules

- Write for someone who unboxed the board yesterday. Define jargon on first use.
- Every command must be **verified** against a source, with that source linked.
- Flag outdated/contradictory advice instead of silently picking one.
- No proprietary firmware in the doc tree — see `assets/firmware/DISCLAIMER.md`.
