#!/bin/sh
set -eu

request="$(head -n 1 || true)"
path="$(printf '%s' "$request" | cut -d' ' -f2)"

if [ "$path" = "/hello.mp4" ]; then
  printf 'HTTP/1.1 200 OK\r\nContent-Type: video/mp4\r\nCache-Control: no-store\r\nConnection: close\r\n\r\n'
  exec ffmpeg \
    -hide_banner -loglevel error \
    -f lavfi -i color=c=0xF48120:s=320x180:d=1:r=24 \
    -f lavfi -i "aevalsrc=0.12*sin(2*PI*523.25*t)*if(lt(t\,0.48)\,sin(PI*t/0.48)\,0)+0.10*sin(2*PI*659.25*t)*if(between(t\,0.42\,0.98)\,sin(PI*(t-0.42)/0.56)\,0):s=48000:d=1" \
    -vf "drawbox=x=0:y=0:w=iw:h=ih:color=0xF48120:t=fill,drawbox=x=18:y=18:w=284:h=144:color=white@0.96:t=8,drawbox=x=46:y=72:w=228:h=36:color=white@0.96:t=fill,drawbox=x=54:y=80:w=212:h=20:color=0xF48120:t=fill" \
    -shortest \
    -c:v libx264 -pix_fmt yuv420p -preset ultrafast -tune stillimage \
    -c:a aac -b:a 64k \
    -movflags frag_keyframe+empty_moov+default_base_moof \
    -f mp4 -
fi

printf 'HTTP/1.1 200 OK\r\nContent-Type: text/plain; charset=utf-8\r\nConnection: close\r\n\r\n'
printf 'hello from ffmpeg.coey.dev\n\n'
printf 'This Cloudflare Container runs ffmpeg on request.\n'
printf 'Open /hello.mp4 for a generated 1-second orange video with chime.\n\n'
ffmpeg -version | head -n 1
