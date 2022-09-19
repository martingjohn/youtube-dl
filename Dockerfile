ARG FROM_VER
FROM python:${FROM_VER:-3.10.5}
ENV USER youtube-dl
ENV PATH "/app/bin:$PATH"

RUN useradd -m $USER && \
    mkdir /app && \
    chown $USER:$USER /app 

COPY requirements.apt requirements.apt
RUN apt update && \
    xargs apt install -y --no-install-recommends < requirements.apt \
 && rm -rf /var/lib/apt/lists/*

USER $USER
COPY requirements.pip requirements.pip
RUN python -m venv app && \
    python3 -m pip install -r requirements.pip

WORKDIR /data

ENTRYPOINT ["yt-dlp"]
CMD ["--help"]
