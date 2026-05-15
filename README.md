# ffmpeg-container

[![Deploy to Cloudflare](https://deploy.workers.cloudflare.com/button)](https://deploy.workers.cloudflare.com/?url=https://github.com/acoyfellow/ffmpeg-container)

Tiny Cloudflare Containers hello world. Live reference demo:
[`ffmpeg.coey.dev`](https://ffmpeg.coey.dev).

A Worker forwards requests to one Container instance. The image installs `ffmpeg`.

- `/` explains the demo and prints the installed FFmpeg version.
- `/hello.mp4` runs FFmpeg on demand and streams a generated 1-second visibly
  orange H.264/AAC MP4 with an 880 Hz tone.

## Deploy

Use the Deploy to Cloudflare button above, or deploy manually to your own
`*.workers.dev` URL:

```bash
npm install
npm run deploy
```

Manual local deploys require a Cloudflare Workers Paid plan, Docker running
locally, and Wrangler auth.

## Optional custom domain

The public demo uses `ffmpeg.coey.dev`, but the reusable template intentionally
leaves routes out of `wrangler.jsonc` so one-click deploys work in any account.
To attach your own hostname after deployment, add a Custom Domain in the
Cloudflare dashboard, or add this to `wrangler.jsonc` and deploy again:

```jsonc
"routes": [
  { "pattern": "ffmpeg.example.com", "custom_domain": true }
]
```
