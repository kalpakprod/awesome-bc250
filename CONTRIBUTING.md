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

## Integrating knowledge into the handbook

1. Identify the actual project, release or hardware finding. Any source platform can lead to it; popularity and reaction counts do not establish correctness.
2. Read the primary documentation and record its observation date or revision. Compare significant forks and keep platform/version requirements explicit.
3. Write a self-contained explanation in the relevant handbook chapter: purpose, prerequisites, selection, installation, expected verification, limitations and rollback when the source provides it. Do not invent missing procedures; identify the gap.
4. Add the canonical project/model link to the shared thematic catalog. Keep public message references as evidence metadata, not as a separate platform-specific collection the owner must search.
5. Reconcile the updated finding with previous advice in that chapter and navigation. Translate the changed section into EN/RU/UK and check links. Preserve historical sources with dates rather than maintaining obsolete recommendations.

This repository does not depend on the original chat-export scoring/ETL infrastructure. Reproducible source observations are useful, but the public guide must remain usable without a private database, export or cache.

## How to contribute

- **Fix / add handbook knowledge** — edit `docs/en/<section>.md`. Keep the newcomer able to follow it with zero prior context. Mirror the change into `docs/ru/` and `docs/uk/`, or explicitly document any translation lag.
- **New dongle / case / setting** — add it with a source link and, if a command, the repo you verified it against.
- **New source findings** — submit edited handbook guidance and canonical project records, with public evidence. Do not publish raw chat exports or require readers to run a private extraction pipeline.

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
