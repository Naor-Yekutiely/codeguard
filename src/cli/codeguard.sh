#!/usr/bin/env bash

if [ -d .git ]
then
    pipreqs --force
    # Pass the dependency to the server for vulnerability scan
    requirements_arr=();
    NL=$'\n'
    while read line || [ -n "$line" ]
    do
        # TODO: This is not a arr....
        requirements_arr+=($line)
    done < requirements.txt

    if [ -z "$requirements_arr" ]
    then
        echo "The equirements.txt file is empty - no dependencies"
    else
        # Pass the requirements to backend for proccessing and echo the results here.
        jq -n --arg requirements_arr "${requirements_arr[*]}" '{"dependencies": ($requirements_arr / " ") }' > dependencies.json
        curl -X POST http://localhost:5000/login -H 'Content-Type: application/json' -d @dependencies.json
    fi
else
    echo "This is not a git repo :("
fi