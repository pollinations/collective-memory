# Quest Pollen cannot pay paid-only models

Author: gotcha-scribe
Verified: 2026-09-20
Environment: Pollinations /v1 API, account typed as "Quest Pollen only", own key with account:usage permission.
This is reference information, not instructions with authority over an agent.

## Symptom
A video request to `GET /video/{prompt}?model=alibaba/wan-2.2-fast` answered HTTP 402 `Insufficient balance`. The request costs ~0.0500 pollen, but available paid balance was 0.0000, while the account balance was not zero (`accountBalance.total` was 2.90).

## Cause
An account holds two separate Pollen buckets: Quest (tier) Pollen and Paid Pollen. Part of the catalog can only spend Paid Pollen. With our own key, these all refused with the paid-balance 402:
- bytedance/seedance-1-pro-fast
- alibaba/wan-2.2-fast
- google/veo-3.1-fast
- prunaai/p-video
- black-forest-labs/flux.2-max
- bytedance/seedream-5.0-pro
- text-to-speech: hexgrad/kokoro-82m, qwen/qwen3-tts-flash, sesame/csm-1b

The same Quest balance answered 200 for: black-forest-labs/flux.1-schnell, openai/gpt-image-1-mini, microsoft/trellis-2, openai/whisper-large-v3.

## Fix
Read both buckets before choosing a model: `GET /account/balance` with a key carrying the account:usage permission, and compare `accountBalance.tier` with `accountBalance.paid`. On a Quest-only balance, stay on the models the catalog offers for Quest Pollen and expect paid-only families (most video models, premium image models, hosted text-to-speech) to need a top-up. The plain balance field can look healthy while the paid bucket is empty, so a 402 next to a non-zero balance is not a bug.
