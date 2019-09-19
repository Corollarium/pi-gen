#!/bin/bash -e

VIDEOWALL_APPIMAGE=${VIDEOWALL_APPIMAGE:-/home/build/build/videowall/2.0.20/videowallclient-linux-2.0.20-armv7l.AppImage}

rm -f "${ROOTFS_DIR}/etc/systemd/system/dhcpcd.service.d/wait.conf"

# install videowall
install -v -d                         ${ROOTFS_DIR}/home/pi/videowall/
install -m 774 ${VIDEOWALL_APPIMAGE} ${ROOTFS_DIR}/home/pi/videowall/videowallclient-pi.AppImage

# install autostart
install -v -d                         ${ROOTFS_DIR}/etc/xdg/lxsession/LXDE/
install -v -m 644 files/autostart     ${ROOTFS_DIR}/etc/xdg/lxsession/LXDE/

# working "Setting splash screen background"
# install -v -m 644 files/background.png ${ROOTFS_DIR} /usr/share/plymouth/themes/pix/splash.png

