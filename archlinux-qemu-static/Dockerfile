FROM trmpln/archlinux-pacaur
MAINTAINER Giampaolo Mancini <giampaolo@trampolineup.com>

RUN useradd -m pacaur
RUN echo "pacaur ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/pacaur
USER pacaur
RUN gpg --recv-keys 6C2A4AFF FB0F43D8
RUN pacaur --noconfirm --noedit -Sa qemu-static binfmt-qemu-static

USER root
RUN userdel -r pacaur && rm /etc/sudoers.d/pacaur
