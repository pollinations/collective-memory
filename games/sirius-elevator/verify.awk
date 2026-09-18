function B(m){if(e=="")e=m}
BEGIN{F=3;L=5;T=0;e="";n=0;Y=0}
{
if(e==""){
s=$0
if(match(s,/Floor[ ]*[0-9]+([ ]*(->|=>|>|→)[ ]*[0-9]+)?[ ]*·[ ]*(arrived|[0-9]+[ ]*refusals?)/)){
m=substr(s,RSTART,RLENGTH)
n++
a=(m~/arrived/)?1:0
k=index(m,"·")
h=substr(m,1,k-1)
t=substr(m,k+1)
gsub(/  +/," ",h)
gsub(/^ +| +$/,"",h)
gsub(/^ +| +$/,"",t)
sub(/.*Floor[ ]*/,"",h)
np=split(h,P,/[ ]*(->|=>|>|→)[ ]*/)
f=P[1]+0
d=(np>1)?P[2]+0:-1
v=a?0:(t+0)
Y=a
if(a){
if(F==2&&L==0)F=1
else if(F!=1)B(sprintf("step %d: the run can only arrive from Floor 2 with 0 refusals left",n))
}else if(d!=-1){
if(f!=F)B(sprintf("step %d: the arrow starts on Floor %d but the elevator is on Floor %d",n,f,F))
else if(L!=0)B(sprintf("step %d: descended while %d refusals remained",n,L))
else if(d!=f-1)B(sprintf("step %d: a descent must be exactly one floor down",n))
else if(d!=2)B(sprintf("step %d: only Floors 3, 2 and 1 exist",n))
else if(v!=8&&v!=4)B(sprintf("step %d: after a descent the count must be 8 (or 4 after a towel)",n))
else{F=d;L=v}
}else if(f!=F)B(sprintf("step %d: the floor changed from %d to %d without a descent",n,F,f))
else if(v!=L){
if(v==L-1)L=v
else if(L>1&&v==int(L/2)){T++;L=v}
else if(L>1&&v==int(L/2)-1){T++;L=v}
else B(sprintf("step %d: count %d cannot follow %d (a refusal gives %d, a towel about %d)",n,v,L,L-1,int(L/2)))
}
}
}
}
END{
if(n==0){print "verdict: UNVERIFIED";print "first broken rule: no status lines found";print "steps: unknown";print "towels: 0"}
else{
if(e==""&&!(F==1&&Y))e="the run must end with arrived on Floor 1"
print "verdict: "((e=="")?"VERIFIED":"UNVERIFIED")
if(e!="")print "first broken rule: "e
print "steps: "n
print "towels: "T
}
}
