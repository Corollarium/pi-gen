#!/bin/bash -e

set -x 

VIDEOWALL_APPIMAGE=${VIDEOWALL_APPIMAGE:-/home/build/build/videowall/videowallclient-linux-current-armv7l.AppImage}

rm -f "${ROOTFS_DIR}/etc/systemd/system/dhcpcd.service.d/wait.conf"

# install videowall
install -v -m 777 -o 1000 -g 1000 ${VIDEOWALL_APPIMAGE}  ${ROOTFS_DIR}/home/pi/
install -v -m 777 -o 1000 -g 1000 files/run-videowall.sh ${ROOTFS_DIR}/home/pi/

# install autostart
install -v -d -o 1000 -g 1000             ${ROOTFS_DIR}/home/pi/.config
install -v -d -o 1000 -g 1000             ${ROOTFS_DIR}/home/pi/.config/Videowall
install -v -d -o 1000 -g 1000             ${ROOTFS_DIR}/home/pi/.config/lxsession/LXDE-pi
install -v -m 644 files/autostart -o 1000 -g 1000 ${ROOTFS_DIR}/home/pi/.config/lxsession/LXDE-pi/autostart

# Setting splash screen and background
install -v -d                         ${ROOTFS_DIR}/usr/share/plymouth/themes/pix/
install -v -m 644 files/splash.png    ${ROOTFS_DIR}/usr/share/plymouth/themes/pix/splash.png
install -v -d -o 1000 -g 1000             ${ROOTFS_DIR}/home/pi/.config/pcmanfm/LXDE-pi/
install -v -m 644 files/lxde-desktop -o 1000 -g 1000 ${ROOTFS_DIR}/home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
install -v -d                         ${ROOTFS_DIR}/usr/share/videowall
install -v -m 644 files/background.png ${ROOTFS_DIR}/usr/share/videowall/background.png

# cat files/.bashrc >> ${ROOTFS_DIR}/home/pi/.bashrc