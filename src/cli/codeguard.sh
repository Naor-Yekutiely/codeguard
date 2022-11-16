#!/usr/bin/env bash

if [ -d .git ]
then
    if [ -a requirements.txt ]
    then
        while read line
        do echo $line
        done < requirements.txt
        echo "---- Scan completed succssfully ----"
    else
        echo "There is no requirements.txt file found."
    fi
else
    echo "This is not a git repo :("
fi