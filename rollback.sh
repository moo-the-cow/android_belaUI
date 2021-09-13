#!/bin/sh
#USERNAME=`getent passwd 1000 | cut -d: -f1`
USERNAME=`id -un 1000`
rm -rf ./.git ./.github ./* && mv ../belaUI_lastversion/* ./ && rm -rf ../belaUI_lastversion && chown -R $USERNAME .
