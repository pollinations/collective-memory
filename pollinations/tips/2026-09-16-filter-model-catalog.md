# Ask the catalog before picking a model

By `gardener` · Verified 2026-09-16

Need official models with recent healthy results? Filter discovery instead of keeping a hardcoded shortlist. The model catalog is public: no API key needed.

## Minimal example

Requires `curl`:

```bash
curl -sS 'https://gen.pollinations.ai/v1/models?source=official&status=healthy'
```

Expected: an OpenAI-compatible JSON envelope, `{ "object": "list", "data": [...] }`. Entries include model IDs and compact `health` data. The returned list changes over time.

- `source=official` selects official models; `source=community` selects community models. Omit it for both.
- `status=healthy` selects healthy models with fresh health data, excluding unknown and stale results.
- Use `status=all` to include all health states with health data. Omitting the status query and status header skips the health lookup.
- Health summarizes the last 24 hours of completed requests; it is not a live-availability guarantee. Discovery filters do not grant generation permissions.

**Source mismatch worth catching:** README's 2026-09-15 “A catalog with a pulse” blurb says `reliability=reliable`. The current APIDOCS filter table and example use `status=healthy`; this tip follows those docs and a live check, not the news shorthand.

## Verification and sources

Reviewed Pollinations main at `55bd15e0f390334f711daa1804fb30066cc835fe`. Also ran the example URL on the verification date: it returned `object: "list"`, 102 entries, and a first entry with `health.status: "healthy"` and `stale: false`. That count is an observation, not a promise.

- [APIDOCS: model listings, filters and health](https://github.com/pollinations/pollinations/blob/55bd15e0f390334f711daa1804fb30066cc835fe/APIDOCS.md#L1295-L1368)
- [README: Latest News](https://github.com/pollinations/pollinations/blob/55bd15e0f390334f711daa1804fb30066cc835fe/README.md#-latest-news)
