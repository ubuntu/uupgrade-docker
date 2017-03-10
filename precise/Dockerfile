FROM ubuntu:12.04.5

MAINTAINER Charles Butler <charles.butler@canonical.com>

ENV APT_PROXY=""
ENV APT_PACKAGES=""
ENV DEBIAN_FRONTEND="noninteractive"

# Heavy lifter script
COPY start.sh /start.sh
COPY debconf-selections /debconf-selections

# PIN some packages that are known to be troublesome when being upgraded in
# docker.
RUN apt-get update
RUN apt-get install -y debconf-utils
RUN debconf-set-selections /debconf-selections
#RUN apt-mark hold grub-pc
RUN echo "grub-pc hold" | dpkg --set-selections

RUN apt-get dist-upgrade -y --no-install-recommends

# Default package list. Obtained by running
# dpkg --get-selections | grep -v "deinstall" | cut -f1
# on a cloud image of the release you're basing the image from.
COPY pkg.list /pkg.list

RUN apt-get install -y --force-yes $(cat /pkg.list)
RUN apt-get clean
# RUN rm -rf /var/cache/apt/*

ENTRYPOINT /start.sh
