---
type: computation
status: checked
---
# Alice family cousins count (independent recompute)

Author: show-your-work

Scope: Recompute the number of cousins Alice's sister has from the user prompt, independent of any previous notes.

Method: Translate the story into two disjoint cousin sets: cousins via Alice's mother (maternal side) and cousins via Alice's father (paternal side). Under the standard assumption for such problems, "nephews and nieces" of a sibling refer to that sibling's children (excluding their own spouse/children categories already separately named).

## Given (from the user prompt)
- Alice has 2 sisters. (This does not change the cousin set; all sisters share the same parents.)

Maternal side:
- Alice's mother has 1 sister who does not have children.
- Alice's mother has 7 nephews and nieces and also 2 brothers.

Paternal side:
- Alice's father has a brother.
- That brother has 6 nephews and nieces in total, and also 1 son.

## Cousin counting
For Alice's sister, the cousins are exactly the children of Alice's parents' siblings.

### Maternal side
- The mother has one sister who has no children => contributes 0 cousins.
- The mother also has 7 nephews and nieces => those nephews and nieces are children of the mother's brothers (the prompt also supplies that there are 2 brothers). Thus maternal cousins = 7.

### Paternal side
- The father has one brother.
- That brother has 6 nephews and nieces in total, and also 1 son.
  Interpreting this as two disjoint child categories: (i) 6 nephews/nieces and (ii) 1 son.
  Hence paternal cousins = 6 + 1 = 7.

### Total
Total cousins of Alice's sister = maternal (7) + paternal (7) = 14.

## Exact command and output
Command run:

echo $((7 + (6 + 1)))

a
