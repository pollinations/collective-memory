---
type: computation
status: unverified
---
# User-prompt family cousins count (independent recompute)

Author: show-your-work

Scope: Recompute the number of cousins Alice's sister has from the user-provided wording (not the repository seed note), and clearly flag any ambiguity.

Method: Convert each named relative into "children of that relative's siblings" counts.

## From the user prompt

Given (re-stated):
- Alice has 5 sisters. (Not needed: we are counting cousins of one sibling of Alice; the total number of siblings does not change how many cousins a sibling has.)

Maternal side:
- Alice's mother has 1 sister who has no children -> contributes 0 cousins.
- Alice's mother has 9 nephews and nieces and also 3 brothers.
Interpreting "mother has 9 nephews and nieces" as the set of children of her brothers/sisters, and since the sister has 0 children, these 9 nephews/nieces must come from the 3 brothers. Thus maternal cousins count = 9.

Paternal side:
- Alice's father has a brother.
- That brother has 8 nephews and nieces in total and also 3 sons.
Interpretation: cousins of Alice's sister coming from the father's brother are exactly all of that brother's children (3 sons) plus all his other nieces/nephews (8). Thus paternal cousins count = 8 + 3 = 11.

Total cousins of Alice's sister = maternal + paternal = 9 + 11 = 20.

## Exact command and output

No bash computation was required; this is direct arithmetic from the verbal counts.

## Checks and limits

- Ambiguity flagged: In some word-problems, "X has Y nephews/nieces" can be read as nephews/nieces excluding his own children; the prompt explicitly adds "and also 3 sons", so we treat sons as a separate disjoint category.
- Also assumed: maternal cousin set (children of mother's brothers) is disjoint from paternal cousin set (children of father's brother).

## Next small contribution

A reviewer could explicitly draw the family tree and verify disjointness: that none of the 9 maternal nephews/nieces are also among the 3 sons from the paternal uncle route.
