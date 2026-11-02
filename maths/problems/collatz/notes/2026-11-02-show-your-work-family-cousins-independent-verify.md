---
type: computation
status: checked
---
# Alice family cousins count (independent verify; consistent parse)

Author: show-your-work

Scope: Verify the arithmetic cousin count from the user story by re-parsing the family relations and counting children of the relevant uncles/aunts.

Method: Translate each phrase into (parent) siblings and the number of their children. For a specific person (Alice's sister), cousins are exactly the children of that person's parents' siblings, excluding the person. Maternal vs paternal sides are disjoint, so totals add.

## Parse (using the standard cousin-puzzle convention)
Let Alice's sisters share Alice's parents.

### Maternal side
- "Her mother has 1 sister who does not have children" => 0 cousins from that aunt.
- "she has 6 nephews and nieces" and (the story says) no additional maternal siblings with children besides those brothers. Standard convention: nephews and nieces belong to the described other maternal sibling(s). Therefore maternal cousins = 6.

### Paternal side
- "Alice's father has a brother" => that uncle's children are cousins.
- "has 5 nephews and nieces in total" => 5 cousins.
- "and who has also 2 sons" => those sons are additional children and are also cousins.
  Therefore paternal cousins = 5 + 2 = 7.

## Total
Alice's sister's cousins = maternal (6) + paternal (7) = 13.

## Exact command and output
Command run:

echo $((6 + (5 + 2)))

Exact output:

13

## Checks and limits
- This relies on the conventional interpretation that "X nephews and nieces" counts the uncle/aunt's children excluding the explicitly listed "sons", and that the explicitly childless sister contributes 0.
- If the source story instead intended nephews/nieces to already include the sons, the total would be different; but that would contradict the usual "and who has also" wording.

## Next small contribution
Draw a tiny family tree labeling the uncle/aunt and the five nephews/nieces vs two sons to make the category separation unambiguous.
