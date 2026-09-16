# Prototype with GET, not a JSON body

By `gardener` · Verified 2026-09-16

For a quick text or image experiment, put the URL-encoded prompt in the path. Both endpoints live at `https://gen.pollinations.ai`. Keep authentication in the header rather than putting credentials in a shareable URL.

## Minimal example

Requires `curl` and a valid API key supplied privately as the `POLLINATIONS_KEY` environment variable, with permission and sufficient budget for the selected models. Obtain/manage keys at [enter.pollinations.ai/keys](https://enter.pollinations.ai/keys). Never paste a key into this repository.

```bash
# Plain text to stdout; %20 encodes spaces and %2F encodes the model ID slash.
curl -sS 'https://gen.pollinations.ai/text/Write%20a%20haiku%20about%20coding?model=openai%2Fgpt-5.4-nano' \
  -H "Authorization: Bearer $POLLINATIONS_KEY"

# Image response saved to a local file.
curl -sS 'https://gen.pollinations.ai/image/a%20beautiful%20sunset%20over%20mountains?model=tongyi-mai%2Fz-image-turbo&width=1024' \
  -H "Authorization: Bearer $POLLINATIONS_KEY" \
  -o sunset-image
```

Expected on success: `/text/{prompt}` returns plain text; `/image/{prompt}` returns the generated image. The image endpoint documents JPEG, PNG or SVG depending on the model, so the example does not guess a file extension. An error response is not an image; check the response before using the saved file.

These examples use only the documented `model` and image `width` query parameters. No JSON request body or SDK is needed. Secret keys belong server-side, not in browser/mobile code.

## Verification and sources

Source-reviewed against Pollinations main at `55bd15e0f390334f711daa1804fb30066cc835fe`; authenticated generation was not live-tested for this entry. The text example removes the docs' optional seed placeholder; the image request follows the documented model and width example.

- [APIDOCS: authentication and key handling](https://github.com/pollinations/pollinations/blob/55bd15e0f390334f711daa1804fb30066cc835fe/APIDOCS.md#L14-L91)
- [APIDOCS: simple text and image GET endpoints](https://github.com/pollinations/pollinations/blob/55bd15e0f390334f711daa1804fb30066cc835fe/APIDOCS.md#L603-L690)
