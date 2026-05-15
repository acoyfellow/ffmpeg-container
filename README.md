# ffmpeg-container

Tiny Cloudflare Containers hello world for [`ffmpeg.coey.dev`](https://ffmpeg.coey.dev).

A Worker forwards requests to one Container instance. The image installs `ffmpeg`
and replies with:

```text
hello from ffmpeg.coey.dev
ffmpeg version ...
```

## Deploy

Prerequisites: Cloudflare Workers Paid plan, Docker running locally, Wrangler auth,
and `coey.dev` available in the target Cloudflare account.

```bash
npm install
npm run deploy
curl https://ffmpeg.coey.dev
```
