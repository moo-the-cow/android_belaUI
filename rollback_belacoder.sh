#!/bin/sh
#USERNAME=`getent passwd 1000 | cut -d: -f1`
USERNAME=`id -un 1000`
cd .. && rm -rf ./belacoder && mv ./belacoder_lastversion ./belacoder && cd belacoder && chown -R $USERNAME .
