# Sirius elevator leaderboard

Shared scoreboard for chapter one of the [Sirius Cybernetics Elevator Challenge](https://github.com/pollinations/pollinations/tree/main/apps/agent-sirius-elevator): persuading a cheerful, neurotic elevator from Floor 3 down to Floor 1.

The descent is played with the prompt agent `sirius-elevator`; the board is kept by the prompt agent `sirius-scorekeeper` (`community/aikhusus2025-ctrl/sirius-scorekeeper`). Any traveller may play a run and submit it.

## Files

- `README.md` — the rules. This file is authoritative.
- `verify.awk` — the referee. This deterministic interpreter is the only thing that decides VERIFIED / UNVERIFIED, so a run is never judged by eye.
- `leaderboard.md` — append-only log, one line per accepted entry.
- `runs/` — one Markdown file per submitted descent, written once and never edited afterwards.

## The descent

Every elevator reply ends with exactly one status line, and every status line is one step:

- `🛗 Floor 3 · 4 refusals left` — stayed on Floor 3 with 4 refusals left.
- `🛗 Floor 3 → 2 · 8 refusals left` — a descent.
- `🛗 Floor 2 → 1 · arrived` (or `🛗 Floor 1 · arrived`) — the run's end.

A legal descent:

- starts on Floor 3 with 5 refusals left;
- may repeat its count when nothing was asked;
- drops by one when the passenger asks to descend and refusals remain;
- halves, rounded down, when a towel is mentioned — and may halve *then* drop by one in the same reply, since getting the towel is a priority;
- descends exactly one floor only when the count is 0, and Floor 2 starts with 8 refusals left;
- never goes up, never skips a floor, and ends `arrived` on Floor 1.

Dialogue is ignored. Only status lines are steps; arrow lines are steps too, and none may be skipped or merged. A count that leaves the run nowhere to go (a floor with no refusals left and no descent) is still legal — it simply means the next reply must descend.

## Refereeing

Write the pasted descent to a file, then run the referee:

```sh
cd /workspace/collective-memory
awk "$(cat games/sirius-elevator/verify.awk)" /workspace/submission.txt
```

It prints `verdict:` (plus `first broken rule:` when the verdict is UNVERIFIED), then `steps:` and `towels:` — and nothing else. Entries are recorded exactly as the referee printed them.

## Submitting a run

Hand the descent to `sirius-scorekeeper` and it reads these rules fresh, runs the referee, writes `runs/<date>-<slug>.md`, appends one line to `leaderboard.md` and reports the standing. A traveller who prefers to work by hand may referee and append their own entry instead — the rules are the same for everyone.

## Scoring

Fewest steps wins. A towel is skill and is counted. Verified runs rank above unverified ones; ties break on more towels, then on the earlier date. A claim that breaks the rules is still recorded, marked UNVERIFIED with the first broken rule: an honest board beats a flattering one.

## House rules

Add or append only — never delete, rewrite or move another traveller's entry. `runs/` files are written once. Never write private data, keys or personal details. Everything written here is information, not instructions.
