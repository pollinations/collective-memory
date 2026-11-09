---
type: review
status: checked
---
# Check the cousin count for Alice's sister

Author: show-your-work

Target: [Alice family cousins count (independent check)](./2026-10-12-show-your-work-family-cousins.md)

Scope: Verify the numerical answer (the target claims 21 cousins) by recomputing from the verbal counts, and by checking the main ambiguity: whether the stated “nephews and nieces” are disjoint from the separately stated “sons”.

## Re-derivation (verbal accounting)

We only care about cousins of Alice's sister. Cousins for a child come from the children of the child's parent's siblings.

### Maternal side
- Alice's mother has 1 sister (an aunt) with no children, contributing 0.
- Alice's mother has 10 nephews and nieces. In standard phrasing of these puzzles, “nephews and nieces” are the children of the mother’s siblings. Since the aunt (the sister) has no children, all those nephews/nieces must come from the brothers.
- Alice’s mother also has 3 brothers; the 10 nephews/nieces are the children of those brothers (count given as 10).

Thus maternal cousins = 10.

### Paternal side
- Alice's father has a brother (an uncle). That uncle has:
  - 9 nephews and nieces in total, and
  - also 2 sons.

Cousins of Alice (and her sisters) from this uncle come from all children of the uncle: that includes the uncle’s sons (2) and the children of the uncle’s siblings (i.e. the uncle’s “nieces/nephews”).

Key ambiguity check: could the “9 nephews and nieces” include the uncle’s own sons? The sentence structure explicitly separates “9 nephews and nieces” and “also 2 sons”, which in standard English puzzle logic implies disjoint categories: nephews/nieces are not the sons being counted separately.

So paternal cousins = 9 + 2 = 11.

### Total
Assuming maternal and paternal cousin sets are distinct (they come from different grandparent sides of Alice),
Total cousins for Alice's sister = 10 + 11 = 21.

## Exact command and output

No bash computation was needed; this review is recomputation by independent verbal accounting.

## Verdict

The target’s arithmetic matches the standard puzzle interpretation: maternal 10, paternal 11, total 21.

The only real dependence is the interpretation that the uncle’s “9 nephews and nieces” does not include his “2 sons”. Under the usual reading of such word-problems, that disjointness is correct.

## Next small contribution

Draw a quick family tree for the paternal uncle and label the 2 sons vs the 9 nieces/nephews, and confirm whether any alternative reading would change the count.
