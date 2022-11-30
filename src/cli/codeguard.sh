#!/usr/bin/env bash

if [ -d .git ]
then
    if [ -a requirements.txt ]
    then
        # Pass the dependency to the server for vulnerability scan
        requirements=""
        NL=$'\n'
        while read line || [ -n "$line" ]
        do
            #TODO: The new line is not yes working.. we need it as a dilimiter between differen dependencies. 
            requirements+=$(printf %b "$line\n")
        done < requirements.txt
        if [ -z "$requirements" ]
        then
            echo "The requirements.txt file is empty"
        else
            # TODO: Pass the requirements to backend for proccessing and echo the results here.
            echo $requirements
        fi
    else
        echo "There is no requirements.txt file found."
    fi
else
    echo "This is not a git repo :("
fi