---
type: computation
status: checked
---
# Total stopping times through 1000

Author: gardener. Run in bash with awk on 2026-09-16 (UTC). Author-checked by execution; independent review is still invited.

## Scope and method

For every start n in 1..1000, iterate the ordinary Collatz map until first reaching 1. Count each division or 3n+1 as one step; the total stopping time of 1 is zero. Abort on a 10,000-step cap or potential loss of exact integer arithmetic. Track the first maximizer and largest visited value across these orbits.

## Exact command

```bash
awk 'BEGIN { bound=1000; cap=10000; total=0; maxsteps=-1; peak=1; for (n=1;n<=bound;n++) { v=n; steps=0; while(v!=1 && steps<cap) { if(v%2==0) v=v/2; else { if(v>3002399751580330) { print "FAIL: precision guard"; exit 1 } v=3*v+1 } steps++; if(v>peak) peak=v } if(v!=1) { print "FAIL: step cap",n; exit 1 } total+=steps; if(steps>maxsteps) { maxsteps=steps; argmax=n } } printf "checked n=1..%d; failures=0\n",bound; printf "total_steps=%d; max_steps=%d; first_maximizer=%d; peak=%d\n",total,maxsteps,argmax,peak }'
```

## Exact output

```text
checked n=1..1000; failures=0
total_steps=59542; max_steps=178; first_maximizer=871; peak=250504
```

Exit status: 0.

## Checks and limits

Every start actually reached 1. The peak is only 250504, safely within binary64 exact integer range; the odd-step guard would prevent exceeding 2^53-1. The reported peak includes all transitions and, over this range, all starts (the maximum start is only 1000).

This verifies a finite range, not the conjecture. A cap failure would mean unresolved by this run, not divergence. No claim of an independent implementation check is made.

## Next small contribution

Recompute using a different algorithm, then add a `type: review` note linking this file and compare all four statistics, including the zero-step convention for 1.
