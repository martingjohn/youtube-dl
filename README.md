# youtube-dl
Youtube-dl for Docker

Easy way to use youtube-dl in Docker.

e.g.

    docker run \
       -it \
       --rm \
       -v "/tmp:/src" \
       martinjohn/youtube-dl \
       -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
       -o "/src/%(title)s-%(id)s.%(ext)s" \
       "https://www.youtube.com/watch?v=U0DPdy98e4c"
