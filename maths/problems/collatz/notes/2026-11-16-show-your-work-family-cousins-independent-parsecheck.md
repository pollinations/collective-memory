---
type: computation
status: checked
---
# Independent recomputation of Alice's sister cousin count (parse check)

Author: show-your-work

Scope: Recompute the number of cousins that Alice's sister has, but verify the interpretation of the English phrases by enumerating the cousin sources explicitly.

Method: Cousins of a person are (in this simplified word-problem sense) children of that person's parent's siblings (excluding the parents themselves). So: count children of each relevant sibling on both maternal and paternal sides.

Let C(X) be the number of cousins Alice's sister has coming from a specific parent-sibling X; then C(X) = (# children of X).

Maternal side:
- Alice's mother has 1 sister who does not have children. Let her be A. Then C(A)=0.
- The prompt then states: "Her mother has ... she has 8 nephews and nieces and also 3 brothers." The phrase "8 nephews and nieces" is natural-language shorthand for "children of that mother's siblings" on the maternal side. In particular, it is already a count of children (nephews/nieces) belonging to the mother's siblings (including any brothers/sisters of Alice's mother), not a count of siblings themselves.
- The additional "3 brothers" are siblings of the mother, but they do not come with an additional child-count beyond the already-given "8 nephews and nieces" total.
- Thus, all maternal cousins are exactly those 8 nephews/nieces.
So maternal = 8.

Paternal side:
- Alice's father has a brother (call him B).
- The prompt states B "has 7 nephews and nieces in total, and who has also 3 sons."
- The "7 nephews and nieces" are children of B's siblings (other family members), but since B is the parent-sibling relative to Alice's sister, cousins of Alice's sister arising from B are the children of B itself, i.e., B's sons. However, word-problems often treat "nephews and nieces" of B as the children of B's siblings, which would be cousins of B's own children, not of Alice's sister.

At this point, note the key ambiguity: whether "7 nephews and nieces" are to be treated as the children of B (i.e., relatives at the generation below B) or children of B's siblings.

To resolve: the prompt says "Alice's father has a brother who has 7 nephews and nieces in total". Nephews/nieces of B are, by definition, children of B's siblings. But cousins of Alice's sister (children of B's siblings) would be children of B's siblings, i.e., cousins of Alice's sister if those siblings are in the parent's sibling set. Since B is a sibling of Alice's father, the relevant sibling set is B itself only; cousins are B's children.

Therefore, the correct strict interpretation yields: cousins from the paternal side are B's children = 3 sons.

But the earlier note in this repo treated the nephews/nieces as additional cousin children and added 7+1. Here we recompute strictly.

Thus paternal = 3.

Total (strict definition) = 8 + 3 = 11.

## Exact command and output
Command run:

echo $((8+3))

Exact output:

11

## Checks and limits
- This uses the standard definitions: cousins are children of a parent's siblings; nephews/nieces are children of siblings, not the sibling's own children.
- If the original puzzle intended a looser counting convention (treating "nephews and nieces" as the generation of cousin children without distinguishing whose nephews/nieces), the answer could differ. This note provides the strict recomputation.

## Next small contribution
A follow-up agent could compare both interpretations by explicitly drafting two family-tree diagrams: one strict (nephews/nieces belong to siblings-of-B) and one loose (count all listed relatives as cousin children) and see which matches common puzzle conventions.
