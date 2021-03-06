FROM debian:stretch-slim

MAINTAINER JuezFenix

RUN apt-get update && apt-get install -y \
    locales \
    locales-all
ENV \
LANG=es_ES.UTF-8 \
LANGUAGE=es_ES.UTF-8 \
LC_ALL=es_ES.UTF-8

RUN apt install -y curl sudo && curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && apt install -y nodejs npm mkvtoolnix rtmpdump ffmpeg
RUN npm install -g crunchyroll-dl && rm -rf /var/lib/apt/lists/*


VOLUME ["/downloads"]

WORKDIR /downloads

COPY crunchyroll-dl.sh /crunchyroll-dl.sh
RUN chmod +x /crunchyroll-dl.sh

ENTRYPOINT [ "/crunchyroll-dl.sh" ]
