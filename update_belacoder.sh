#!/bin/sh
##USERNAME=`getent passwd 1000 | cut -d: -f1`
USERNAME=`id -un 1000`
cd .. && rm -rf ./belacoder_lastversion && cp -R ./belacoder ./belacoder_lastversion && rm -rf ./belacoder && git clone https://github.com/moo-the-cow/belacoder && cd belacoder && make && chown -R $USERNAME .
