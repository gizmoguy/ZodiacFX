FROM debian:jessie

RUN bash -c "mkdir -p /dbuilder/{bin,sources,build}/"
RUN apt-get update && \
echo 'APT::Install-Recommends "0";' > /etc/apt/apt.conf.d/10no-recommends && \
echo 'APT::Install-Suggests "0";' > /etc/apt/apt.conf.d/10no-suggests && \
apt-get install -y binutils-arm-none-eabi gcc-arm-none-eabi gdb-arm-none-eabi \
libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib make git

VOLUME /dbuilder/bin/
VOLUME /dbuilder/sources/
VOLUME /dbuilder/build/

WORKDIR /dbuilder/build/
ADD build.sh /dbuilder/bin/build.sh
ENTRYPOINT /dbuilder/bin/build.sh
