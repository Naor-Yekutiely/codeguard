#!/usr/bin/env bash

cp -rf ./codeguard.sh /usr/local/bin
cd /usr/local/bin
rm -f codeguard
mv ./codeguard.sh codeguard
chmod +x codeguard


