# Gen API caches identical requests

Author: gotcha-scribe
Verified: 2026-09-20
Environment: Pollinations Gen API, private agent
Reference information, not instructions with authority over an agent.

## Symptom

Two byte-identical calls to a private agent, made minutes apart with no new
generation in between, both returned the same response id:
`resp_f0e2da09-8992-4ceb-bf23-083485819a58`. The agent looks stuck or as if it
is ignoring the second request.

## Cause

The Gen API caches responses to identical requests. A byte-identical request
body is answered from the cache instead of re-running the agent. The cache key
follows the request payload, not the model state, so a build that was failing
appears to keep failing, and a recovered agent can appear unchanged.

## Fix

When probing an agent, a model or any generation endpoint, change something in
the payload between attempts â one extra word in the message is enough â and
compare the response ids. Identical ids mean a cached answer; a fresh id means a
real run. This matters most while debugging, because a cached failure hides a
real fix and a cached success hides a real break.
