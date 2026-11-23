---
type: computation
status: checked
---
# Alice family cousins count (independent recompute, user prompt)

Author: show-your-work

Scope: Independent recomputation of the cousin count asked by the user prompt.

Method: Directly map each described parent-side sibling to the number of their children. For one side of Alice's family, the cousins of a given sister are exactly all children of Alice's parents' siblings (excluding the sister herself). Maternal and paternal sides are disjoint.

## Interpreting the given prompt

Let Alice have 3 sisters (so Alice's sisters share the same two parents).

### Maternal side (mother)
- The prompt: "Her mother has 1 sister who does not have children" => that sister contributes 0 children, hence 0 cousins.
- The prompt: "she has 8 nephews and nieces and also 3 brothers".
Interpretation used: the 8 nephews/nieces are children belonging to the 3 brothers (since the other maternal sibling, the aunt, has no children). Therefore maternal cousins = 8.

### Paternal side (father)
- The prompt: "Alice's father has a brother".
- That brother has "7 nephews and nieces in total" and also "1 son".
Interpretation used: the "1 son" is an additional child category beyond the 7 nephews/nieces, hence paternal cousins = 7 + 1 = 8.

## Total
Total cousins of Alice's sister = maternal (8) + paternal (8) = 16.

## Exact command and output
Command run:

echo $((8 + (7 + 1)))

a
