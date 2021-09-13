#!/bin/sh
#USERNAME=`getent passwd 1000 | cut -d: -f1`
USERNAME=`id -un 1000`
cp -R ../belaUI ../belaUI_lastversion && cp ./*.json /tmp/ && rm -rf ./.git ./.github ./* && git clone https://github.com/moo-the-cow/belaUI . && mv /tmp/*.json ./ && chown -R $USERNAME .
