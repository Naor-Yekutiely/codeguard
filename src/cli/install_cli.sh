#!/usr/bin/env bash
git_path=$1
cd /usr/local/bin
rm -f codeguard
cp $git_path/codeguard/src/cli/codeguard.sh /usr/local/bin
mv ./codeguard.sh codeguard
chmod +x codeguard

