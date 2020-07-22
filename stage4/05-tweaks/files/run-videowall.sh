#!/bin/bash

cd /home/pi
shopt -s nullglob
IMAGES=(videowallclient-linux-*)
shopt -u nullglob # Turn off nullglob to make sure it doesn't interfere with anything later

if (( ${#IMAGES[@]} != 1 )); 
then
        rm -f videowallclient-linux-*
        wget --content-disposition 'https://corollarium.com/product/4329/download?filename=videowallclient-linux-latest-armv7l.AppImage&automaticDownload=true'
        echo "Downloading..."
        shopt -s nullglob
        IMAGES=(videowallclient-linux-*)
        shopt -u nullglob # Turn off nullglob to make sure it doesn't interfere with anything later
fi

$(/home/pi/${IMAGES[0]})

