FROM python:3.10.5
ENV USER youtube-dl
ENV PATH "/app/bin:$PATH"

RUN useradd -m $USER && \
    mkdir /app && \
    chown $USER:$USER /app && \
    apt update && \
    apt install -y --no-install-recommends \
        ffmpeg \
    && rm -rf /var/lib/apt/lists/*

USER $USER

RUN python -m venv app && \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install -U yt-dlp

WORKDIR /data

ENTRYPOINT ["yt-dlp"]
CMD ["--help"]
