#!/bin/bash -e

VIDEOWALL_APPIMAGE=${VIDEOWALL_APPIMAGE:-/home/build/build/videowall/videowallclient-linux-current-armv7l.AppImage}

rm -f "${ROOTFS_DIR}/etc/systemd/system/dhcpcd.service.d/wait.conf"

# install videowall
install -v -d                         ${ROOTFS_DIR}/usr/share/videowall
install -m 777 ${VIDEOWALL_APPIMAGE}  ${ROOTFS_DIR}/usr/share/videowall/videowallclient-linux-current-armv7l.AppImage

# install autostart
install -v -d                         ${ROOTFS_DIR}/home/pi/.config/lxsession/LXDE-pi
install -v -m 644 files/autostart     ${ROOTFS_DIR}/home/pi/.config/lxsession/LXDE-pi/autostart

# Setting splash screen and background
install -v -m 644 files/background.png ${ROOTFS_DIR}/usr/share/videowall/background.png
install -v -d                         ${ROOTFS_DIR}/usr/share/plymouth/themes/pix/
install -v -m 644 files/splash.png    ${ROOTFS_DIR}/usr/share/plymouth/themes/pix/splash.png
install -v -d                         ${ROOTFS_DIR}/home/pi/.config/pcmanfm/LXDE-pi/
install -v -m 644 files/lxde-desktop  ${ROOTFS_DIR}/home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf

# cat files/.bashrc >> ${ROOTFS_DIR}/home/raspberrypi/.bashrc