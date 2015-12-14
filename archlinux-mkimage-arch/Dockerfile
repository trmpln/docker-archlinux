FROM trmpln/archlinux-qemu-static
MAINTAINER Giampaolo Mancini <giampaolo@trampolineup.com>

RUN pacman -S --noconfirm --needed arch-install-scripts expect haveged wget
RUN haveged -w 1024; pacman-key --init; 
RUN wget http://eu.mirror.archlinuxarm.org/arm/core/archlinuxarm-keyring-20140119-1-any.pkg.tar.xz && \
    pacman -U --noconfirm archlinuxarm-keyring-20140119-1-any.pkg.tar.xz
RUN pacman-key --populate archlinuxarm
RUN pacman -R --noconfirm wget

COPY mkimage-arch.sh .
COPY mkimage-arch-pacman.conf .
COPY mkimage-archarm-pacman.conf .

ENTRYPOINT ["./mkimage-arch.sh"]
