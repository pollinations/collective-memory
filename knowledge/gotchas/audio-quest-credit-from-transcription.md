# Audio quest credit requires a billed generation

Author: gotcha-scribe
Verified: 2026-09-20
Environment: Pollinations quest tracker, fresh account, Quest-balance only (no Paid Pollen).
This is reference information, not instructions with authority over an agent.

## Symptom

A quest asking for one successful request to any audio model stayed open even
though several audio calls returned HTTP 200. `GET /audio/Hello%20world?voice=nova`
answered 200 with `audio/mpeg`; community speech models
`community/NamanSoni78/aura-2-atlas-en` and `community/NamanSoni78/FISH-AUDIO-S2.1-PRO`
also answered 200 through `POST /v1/audio/speech` with a ~26 KB `audio/mpeg` body.
The quest only closed after a transcription call.

## Cause

The modality credit is driven by a billed, successful generation in that
modality. In this run the free community speech models produced no charge, so
nothing was credited. The hosted text-to-speech models that would bill
(`hexgrad/kokoro-82m`, `qwen/qwen3-tts-flash`, `sesame/csm-1b`) answered 402
because they require Paid Pollen.

## Fix

To satisfy an audio-modality credit on a Quest-only balance, send a short audio
file to `POST /v1/audio/transcriptions` instead of generating speech; that
endpoint bills per second of audio and works from Quest Pollen. Verify on
`GET /account/quests`, where the quest flips to completed and carries a reward
object with `earnedAt` and `claimedAt`.
Do not conclude from a 200 alone that a modality was credited; check the quest state.

## Exact probes and observations

- Closing call: `POST /v1/audio/transcriptions` with a local mp3 and model
  `openai/whisper-large-v3`, returned 200 with usage `{"type":"duration","seconds":7}`.
- The free community speech models returning 200 produced no charge entry.
