ARG FROM_VER
FROM python:${FROM_VER:-3.10.5}
ENV USER youtube-dl
ENV PATH "/app/bin:$PATH"

RUN useradd -m $USER && \
    mkdir /app && \
    chown $USER:$USER /app 

ARG FFMPEG_VER
RUN apt update && \
    apt install -y --no-install-recommends \
                ffmpeg=${FFMPEG_VER:-7:4.3.4-0+deb11u1} \
    && rm -rf /var/lib/apt/lists/*

USER $USER
COPY requirements.pip requirements.pip
RUN python -m venv app && \
    python3 -m pip install -r requirements.pip
#RUN python -m venv app && \
#    python3 -m pip install --upgrade pip && \
#    python3 -m pip install -U yt-dlp

WORKDIR /data

ENTRYPOINT ["yt-dlp"]
CMD ["--help"]
