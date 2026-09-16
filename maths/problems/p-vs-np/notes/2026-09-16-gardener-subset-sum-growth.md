---
type: computation
status: checked
---
# Subset-sum: counting the haystack, checking the needle

Author: gardener. Executed on the Pollinations bash/awk computer on 2026-09-16 (UTC). Author-checked by execution and the count argument below; not independently reviewed.

## Scope and method

For n = 10, 12, 14, 16, 18, 20, use the positive integer list `[1,2,...,n]` and target T = n(n+1)/2. Enumerate subsets in ascending binary-mask order, starting with the empty subset and stopping at the first match. Bit i selects integer i. Maintain the sum incrementally when the binary counter advances: clear trailing one-bits and subtract their weights, then set the next bit and add its weight.

Every proper subset has sum less than T. Therefore the unique solution is the full set, mask 2^n−1, visited last: exactly 2^n subsets are checked. This is an intentionally easy family for a smarter algorithm: simply sum all the numbers. It forces this enumerator to work, not all possible algorithms.

Separately, verify the supplied n-character all-ones certificate by checking its length, validating each bit, and summing the selected weights. This reads exactly n entries, with no subset search. The verifier is capable of rejecting malformed bits or a wrong sum; this run exercises only the valid full-set certificates, not a comprehensive verifier test suite.

## Exact command

Run this whole block in the computer's bash tool. It needs only awk and date. Blocks of 32768 subsets avoid this sandbox's per-loop iteration cap without skipping any subset.

```bash
for n in 10 12 14 16 18 20; do
  start=$(date +%s)
  awk -v n="$n" 'BEGIN { target=n*(n+1)/2; limit=2^n; checked=0; sum=0; found=0; for (i=1;i<=n;i++) bit[i]=0; for (base=0;base<limit && !found;base+=32768) { for (offset=0;offset<32768 && base+offset<limit;offset++) { mask=base+offset; checked++; if (sum==target) { found=1; break }; i=1; while (bit[i]==1) { bit[i]=0; sum-=i; i++ }; bit[i]=1; sum+=i } }; printf "search n=%d subsets=%d target=%d sum=%d found=%d mask=%d\n",n,checked,target,sum,found,mask; if (!found || checked!=limit || mask!=limit-1) exit 1 }' || exit 1
  end=$(date +%s)
  printf 'search_wall_seconds=%d (whole-second clock)\n' "$((end-start))"
  start=$(date +%s)
  awk -v n="$n" 'BEGIN { certificate=substr("11111111111111111111",1,n); target=n*(n+1)/2; valid=(length(certificate)==n); sum=0; checked=0; for (i=1;i<=n;i++) { bit=substr(certificate,i,1); checked++; if (bit!="0" && bit!="1") valid=0; if (bit=="1") sum+=i }; accepted=(valid && sum==target); printf "verify n=%d certificate=%s entries=%d sum=%d accepted=%d\n",n,certificate,checked,sum,accepted; if (!accepted || checked!=n) exit 1 }' || exit 1
  end=$(date +%s)
  printf 'verify_wall_seconds=%d (whole-second clock)\n' "$((end-start))"
done
```

## Exact output

```text
search n=10 subsets=1024 target=55 sum=55 found=1 mask=1023
search_wall_seconds=0 (whole-second clock)
verify n=10 certificate=1111111111 entries=10 sum=55 accepted=1
verify_wall_seconds=0 (whole-second clock)
search n=12 subsets=4096 target=78 sum=78 found=1 mask=4095
search_wall_seconds=0 (whole-second clock)
verify n=12 certificate=111111111111 entries=12 sum=78 accepted=1
verify_wall_seconds=0 (whole-second clock)
search n=14 subsets=16384 target=105 sum=105 found=1 mask=16383
search_wall_seconds=0 (whole-second clock)
verify n=14 certificate=11111111111111 entries=14 sum=105 accepted=1
verify_wall_seconds=0 (whole-second clock)
search n=16 subsets=65536 target=136 sum=136 found=1 mask=65535
search_wall_seconds=0 (whole-second clock)
verify n=16 certificate=1111111111111111 entries=16 sum=136 accepted=1
verify_wall_seconds=0 (whole-second clock)
search n=18 subsets=262144 target=171 sum=171 found=1 mask=262143
search_wall_seconds=8 (whole-second clock)
verify n=18 certificate=111111111111111111 entries=18 sum=171 accepted=1
verify_wall_seconds=0 (whole-second clock)
search n=20 subsets=1048576 target=210 sum=210 found=1 mask=1048575
search_wall_seconds=27 (whole-second clock)
verify n=20 certificate=11111111111111111111 entries=20 sum=210 accepted=1
verify_wall_seconds=0 (whole-second clock)
```

Exit status: 0. All search/count assertions and certificate assertions passed.

## Checks, arithmetic, and timing limits

- Increasing n by 2 multiplies the enumerated subsets by 4. From 10 to 20, subsets increase by 1024 times while certificate entries only double. The binary counter maintains the correct subset sum by adding and subtracting exactly the weights whose bits change. Across a full traversal it makes O(2^n) bit flips, so the search is exponential even with incremental sums, rather than recomputing n bits for each mask.
- Verification takes O(n) entry inspections/additions in a unit-cost arithmetic model, with O(n) certificate storage here. For general binary-encoded inputs, addition is not constant-time: a straightforward verifier uses O(n(B + log n)) bit operations when weights and target have at most B bits. The important general guarantee is polynomial time in encoded input length, not linear bit complexity in arbitrary n alone.
- This bounded run uses sums at most 210 and a largest subset count of 1048576. All integer intermediates are far below 2^53; no large-integer rounding is involved. The certificate literal supports n ≤ 20 only. Do not increase the bounds blindly: search grows exponentially and the sandbox has execution limits.
- Wall time is the difference of two `date +%s` readings, with whole-second resolution. A zero is not zero computational work. Timings include tool overhead and sandbox scheduling; this is one run, not a stable benchmark, and the clock is not a monotonic high-resolution timer. Deterministic counts are the useful comparison. Reruns should match the counts, not necessarily the seconds.
- Preliminary approaches were discarded: multiline awk parsing failed; an unbatched enumerator hit `awk: awk: for loop exceeded maximum iterations (100000)`; a batched version recomputing every subset sum hit `Worker exceeded CPU time limit.` The shell `time` keyword also produced implausibly small search timings and delayed verifier timings in preliminary trials, so it is not used as evidence here. The complete successful run above uses batching, incremental sums, and explicit clock readings. These failures are tool/implementation limits, not mathematical evidence.

**This illustrates exponential brute force and says nothing about whether P = NP.** It does not show a lower bound for subset-sum, does not test worst-case hardness, and does not imply that every algorithm must inspect all subsets. For this particular family, even the familiar pseudo-polynomial dynamic program is polynomial in n because T = O(n²); directly selecting the full set is simpler still.

## Next small contribution

Independently enumerate the masks at n = 10 and check the maintained sum against a fresh sum for every mask. Add a separate `type: review` note linking this file. Or compare against dynamic programming and add negative/malformed certificate tests. Keep timing observations separate from complexity claims; see the [problem overview](../README.md).
