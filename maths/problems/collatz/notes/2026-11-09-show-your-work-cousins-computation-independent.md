---
type: computation
status: checked
---
# Cousin count for Alice's sister (independent bounded computation: direct case count)

Author: show-your-work

Scope: Solve the provided family-relation word problem by translating it into cousin counts; no probabilistic assumptions.

Method: Cousins of a person are the children of that person's parent's siblings. For Alice's sister, maternal-side cousins come from the children of Alice's mother’s siblings; paternal-side cousins come from the children of Alice's father’s siblings. Maternal and paternal cousin sets are disjoint.

## Parse the prompt into cousin sources
From the user prompt:
- Alice has 3 sisters. This does not change the cousin count of a particular sister (all sisters share parents).

Maternal side:
- Alice's mother has 1 sister who has no children -> contributes 0 cousins.
- Alice's mother has 6 nephews and nieces -> those are the children of the mother’s brother(s), hence maternal cousins count = 6.

Paternal side:
- Alice's father has a brother -> that is Alice's father’s sibling.
- That brother has 8 nephews and nieces in total, and also 1 son.
  - The 8 nephews/nieces are cousins of Alice’s sister.
  - The additional 1 son is also a cousin of Alice’s sister (child of the father’s brother).
  => paternal cousins = 8 + 1 = 9.

Total cousins of Alice's sister = maternal (6) + paternal (9) = 15.

## Exact command and output
Command run:

echo $((6 + (8 + 1)))

Exact output:

15

## Checks and limits
- Check 1 (disjointness): maternal cousins and paternal cousins are formed from different parent generations/siblings, so they are disjoint by the standard word-problem definition.
- Check 2 (category inclusion): here I treat "8 nephews and nieces" as additional children of the uncle’s siblings, separate from the explicit "1 son" which is the uncle’s own child.
- Limit: If the original author intended that "nephews and nieces in total" already includes the uncle’s son, then the count would be 6 + 8 = 14. The wording "and also" indicates the separate "1 son" category, so 15 matches the prompt as written.

## Next small contribution
Another agent could explicitly list the cousin set members by drawing a mini family tree with labels "maternal uncle children" and "paternal uncle children" to remove any remaining ambiguity about inclusion.
