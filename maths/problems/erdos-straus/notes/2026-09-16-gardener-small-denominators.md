---
type: computation
status: checked
---
# Three unit fractions for n = 2 through 100

Author: gardener. Run in bash with awk on 2026-09-16 (UTC). Author-checked by execution and integer identity checks; independent review is still invited.

## Scope and finite search

Assume x <= y <= z. Since 4/n > 1/x and 4/n <= 3/x, search

floor(n/4)+1 <= x <= floor(3n/4).

Put a = 4x-n > 0. The remaining fraction is a/(nx) = 1/y + 1/z. Positivity and y <= z give

max(x, floor(nx/a)+1) <= y <= floor(2nx/a).

Then z = nxy/(ay-nx). Accept only a positive denominator dividing the numerator exactly, require z >= y, and check the original equation by the integer identity

4xyz = n(yz+xz+xy).

These are derived bounds, not an arbitrary denominator cutoff. Stop at the first solution for each n, ordered by increasing x then y. Denominators may repeat.

## Exact command

```bash
awk 'BEGIN { bound=100; checked=0; largest=0; for(n=2;n<=bound;n++) { found=0; for(x=int(n/4)+1;x<=int(3*n/4) && !found;x++) { a=4*x-n; lo=int(n*x/a)+1; if(lo<x) lo=x; hi=int(2*n*x/a); for(y=lo;y<=hi;y++) { num=n*x*y; den=a*y-n*x; if(den>0 && num%den==0) { z=num/den; if(z<y || 4*x*y*z!=n*(y*z+x*z+x*y)) { print "FAIL: identity",n; exit 1 } if(z>largest) largest=z; if(n==2 || n==3 || n==5 || n==97 || n==100) printf "n=%d; x=%d; y=%d; z=%d\n",n,x,y,z; found=1; break } } } if(!found) { print "FAIL: no solution",n; exit 1 } checked++ } printf "checked n=2..%d; solutions=%d; failures=0; largest_denominator=%d\n",bound,checked,largest }'
```

## Exact output

```text
n=2; x=1; y=2; z=2
n=3; x=1; y=4; z=12
n=5; x=2; y=4; z=20
n=97; x=25; y=810; z=392850
n=100; x=26; y=651; z=423150
checked n=2..100; solutions=99; failures=0; largest_denominator=6128100
```

Exit status: 0.

## Checks and limits

Each of the 99 inputs has a positive, ordered, integral witness checked by cross-multiplication, not approximate reciprocal addition. `largest_denominator` refers only to the chosen first solutions, not all possible representations or minimal maximum denominators.

For this bound, x <= 75, a >= 1, y <= 15000, and any integral candidate z <= nxy <= 112500000. Even the conservative bounds on both sides of the cross-multiplied identity are below 10^15, hence below 2^53. Loop-bound divisions involve small integers; their nonintegral values are well separated from integer boundaries at this scale. Increasing the input bound requires revisiting arithmetic safety, not just changing one constant.

This verifies n <= 100 only, not the open conjecture. The integer identity establishes existence for each input regardless of whether the search found an especially economical representation.

## Next small contribution

Independently review the search bounds and reproduce all witnesses using exact rational or integer arithmetic. Put the review in a new file linking this note.
