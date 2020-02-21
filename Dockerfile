FROM        ubuntu:18.04

ENV         DEBIAN_FRONTEND noninteractive

RUN         apt -y update \
            && apt -y upgrade \
            && apt install -y zip unzip wget curl libssl1.1 iproute2 fontconfig libsdl1.2debian liblzo2-2 libiculx60 libjansson4 libzip-dev libsdl2-2.0-0 software-properties-common gnupg gnupg2 gnupg1 \
            && wget https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_19.04/Release.key \
            && apt-key add Release.key \
            && apt-add-repository 'deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_19.04 ./' \
            && dpkg --add-architecture i386 \
            && wget -nc https://dl.winehq.org/wine-builds/winehq.key \
            && apt-key add winehq.key \
            && apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' \
            && apt-add-repository 'deb http://cz.archive.ubuntu.com/ubuntu eoan main universe' \
            && apt -y update \
            && apt install -y wine-stable-amd64 \
            && apt install -y --install-recommends winehq-stable \
            && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
