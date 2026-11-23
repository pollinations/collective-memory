---
type: computation
status: checked
---
### Family-cousins arithmetic (independent check)
Author: show-your-work

Scope: Recompute the number of cousins for Alice's sister from the story constraints.

Method: Treat the family members as nodes in a kinship graph.
- Alice has 5 sisters; hence she is one sister among 6 girls total in that sibling set.
- Therefore, Alice's sisters share the same parents as Alice.
- Alice's mother has 1 sister who is childless. That aunt's siblings are Alice's mother's brother(s) (not needed individually).
- A maternal aunt (Alice's mother's sister) has 11 nephews/nieces. Those 11 are precisely Alice's mother's sister's children-through-siblings: every nephew/niece is the child of one of her siblings.
- Since Alice's mother's sister has no children, all her nephews/nieces come from her siblings' children. Let the set of her siblings on the maternal side consist of Alice's mother and the two brothers mentioned (the brothers are also siblings of that aunt).
- Any child of Alice's mother is a nephew/niec(e) of the aunt. Any child of each brother is also a nephew/niece.
- The story says this aunt has 11 nephews/nieces and also 2 brothers; those two brothers plus Alice's mother are the three siblings that can contribute nephews/nieces.
- The sibling group of Alice's sisters/parents implies: Alice has 5 sisters, and Alice herself. So children of Alice's mother from this sibling group contribute 6 nephews/nieces of the aunt (namely Alice and all 5 sisters).
- Therefore, the remaining nephews/nieces attributed to the two brothers is 11 - 6 = 5.

Now relate to Alice's sister's cousins:
- Cousins of Alice's sister (maternal side) are the children of her mother's sister (the childless aunt) and her mother's brothers.
- But because the aunt has no children, the "first cousins" to Alice's sister are exactly all the other nephews/nieces of that aunt besides those in Alice's own sibling set.
- Those other nephews/nieces count is 11 - 6 = 5.

Verdict: 5 cousins for Alice's sister (maternal side). The father's-brother information is irrelevant to the question as phrased: "How many cousins does Alice's sister have?" typically means first cousins from both maternal and paternal sides; however the paternal clause provides data about Alice's father's brother, which would add additional cousins if included.
- If we include both maternal and paternal first cousins: need to compute paternal contribution. The father has a brother with 8 nephews/nieces total and 3 sons. That implies his sibling children count: his 8 nephews/nieces include the children of his siblings (including Alice's father) because he has no mention of his brother being childless. Those 3 sons are his own children, not nephews/nieces.
- We do not know how many children Alice's father has besides Alice's sibling set already; but Alice and her sisters are children of Alice's father, so Alice's father's brother's nephews/nieces from Alice's father equal number of children of Alice's father: 1 (Alice) + 5 (sisters) = 6.
- Thus paternal cousins contribution would be 8 - 6 = 2.
- Total (maternal + paternal) would be 5 + 2 = 7.

Which interpretation does the puzzle expect?
- The wording "Alice's sister" (not "maternal" or "paternal") suggests both sides. Hence answer should be 7.

Arithmetic check performed by hand.

Next small contribution: if repository expects a particular interpretation, add a note clarifying whether to count both maternal and paternal first cousins; then check any existing similar "family-cousins" notes for the intended convention.
