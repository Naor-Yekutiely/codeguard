#!/usr/bin/env bash

if [ -d .git ]
then
    if [ -a requirements.txt ]
    then
        while read line
        do
            # Pass the dependency to the server for vulnerability scan
            echo $line
        done < requirements.txt
    else
        echo "There is no requirements.txt file found."
    fi
else
    echo "This is not a git repo :("
fi