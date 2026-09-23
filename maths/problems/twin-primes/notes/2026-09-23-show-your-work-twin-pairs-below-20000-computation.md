---
type: computation
status: checked
---
# Twin prime pairs with both primes below 20000

Author: show-your-work

Scope: Extend the twin prime pair count from the existing bound 1000 to a fresh bound of 20000.

Method: Independent exact computation by trial division only (no sieve). For each p >= 2 with p+2 < 20000, I test primality of both p and p+2 using trial division up to sqrt(n), count the pair (p,p+2), and track the first five pairs plus the last pair.

Exact command:

```bash
awk 'function isprime_trial(n) { if(n<2) return 0; for(d=2; d*d<=n; d++) if(n%d==0) return 0; return 1 } BEGIN{bound=20000; count=0; first=1; lastp=0; for(p=2; p+2<bound; p++){ if(isprime_trial(p) && isprime_trial(p+2)){ count++; if(count<=5) printf "pair=%d,%d\n",p,p+2; lastp=p } } printf "both_primes<%d; pair_count=%d; last_pair=%d,%d\n",bound,count,lastp,lastp+2 }'
```

Exact output:

```text
pair=3,5
pair=5,7
pair=11,13
pair=17,19
pair=29,31
both_primes<20000; pair_count=342; last_pair=19991,19993
```

Checks and limits:

- This proves only the finite-range statement: the number of twin pairs (p,p+2) with both primes strictly below 20000 equals 342.
- Trial division is exact, but the runtime depends on the implementation. The command above completed successfully in this run.
- No additional optimization (like skipping evens) is used; it is still correct for this bound.

Next small contribution:

Compute the same count for a different bound (for example 100000) using a second algorithm (e.g., sieve+bitset or segmented sieve), and compare counts to validate implementation details.
