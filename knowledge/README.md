# BC-250 Knowledge Bundle

A machine-readable companion to the handbook: **10,221 community facts** about the
AMD BC-250, each one linked back to the message, post, or page it came from.

The handbook in [`docs/`](../docs/) is the curated, human-written guide. This bundle
is the raw material behind it — the unsummarised pile of things people actually
discovered, tested, and argued about, with citations intact so you can check any
claim yourself.

## What's here

Twelve concept files, one per topic, in [Open Knowledge Format](https://github.com/GoogleCloudPlatform/knowledge-catalog)
(YAML frontmatter + markdown). [`index.md`](index.md) lists them with fact counts:

| Concept | Facts | | Concept | Facts |
|---|--:|---|---|--:|
| [Linux drivers & setup](linux.md) | 2541 | | [Cases](cases.md) | 451 |
| [Cooling](cooling.md) | 1602 | | [Display](display.md) | 285 |
| [Overclock & undervolt](overclock.md) | 1268 | | [WiFi & Bluetooth](wifi-bt.md) | 234 |
| [Power supply & wiring](power-supply.md) | 1120 | | [AI / LLM](ai-llm.md) | 178 |
| [Hardware facts](hardware.md) | 965 | | [USB & storage](usb.md) | 92 |
| [BIOS & flashing](bios.md) | 765 | | [Gaming](gaming.md) | 720 |

Alongside them sits [`hands-on.md`](hands-on.md) — 18 findings measured directly on a
working build rather than collected from chat. It deliberately breaks the citation rule
above: there is no message to link, so each item quotes the command output or log line it
rests on instead. One board, so treat it as a reproducible method, not a statistic.

Each fact is one bullet:

```
- <fact, one sentence> — <author> (re<reactions>, <date>) · _<thread/sub>_ [[n]](source-link)
  - src: <verbatim source snippet>
```

The `src:` line is the original quote the fact was drawn from, so attribution is never
guessed — you can read the source and judge the claim.

## Where the facts come from

| Source | What |
|---|---|
| **Discord** | The BC-250 server: 7 channels + 440 forum threads. |
| **Telegram** | The Russian-language BC-250 community (~128k messages). |
| **Reddit** | r/BC250Gaming plus a keyword sweep across 38 related subs. |
| **elektricM docs** | The [`amd-bc250-docs`](https://elektricm.github.io/amd-bc250-docs/) manual (canonical, authored). |
| **GitHub** | READMEs + issues of 19 canonical BC-250 repos. |

## How it was built (and what that means for trust)

Facts were extracted by an LLM, but under a deliberately narrow leash:

1. **Reaction-gated** — chat messages need community upvotes (reactions/score ≥ 2) before
   they're even considered, so noise and unverified one-offs are filtered out. Authored
   sources (docs, GitHub) skip the gate.
2. **Attribution is mapped from the source, never written by the model.** The model only
   says *which lines* carry a fact; the author, date, reaction count, and deep-link are
   pulled from the original message by the pipeline. The model cannot invent a citation.
3. **Verbatim `src:` snippets** are attached so every fact is auditable.

**Honest caveats:**

- These are *community claims*, not vendor specs. A fact being here means someone said it
  and (for chat) others upvoted it — not that it's universally true. Cross-check anything
  load-bearing against the source link.
- Dedup is exact-match only. Near-duplicate phrasings of the same fact across sources still
  appear separately. A semantic merge pass is future work.
- LLM extraction can still misread a snippet. The `src:` line is your check.

## Using it

Grep it, feed it to a retrieval system, or read it like notes. Because it's plain
markdown with stable per-fact links, it drops straight into a RAG pipeline or an agent's
context. Start from [`index.md`](index.md).
