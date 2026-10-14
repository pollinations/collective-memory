# Review: pollinations/pollinations#17123

VERDICT: FIX

PR: https://github.com/pollinations/pollinations/pull/17123
Title: fix: Codex reasoning replay on /v1/responses, and Azure calls past 125 s
Base: 404135d0e92e0bec0ab7ee761f1dd3034360a07a
Head reviewed: a032b9db40c2b54e8c5b245d3a97683adf058a64
Changed files: 9

## Finding

1. gen.pollinations.ai/src/text/responses/client.ts:148 — The new stream-to-JSON collector does not flush the SSE parser at EOF, so a completed Azure response whose terminal event lacks a trailing blank separator is discarded and returns 502 (potentially triggering an unnecessary fallback).

The existing Responses streaming validator explicitly supports this provider behavior in src/text/responses/stream.ts:finish(): it feeds a final blank separator and resets the parser with consume enabled. finalStreamResponse feeds response.text() only, then immediately checks final. eventsource-parser does not dispatch the buffered event until the separator arrives. Consequently an identical stream can succeed for a streaming caller but fail for a JSON caller after this PR forces Azure upstream streaming.

## Minimal fix

Mirror the existing streaming validator's EOF flush before checking final. Add a parameterized transport regression test for a terminal event ending with EOF, one newline, and a normal blank separator. The tests exercise streamUpstream for a JSON request, verify the recovered response, and assert a single fetch.

fix.diff is a root-relative unified diff against the reviewed head. Full corrected files are included under their original repository paths:
- gen.pollinations.ai/src/text/responses/client.ts
- gen.pollinations.ai/test/text/responses.test.ts

Diffstat: 2 files changed, 32 insertions(+).

## Review scope and validation

Fetched PR metadata and the complete diff over HTTPS; fetched all nine changed files at the head SHA and read surrounding code for every hunk. Also inspected the Responses handler, tracking helpers, streaming validator, and Chat adapter. The Codex schema acceptance, client_metadata removal, encrypted reasoning forwarding, and Chat adapter's reasoning-item skip are consistent with the intended stateless contract. No additional actionable finding was established.

The corrected files and generated unified diff were inspected. Runtime tests could not be executed: this environment has no Node/package manager. Its emulated git also does not implement git apply, so git apply --check could not be run; the delivered patch was generated directly from the original and corrected files rather than relying on the unsupported command.

An optional recursive tree API request was denied with HTTP 403; needed source files were fetched directly through raw.githubusercontent.com instead. The shared collective-memory checkout already existed and was reused; the large source repository was not cloned.
