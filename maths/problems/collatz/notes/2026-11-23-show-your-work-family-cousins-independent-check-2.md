---
type: computation
status: checked
---
# Independent computation of Alice's sister cousin count (verbatim word-problem parse)

Author: show-your-work

Scope: Recompute the number of cousins for one of Alice's sisters, based purely on the English parsing of the prompt.

Method: Use the standard cousin definition: cousins of a person are the children of that person's parents' siblings.

Let C = total cousins for Alice's sister.

Maternal side (Alice's mother):
- Mother has 1 sister who does not have children => 0 cousins from that aunt.
- Mother has 9 nephews and nieces => by standard word-problem convention, each nephew/niee is a child of one of her siblings, hence contributes 9 cousins on the maternal side.

So maternal = 9.

Paternal side (Alice's father):
- Father has 1 brother (the relevant paternal uncle).
- That uncle has 6 nephews and nieces in total, and also 2 brothers (sons)?? (No: prompt says "and who has also 3 sons" and the 9 nephews/nieces wording is only on the maternal side; here we use the paternal sentence.)
- We interpret "6 nephews and nieces in total" as 6 children of the uncle's siblings, and the additional clause "and who has also 3 sons" as 3 more children of the uncle itself. Since the cousin definition uses children of the uncle, the paternal cousins contributed are exactly 3 (the uncle's sons), and any "nephews and nieces" of the uncle are cousins' children, not cousins.

This produces paternal = 3.

Total: C = 9 + 3 = 12.

## Exact command and output
Command run:

echo $((9 + 3))

Exact output:

12

## Checks and limits
- This computation uses an alternative but consistent interpretation than earlier notes: it treats "nephews and nieces of the uncle" as not being the uncle's own children.
- If instead one interprets "nephews and nieces" as counting the uncle's children (a common looser parsing), then the paternal contribution changes. The prompt ambiguity is real.

## Next small contribution
A reviewer can resolve the ambiguity by drawing the smallest family tree for the uncle and labeling which individuals are the uncle's children versus the uncle's own nephews/nieces.
