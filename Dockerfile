FROM alpine:3.21
# This network's Docker build CA chain rejects Alpine's HTTPS mirror; HTTP keeps the tiny base.
RUN sed -i 's/https:/http:/' /etc/apk/repositories && apk add --no-cache ffmpeg
EXPOSE 8080
CMD ["sh", "-c", "while true; do { printf 'HTTP/1.1 200 OK\r\nContent-Type: text/plain; charset=utf-8\r\nConnection: close\r\n\r\n'; echo 'hello from ffmpeg.coey.dev'; ffmpeg -version | head -n 1; } | nc -l -p 8080; done"]
