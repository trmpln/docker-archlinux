FROM trmpln/archlinux:latest
MAINTAINER Giampaolo Mancini <giampaolo@trampolineup.com>

# install base-devel and needed tools
RUN pacman --noconfirm --needed -Sy base-devel git expac yajl perl

RUN groupadd -r pacaur && \
    useradd -r -g pacaur pacaur && \
    mkdir /tmp/pacaur && \
    chown -R pacaur:pacaur /tmp/pacaur && \
    chmod -R 771 /tmp/pacaur

# cloning and install pacaur
USER pacaur 
ENV PATH $PATH:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
WORKDIR /tmp/pacaur
RUN git clone https://aur.archlinux.org/cower.git
WORKDIR /tmp/pacaur/cower
RUN makepkg --noconfirm --skippgpcheck
USER root 
WORKDIR /tmp/pacaur/cower
RUN pacman --noconfirm -U *.tar.xz

# cloning and install pacaur
USER pacaur 
WORKDIR /tmp/pacaur
RUN git clone https://aur.archlinux.org/pacaur.git
WORKDIR /tmp/pacaur/pacaur
RUN sed -i -e '/build()/,+4d' -e '/man8/,+1d' PKGBUILD
RUN makepkg --noconfirm --skippgpcheck
USER root 
WORKDIR /tmp/pacaur/pacaur
RUN pacman --noconfirm -U *.tar.xz

# remove user pacaur (for security reasons)
RUN userdel -r pacaur
