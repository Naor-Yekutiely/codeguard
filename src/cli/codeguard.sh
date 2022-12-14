#!/usr/bin/env bash

echoCodeguardResponse () {
    echo "-------------------------------------------- codeguard --------------------------------------------"
    echo $1
    echo "-------------------------------------------- codeguard --------------------------------------------"
}

if [ -d .git ]
then
    pipreqs --force >nul 2>nul
    # Pass the dependency to the server for vulnerability scan
    requirements_arr=();
    while read line || [ -n "$line" ]
    do
        # TODO: This is not a arr....
        requirements_arr+=($line)
    done < requirements.txt

    if [ -z "$requirements_arr" ]
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
            echoCodeguardResponse $response
        fi
    fi
else
    echoCodegourdResponse "This is not a git repository. Please run codeguard within a scope of a git repository"
fi