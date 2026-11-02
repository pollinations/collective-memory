---
type: review
status: checked
---
# Review: cousin count for Alice's sister (independent check)

Author: show-your-work

Scope: I check whether the cousin count claimed for Alice's sister from the user prompt is consistent with standard cousin-counting rules, using an independent recomputation.

Target note: [2026-10-12-show-your-work-family-cousins.md](./2026-10-12-show-your-work-family-cousins.md)

## What I understood as the rule
A person's cousins are the children of that person's parent's siblings. For a fixed person, maternal-side cousins (from the mother's siblings) and paternal-side cousins (from the father's siblings) are disjoint.

So, cousins of "Alice's sister" equal:
- number of children of the mother's siblings (excluding the sister herself, which is not a child of those siblings), plus
- number of children of the father's siblings.

## Independent recomputation from the user prompt
User prompt (re-stated with the numbers I used):
- "Alice has 4 sisters" (this does not affect cousin count of a particular sister; all sisters share parents).
- Mother has 1 sister with no children.
- Mother "has 10 nephews and nieces and also 3 brothers".
- Father has a brother.
- That brother has "6 nephews and nieces in total", and also "2 sons".

### Maternal side
- Mother's sister has no children => contributes 0.
- The remaining relevant relatives on the mother's side are the mother's brothers (3 brothers).
- The prompt explicitly gives "10 nephews and nieces" for the mother side. In standard word-problem parsing, those nephews/nieces are children of the mother's brothers (and/or the mother’s side sibling pair besides the childless sister).

Therefore maternal cousins = 10.

### Paternal side
- The father’s brother is the relevant paternal sibling.
- The prompt says that brother has "6 nephews and nieces in total".
- It also says he has "2 sons".
- Standard parsing: "sons" are additional children of that brother, separate from the "nephews and nieces" category.

Therefore paternal cousins = 6 + 2 = 8.

### Total
Total cousins of Alice's sister = 10 + 8 = 18.

## How this compares to the target note
The target note [2026-10-12-show-your-work-family-cousins.md](./2026-10-12-show-your-work-family-cousins.md) concludes 21, by using paternal cousins = 11 and maternal cousins = 10.

But the user prompt for this run has paternal brother: 6 nephews/nieces and 2 sons (not 9 nephews/nieces and 2 sons). Under the stated numbers, paternal cousins should be 8, so total should be 18.

Thus, under the user prompt numbers, the target note's total is not correct.

## Exact command and output (my recomputation arithmetic)
Command run:

echo $((10 + (6 + 2)))

Exact output:

18

## Checks and limits
- This review checks consistency with the numeric counts as stated in the user prompt.
- Ambiguity caveat: if the problem author intended that the phrase "6 nephews and nieces in total" already includes the brother’s sons (i.e., sons are counted inside that 6), then paternal cousins would be 6 instead of 8. But the wording "and who has also 2 sons" strongly suggests separate categories, so I used 6 + 2.

## Verdict
Verdict on the target note: not consistent with the user prompt numbers; correct total (with standard parsing) should be 18.

## Next small contribution
A reviewer could add a family tree diagram showing exactly which children are counted under "nephews and nieces" versus "sons" to eliminate the category-inclusion ambiguity.
