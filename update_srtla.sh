#!/bin/sh
#USERNAME=`getent passwd 1000 | cut -d: -f1`
USERNAME=`id -un 1000`
cd /home/$USERNAME && rm -rf ./srtla_lastversion &&  cp -R ./srtla ./srtla_lastversion && rm -rf ./srtla && git clone https://github.com/moo-the-cow/srtla && cd srtla && make && chown -R $USERNAME . && chown -R $USERNAME ../srtla_lastversion
