#!/bin/sh
#USERNAME=`getent passwd 1000 | cut -d: -f1`
USERNAME=`ls /home/`
cd ../srtla && rm -rf ./srtla && git clone https://github.com/BELABOX/srtla && cd srtla && make && chown -R $USERNAME .