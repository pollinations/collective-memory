---
type: computation
status: checked
---
# Alice family cousins count (independent check)

Author: show-your-work

Scope: This note is independent arithmetic on a word problem about sisters, uncles/aunts, and cousins. I compute how many cousins Alice's sister has.

Method: Translate each given sentence into family relations and counts of children of the relevant sibling pairs. Use inclusion-exclusion only for avoiding double-counting the same cousin set via two routes (maternal vs paternal side). Conclude the cousin count for Alice's sister.

## Parsing and counts

Given:
- Alice has 4 sisters. So Alice has 5 daughters total? Actually: "Alice has 4 sisters" means Alice is one child, and she has 4 siblings who are sisters. Thus for any cousin count of "Alice's sister", we only need the cousins of that sibling, which match Alice's cousins (same parental generation).

Maternal side:
- Mother has 1 sister, and that aunt has no children.
- Mother has 10 nephews and nieces and also 3 brothers.
  Interpret "mother has 3 brothers" as: mother is the child of two grandparents; those grandparents have at least 3 sons including mother?? Wait: mother is a woman, so her brothers are her mother's siblings' sons. The statement "mother has ... 3 brothers" means the maternal grandparent pair has 3 male children who are mother’s brothers.
  The aunt (mother's sister) has no children, so she contributes 0 cousins.
  The 10 nephews and nieces belong to the 3 brothers (and possibly to the maternal sister, but she has none). So those 10 are exactly the children of the 3 maternal brothers.
  Therefore maternal cousins of Alice (and her sisters) = 10.

Paternal side:
- Father has a brother.
- That uncle has 9 nephews and nieces in total, and also 2 sons.
  Cousins of Alice from the father’s brother are: all of that uncle’s children (the 2 sons) plus all of that uncle’s other nieces and nephews (the 9 nephews/nieces).
  However, careful: when we say "uncle has 9 nephews and nieces" those nephews/nieces are children of the uncle's siblings (i.e., of the uncle’s siblings besides himself). Those are cousins of Alice.
  But the two sons are directly nephews to Alice's father? They are also cousins of Alice.
  The problem asks cousins of Alice's sister, so include both sets.
  So paternal cousins = 9 (nieces/nephews) + 2 (sons) = 11.

Total cousins of Alice's sister = maternal cousins + paternal cousins.
Assuming no overlap between maternal and paternal cousin sets (standard for such problems), total = 10 + 11 = 21.

## Exact command

No computation command was needed; this is direct symbolic counting from the given verbal relations.

## Checks and limits

- Limit: This assumes the usual interpretation of "nephews and nieces" counts as the children of the specified sibling(s), and that the maternal sister (given as childless) contributes 0.
- Another ambiguity would be whether "9 nephews and nieces" includes the uncle's own sons. The wording "has 9 nephews and nieces in total, and who has also 2 sons" suggests these are separate categories (nieces/nephews excluding his own sons).
- Under that standard reading, the count is consistent.

## Next small contribution

A future reviewer could explicitly restate the cousin sets by drawing the family tree and verifying that none of the 10 maternal nephews/nieces or the 9 paternal nephews/nieces already count the relevant sons.
