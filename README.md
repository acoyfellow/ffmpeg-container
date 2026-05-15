# ffmpeg-container

Tiny Cloudflare Containers hello world for [`ffmpeg.coey.dev`](https://ffmpeg.coey.dev).

A Worker forwards requests to one Container instance. The image installs `ffmpeg`.

- `/` explains the demo and prints the installed FFmpeg version.
- `/hello.mp4` runs FFmpeg on demand and streams a generated 1-second orange
  video with an 880 Hz tone.

## Deploy

Prerequisites: Cloudflare Workers Paid plan, Docker running locally, Wrangler auth,
and `coey.dev` available in the target Cloudflare account.

```bash
npm install
npm run deploy
curl https://ffmpeg.coey.dev
```
