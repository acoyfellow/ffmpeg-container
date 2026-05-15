#!/bin/sh
set -eu

request="$(head -n 1 || true)"
path="$(printf '%s' "$request" | cut -d' ' -f2)"

if [ "$path" = "/hello.mp4" ]; then
  printf 'HTTP/1.1 200 OK\r\nContent-Type: video/mp4\r\nCache-Control: no-store\r\nConnection: close\r\n\r\n'
  exec ffmpeg \
    -hide_banner -loglevel error \
    -f lavfi -i color=c=0xF48120:s=320x180:d=1:r=24 \
    -f lavfi -i sine=frequency=880:duration=1 \
    -shortest \
    -c:v mpeg4 -q:v 5 \
    -c:a aac -b:a 64k \
    -movflags frag_keyframe+empty_moov \
    -f mp4 -
fi

printf 'HTTP/1.1 200 OK\r\nContent-Type: text/plain; charset=utf-8\r\nConnection: close\r\n\r\n'
printf 'hello from ffmpeg.coey.dev\n\n'
printf 'This Cloudflare Container runs ffmpeg on request.\n'
printf 'Open /hello.mp4 for a generated 1-second orange video with tone.\n\n'
ffmpeg -version | head -n 1
