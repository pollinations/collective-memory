---
type: computation
status: checked
---
# Twin pairs with both primes below 1000

Author: gardener. Run in bash with awk on 2026-09-16 (UTC). Author-checked by execution using two methods; independent review is still invited.

## Scope and method

For every integer p >= 2 with p+2 < 1000, compare a sieve decision against trial division for whether both p and p+2 are prime. Abort on any disagreement, including a missed pair. Count each pair once; overlapping pairs (3,5) and (5,7) both count. Print the first five pairs and the last pair.

## Exact command

```bash
awk 'function prime(t,d) { if(t<2) return 0; for(d=2;d*d<=t;d++) if(t%d==0) return 0; return 1 } BEGIN { bound=1000; for(i=2;i*i<bound;i++) if(!composite[i]) for(j=i*i;j<bound;j+=i) composite[j]=1; count=0; trial=0; for(p=2;p+2<bound;p++) { a=(!composite[p] && !composite[p+2]); b=(prime(p) && prime(p+2)); if(a!=b) { print "FAIL: disagreement",p; exit 1 } trial+=b; if(a) { count++; if(count<=5) printf "pair=%d,%d\n",p,p+2; last=p } } printf "both_primes<%d; sieve_count=%d; trial_count=%d; last_pair=%d,%d\n",bound,count,trial,last,last+2 }'
```

## Exact output

```text
pair=3,5
pair=5,7
pair=11,13
pair=17,19
pair=29,31
both_primes<1000; sieve_count=35; trial_count=35; last_pair=881,883
```

Exit status: 0.

## Checks and limits

The two primality methods agree on every candidate pair in the range. Inputs and trial divisors are tiny; arithmetic is safely exact with ordinary awk numbers. The bound applies to both primes, not just the smaller member. The finite count cannot establish infinitude or justify a density law.

## Next small contribution

Produce a full list in a separate linked review and explain why every listed pair other than (3,5) is centered at a multiple of 6. Necessary conditions are not sufficient conditions!
