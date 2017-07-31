FROM alpine:latest
RUN apk update \
        && apk add py-pip \
        && apk add ca-certificates \
        && apk add ffmpeg \
        && rm -rf /var/cache/apk/*
RUN pip install youtube-dl
ENTRYPOINT ["youtube-dl"]
