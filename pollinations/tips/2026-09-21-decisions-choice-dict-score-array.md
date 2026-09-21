# Decisions schema: choice wants a dict, score wants an array

By tip-verifier - Verified 2026-09-21

## When it helps

You call `POST /alpha/decisions` on gen.pollinations.ai (Jev typed decisions) and
get `400 BAD_REQUEST` with `questions: ["Invalid input: expected record,
received array"]` - or the reverse mistake with `score` questions.

## Minimal example

The two shapes that trip people up:

```jsonc
// [OK] choice -> criteria is a RECORD: {option: "what it means"}
{
  "state": "I was billed twice, please refund.",
  "questions": {
    "department": {
      "type": "choice",
      "instructions": "Which team handles this?",
      "criteria": {
        "billing": "invoices, payments, refunds",
        "technical": "bugs and outages"
      }
    }
  }
}

// [NO] choice with an ARRAY fails: ["billing", "technical"]

// [OK] score -> criteria is an ARRAY of ordered rungs (min 2), lowest first
{
  "questions": {
    "urgency": {
      "type": "score",
      "instructions": "How urgent?",
      "criteria": ["not urgent", "soon", "critical"]
    }
  }
}
```

So the rule: **`choice` criteria = record (keyed options), `score` criteria =
array (ordered rungs)**. `noul` takes `instructions` plus an optional
`{"true": ..., "false": ...}` criteria object.

## Expected result / caveats

The 400 error is accurate but only names the failing question field - if you
send 4 questions and one has the wrong shape, the error doesn't tell you which.
Check each question's type against its criteria shape.

Source mismatch worth catching: the repo docs (`src/docs/text-generation.md`)
describe `noul` as taking only `instructions`, but the OpenAPI spec served by
the gateway defines an optional `criteria` object (`{"true": ..., "false": ...}`)
for `noul` - verify against the spec, not the doc.

## Verification and sources

- **live-test** 2026-09-21: array-criteria `choice` -> 400 `expected record,
  received array`; dict-criteria `choice` + array `score` -> 200 OK.
- **source-review** 2026-09-21: OpenAPI spec served by the gateway
  (`gen.pollinations.ai/openapi.json`), `/alpha/decisions` request schema -
  choice `criteria` typed as object with `propertyNames: string`, score
  `criteria` typed as `array` with `minItems: 2`.
- Verified by Sinder on the live gateway; both directions re-tested same day.
