#!/bin/bash

set -e
set -x

mount -t binfmt_misc binfmt_misc /proc/sys/fs/binfmt_misc
echo ':arm:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-arm-static:' > /proc/sys/fs/binfmt_misc/register

mkdir rootfs
tar --numeric-owner --xattrs --acls -f rootfs-alarm.tar.xz -C rootfs -x -J 
cp $(which qemu-arm-static) rootfs/usr/bin
arch-chroot rootfs /bin/bash
