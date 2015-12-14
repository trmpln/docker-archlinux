FROM trmpln/archlinux-qemu-static
MAINTAINER Giampaolo Mancini <giampaolo@trampolineup.com>

RUN pacman -Sy
RUN pacman -S --noconfirm arch-install-scripts

COPY entrypoint.sh .
#ENTRYPOINT ["./entrypoint.sh"]
