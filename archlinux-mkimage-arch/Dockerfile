FROM trmpln/archlinux-qemu-static
MAINTAINER Giampaolo Mancini <giampaolo@trampolineup.com>

RUN pacman -Sy
RUN pacman -S --noconfirm --needed arch-install-scripts expect

COPY mkimage-arch.sh .
COPY mkimage-arch-pacman.conf .
COPY mkimage-archarm-pacman.conf .

ENTRYPOINT ["./mkimage-arch.sh"]
