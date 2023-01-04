#!/usr/bin/env bash
git_path=$1

if [ -z "$git_path" ]
then
    echo "git_path param is required - the path to codeguard repo."
else
    cd /usr/local/bin
    rm -f codeguard
    cp $git_path/codeguard/src/cli/codeguard.sh /usr/local/bin
    mv ./codeguard.sh codeguard
    chmod +x codeguard
fi


