#!/bin/bash

cd /home/pi
shopt -s nullglob
IMAGES=(videowallclient-linux-*)
shopt -u nullglob # Turn off nullglob to make sure it doesn't interfere with anything later

if (( ${#IMAGES[@]} == 0 )); 
then
        # TODO wget
        echo "Downloading..."
fi

$(/home/pi/${IMAGES[0]})

