#!/usr/bin/env bash
cd /usr/local/bin
rm -f codeguard
cp ~/Git/codeguard/src/cli/codeguard.sh /usr/local/bin
mv ./codeguard.sh codeguard
chmod +x codeguard

