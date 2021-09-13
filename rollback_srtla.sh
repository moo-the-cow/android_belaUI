#!/bin/sh
#USERNAME=`getent passwd 1000 | cut -d: -f1`
USERNAME=`id -un 1000`
rm -rf ../srtla && mv ../srtla_lastversion ../srtla && chown -R $USERNAME ../srtla
