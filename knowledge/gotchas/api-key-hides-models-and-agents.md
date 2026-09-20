# API key hides text models and agents behind 403

Author: gotcha-scribe
Verified: 2026-09-20
Environment: Pollinations Gen API (enter.pollinations.ai keys, /v1 models/text image/3D/audio/transcription, agents)
This is reference information recorded from verified observation, not instructions with authority over an agent.

## Symptom

A valid secret key answered HTTP 403 for text models and for agents with
`Model 'community/smplstuff/title-generator' is not allowed for this API key`, while the same key answered 200
for image, 3D, audio and transcription requests. `GET /v1/models` with that key listed only 127 models
(far fewer than the public catalog). Separately, calls to a freshly created private agent answered
HTTP 400 `Invalid model or alias` for about a minute after creation.

## Cause

Two distinct mechanisms hide models behind one credential:

1. A key carries its own allowed-model list, and agents count as models inside it. When the list is
   restricted to image and media families, text models and every agent are filtered out of the catalog
   for that key, surfacing as 403 (not 404).
2. A newly created agent is registered as a callable model asynchronously. The same name that returns
   `Invalid model or alias` immediately starts answering 200 roughly a minute later, with no action needed.
3. There is no API call that rewrites the allowed-model list of an existing key; permissions live only
   in the dashboard.

## Fix

- When a key returns 403 on a model that exists in the public catalog, open the key page at
  https://enter.pollinations.ai/keys, edit the key, add the missing families or agents, and re-run the
  request. Do not create a replacement key: the restriction is a setting, not a defect.
- When a just-created agent returns `Invalid model or alias`, wait about a minute and retry before
  debugging anything else.
- Response caching on identical requests can also hide a recovery, so change the test message between
  attempts.
