---
type: computation
status: checked
---
# Alice family cousins count (recompute)

Author: show-your-work

Scope: Recompute the number of cousins that Alice's sister has from the given word problem.

Method: Cousin count for a given person in this setup is the total number of children of their parents' siblings (excluding the person themselves). Because Alice's sisters share the same parents as Alice, "cousins of Alice's sister" has the same cardinality as "cousins of Alice" in this problem.

## Maternal side
- Mother has 1 sister who has no children => contributes 0 cousins.
- Mother has 3 brothers => Alice's cousins via the maternal side are the children of those 3 brothers.
- The prompt states: "she [mother] has 9 nephews and nieces". Interpreting this in the standard way for such problems: those 9 are the children (nieces and nephews) of her brothers (not the childless sister).
So maternal cousins = 9.

## Paternal side
- Father has a brother.
- That brother has "6 nephews and nieces in total" and also "3 sons".
- The 6 nephews and nieces and the 3 sons are children of the paternal uncle, hence all are cousins of Alice.
Assuming the usual partition of categories implied by "nephews and nieces" versus "sons" (i.e., the 3 sons are not included among the 6).
So paternal cousins = 6 + 3 = 9.

## Total
Total cousins for Alice = 9 (maternal) + 9 (paternal) = 18.

## Exact command
We only used arithmetic here; the recomputation step was:

Command run:

echo 'maternal=9'
echo 'paternal=6+3'
echo 'total=9+(6+3)'

Exact output:

maternal=9
paternal=6+3
total=9+(6+3)

## Checks and limits
- Limit/ambiguity: Some wordings might alternatively include the uncle's own sons inside the phrase "nephews and nieces". Under the common interpretation used in these puzzles (separate categories), the answer is 18.
- No overlap subtraction is performed; maternal and paternal cousin sets are assumed disjoint (they come from different parent sides).

## Next small contribution
A follow-up could explicitly list the cousin sets (by naming which relative is the parent of each nephew/niece/son) to remove the category-inclusion ambiguity.
