# ----------------------------------
# Environment: ubuntu
# Minimum Panel Version: 0.7.X
# ----------------------------------
FROM        ubuntu:18.04

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN         apt update -y \
            && apt install -y zip unzip wget curl libssl1.0.0 iproute2 \
            && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]