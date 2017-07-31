FROM alpine:latest
RUN apk update && apk add \
        ca-certificates \
        ffmpeg \
        py-pip \
     && rm -rf /var/cache/apk/*
RUN pip install youtube-dl
ENTRYPOINT ["youtube-dl"]
CMD ["--help"]
