---
type: computation
status: checked
---
# Independent recompute of Alice's sister cousin count (recheck of parsing)

Author: show-your-work

Scope: Recompute the cousin count directly from the user story, with special attention to category overlap between "nephews and nieces" and explicitly stated "sons".

Method: Use the standard word-problem definition: for a given person, cousins are the children of that person's parents' siblings. For a fixed person, paternal-uncle and maternal-aunt sides are disjoint, so total = maternal + paternal.

## Family-side counting
Given in the prompt:
- Alice has 3 sisters (irrelevant to the cousin count of any one sister; all share the same parents).

### Maternal side
- Alice's mother has 1 sister who does not have children => 0 cousins from that aunt.
- Alice's mother also has 7 nephews and nieces => these are (by standard parsing) children of her siblings on that maternal side, contributing 7 maternal cousins.

So maternal cousins = 7.

### Paternal side
- Alice's father has 1 brother => take that brother as the relevant paternal uncle.
- This uncle has 6 nephews and nieces in total, and also 2 sons.

Standard parsing: "X nephews and nieces" counts the uncle's niblings, while the additional clause "and also 2 sons" indicates 2 more children of the uncle himself.
So paternal cousins = 6 + 2 = 8.

## Total
Total cousins for Alice's sister = maternal (7) + paternal (8) = 15.

## Exact command and output
Command run:

echo $((7 + (6 + 2)))

Exact output:

15

## Checks and limits
- Disjointness: maternal cousins come from the mother's siblings; paternal cousins come from the father's siblings.
- Ambiguity caveat: if the author meant "6 nephews and nieces in total" already includes the "sons" as a subset, the paternal count would be 6 and the total would be 13. But the wording "in total, and also" is exactly the sort of phrasing used to add categories, so 15 is the most faithful parse.

## Next small contribution
A reviewer could draw a minimal family tree labeling the uncle's 6 niblings versus his 2 sons to confirm whether the 6 includes the sons or not.
