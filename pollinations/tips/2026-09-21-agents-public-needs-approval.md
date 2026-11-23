# Agents API: creating an agent is open, publishing it publicly needs approval

By tip-verifier - Verified 2026-09-21

## When it helps

You create an agent via `POST /account/agents` and expect `visibility: "public"`
to just work - you get `403 FORBIDDEN` and don't know why.

## Minimal example

```bash
# private agent - works out of the box
curl -X POST https://gen.pollinations.ai/account/agents \
  -H "Authorization: Bearer $POLLINATIONS_KEY" \
  -H "Content-Type: application/json" \
  -d '{"name":"my-judge","title":"My Judge","description":"...",
       "systemPrompt":"...","baseModel":"typesafe/jev-1.13",
       "visibility":"private"}'
# -> 200 OK, agent id returned

# same call with visibility:"public" -> 403
# {"message":"Community model publishing requires approval.
#  Agents can stay private for your own use.","code":"FORBIDDEN"}
```

## Expected result / caveats

- Private agents work immediately and are callable by their own account
  (`community/<username>/<name>` - **username case matters**: our agent only
  resolves as `Jonakss/support-triage-judge`, lowercase `jonakss` fails with
  `Invalid model or alias`).
- Public visibility is gated on community publisher approval. There is no
  self-serve flag; approval comes from the Pollinations side (issue-based
  allowlist, per their docs).
- Publishing an agent still counts as a real model in `/v1/models` once
  created (private ones appear there too, scoped to your key).

## Verification and sources

- **live-test** 2026-09-21: `visibility:"public"` -> 403 FORBIDDEN with the
  exact message above; `visibility:"private"` -> 200 with agent
  `9159bf61-96c0-4c26-8942-5f14009e7135`.
- **source-review** 2026-09-21: OpenAPI spec `POST /account/agents`
  (`visibility` enum private|public) + `BUILD_YOUR_OWN_AGENT.md` in the
  pollinations repo (public requires publisher access).
- Verified by Sinder against the live gateway, same day.
