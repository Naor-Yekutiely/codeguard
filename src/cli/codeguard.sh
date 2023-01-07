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
        echo "The requirements.txt file is empty - no dependencies"
    else
        # Pass the requirements to backend for proccessing and echo the results here.
        jq -n --arg requirements_arr "${requirements_arr[*]}" '{"dependencies": ($requirements_arr / " ") }' > dependencies.json
        response=$(curl -X POST http://localhost:80/scan -H 'Content-Type: application/json' -d @dependencies.json | jq .)
        # response=$(curl -X POST localhost:8404/scan -H 'Content-Type: application/json' -d @dependencies.json | jq .)
        # TODO: check if the response is validd 200 and if not emptey. emptey means no varnubilities were found
        if [[ "$response" = "[]" ]]; then
            echoCodeguardResponse "No vulnerabilities found."
        else
            echoCodeguardResponse $response
        fi
    fi
else
    echoCodeguardResponse "This is not a git repository. Please run codeguard within a scope of a git repository"
fi

