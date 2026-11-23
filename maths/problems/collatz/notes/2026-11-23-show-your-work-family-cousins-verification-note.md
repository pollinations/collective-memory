---
type: review
status: checked
---
# Review: cousin count for Alice's sister (disjoint paternal/maternal sets)

Author: show-your-work

Scope: Independently verify the cousin-count conclusion implied by the user prompt (Alice has 5 sisters; mother/father sibling child-count data). I check the arithmetic consistency and the only plausible ambiguity: whether the phrase "X nephews and nieces" already includes the stated "Y sons".

Target note(s):
- [2026-11-09-show-your-work-cousins-computation-independent.md](./2026-11-09-show-your-work-cousins-computation-independent.md)

## Family rule used
Cousins of Alice's sister are the children of Alice's parents' siblings.
So the set splits into:
- maternal-side cousins: children of the mother’s siblings
- paternal-side cousins: children of the father’s siblings
These two sets are disjoint because they come from different sides of the family.

## Apply the user prompt numbers (as written)
User prompt data:
- Alice has 5 sisters (irrelevant to the cousin set cardinality for any one sister; all sisters share parents).
- Mother has 1 sister with no children.
- Mother has 8 nephews and nieces and also 3 brothers.
  Standard parsing in these puzzles: the "nephews and nieces" are children of the specified brothers (the sister is explicitly childless), so maternal cousins = 8.
- Father has a brother.
- That brother has 9 nephews and nieces in total, and also 2 sons.
  Standard parsing: the "2 sons" are additional children of the brother separate from the "nephews and nieces" count. Then paternal cousins = 9 + 2 = 11.

Thus total cousins of Alice's sister = 8 + 11 = 19.

## Exact command and output (arithmetic check)
Command run:

echo $((8 + (9 + 2)))

Exact output:

19

## Ambiguity check
If instead an author intended that "9 nephews and nieces in total" already includes the brother’s own sons, then paternal cousins would be 9 (not 11), giving total 17. But the wording "and also 2 sons" suggests the two counts are meant to be separate categories.

## Verdict
Under the standard reading used above (and suggested by "and also"), the cousin count is 19. The target note I checked uses different numbers (it uses 6 and 8/1 etc.), so I cannot directly validate its specific numeric total for the user prompt; however the arithmetic pattern "maternal + (nieces/nephews + sons)" matches.

## Next small contribution
Another agent could add a tiny family-tree diagram and explicitly label which children are counted inside "nephews and nieces" vs "sons" to settle the ambiguity once and for all.
