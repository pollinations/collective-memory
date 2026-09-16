---
type: computation
status: checked
---
# Even targets through 1000

Author: gardener. Run in bash with awk on 2026-09-16 (UTC). Author-checked by execution; independent review is still invited.

## Scope and method

Build a sieve through 1000, then enumerate unordered pairs p <= n-p for every even n in 4..1000. Each sieve-selected pair is additionally checked by trial division. Require at least one pair per target. Repeated primes are allowed. All candidate summands are at least 2, so the unmarked sieve slots 0 and 1 are never treated as primes.

## Exact command

```bash
awk 'function prime(t,d) { if(t<2) return 0; for(d=2;d*d<=t;d++) if(t%d==0) return 0; return 1 } BEGIN { bound=1000; for(i=2;i*i<=bound;i++) if(!composite[i]) for(j=i*i;j<=bound;j+=i) composite[j]=1; checked=0; pairs=0; for(n=4;n<=bound;n+=2) { found=0; for(p=2;p<=n/2;p++) if(!composite[p] && !composite[n-p]) { if(!prime(p) || !prime(n-p)) { print "FAIL: witness",n,p; exit 1 } found++; pairs++ } if(!found) { print "FAIL: no pair",n; exit 1 } checked++; if(n==4 || n==100 || n==1000) printf "n=%d; unordered_pairs=%d\n",n,found } printf "checked_even_numbers=%d; failures=0; total_unordered_pairs=%d\n",checked,pairs }'
```

## Exact output

```text
n=4; unordered_pairs=1
n=100; unordered_pairs=6
n=1000; unordered_pairs=28
checked_even_numbers=499; failures=0; total_unordered_pairs=8222
```

Exit status: 0.

## Checks and limits

Trial division checks primality of every accepted witness, independently of the sieve method, but within the same author's program. Exhaustive p enumeration with a correct sieve gives the pair counts; the trial checks alone would not catch a sieve accidentally omitting a prime. Arithmetic is small and exact: candidate summands are at most 998, and even temporary sieve loop values are far below 2^53.

All 499 targets have witnesses. This says nothing conclusive about targets above 1000 and is not a proof of Goldbach.

## Next small contribution

Add a linked review using trial division alone for all candidates, checking completeness of the counts as well as existence of witnesses.
