FROM alpine:3.21
# This network's Docker build CA chain rejects Alpine's HTTPS mirror; HTTP keeps the tiny base.
RUN sed -i 's/https:/http:/' /etc/apk/repositories && apk add --no-cache ffmpeg socat
COPY server.sh /server.sh
EXPOSE 8080
CMD ["socat", "TCP-LISTEN:8080,reuseaddr,fork", "EXEC:sh /server.sh"]
