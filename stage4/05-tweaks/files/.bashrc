#!/bin/bash

# If this is a tty, and the one where we want to run raspi-config, do so
if [ "$(tty)" == "/dev/tty2" ]; then
  sudo raspi-config
fi
