#!/usr/bin/env bash

usage() {
    echo "Usage: $0 [-s <package>] [-u] [-h]" 1>&2; exit 1; 
}
echoVersion() {
    echo "1.0.3"
}
help() {
    echo '''
    Usage: codeguard [-s <package>] [-u] [-h]
    codeguard                   Full Git repository scan
    codeguard -s <package>      Specific package scan
    codeguard -u                Update CLI to latest release
    codeguard -h                Involved overview
    codeguard -v                Get installed CLI version
    '''
}
echoCodeguardResponse() {
    echo -e "\n-------------------------------------------- codeguard --------------------------------------------\n"
    echo "$1"
    echo -e "\n-------------------------------------------- codeguard --------------------------------------------\n"
}
echoCodeguardJsonResponse() {
    echo -e "\n-------------------------------------------- codeguard --------------------------------------------\n"
    jq -n "$response"
    echo -e "\n-------------------------------------------- codeguard --------------------------------------------\n"
}
executeScanRequest() {
    dependencies=("$@")
    if [ -z $dependencies ]; then
        echoCodeguardResponse "Internal server error occured"
    fi

    jq -n --arg dependencies "${dependencies[*]}" '{"dependencies": ($dependencies / " ") }' > dep.json
    response=$(curl -X POST http://localhost:80/scan -H 'Content-Type: application/json' -d @dep.json | jq .)
    rm -rf dep.json

    echo $response
}

while getopts ":s:uhv" o; do
    case "${o}" in
        s)
        # Specific pacakge scan
            s=${OPTARG}
            response=$(executeScanRequest $s)

            if [[ "$response" = "[]" ]]; then
                echoCodeguardResponse "No vulnerabilities found for $s"
            else
                echoCodeguardJsonResponse "$response"
            fi
            ;;
        u)
        # Update CLI to latest release version
            # Save working directory
            wd=$(pwd)
            # Get the latest release version tag
            latest_tag=$(curl -s https://api.github.com/repos/Naor-Yekutiely/codeguard/releases/latest | sed -Ene '/^ *"tag_name": *"(v.+)",$/s//\1/p')
            echo "Installing codeguard CLI version: $latest_tag"
            # Fetch the release artifacts
            curl -JLO https://github.com/Naor-Yekutiely/codeguard/archive/$latest_tag.tar.gz
            latest_tag_num="${latest_tag:1}"
            # Extract artifact
            tar -xf "codeguard-$latest_tag_num.tar.gz"
            cd "codeguard-$latest_tag_num/src/cli"
            # Install
            source ./install_cli.sh
            # Clean up
            cd $wd
            rm -rf "codeguard-$latest_tag_num.tar.gz"
            rm -rf "codeguard-$latest_tag_num"
            ;;
        h)
        # Help
            help
            ;;
        v)
        # Get installed CLI version
            echoVersion
            ;;
        *)
        # Error handling
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ $OPTIND -eq 1 ]; then 
    # Repo scan
    if [ -d .git ]
    then
        pipreqs --force >nul 2>nul
        # Pass the dependency to the server for vulnerability scan
        requirements_arr=();
        while read line || [ -n "$line" ]
        do
            requirements_arr+=($line)
        done < requirements.txt

        if [ -z "$requirements_arr" ]
        then
            echoCodeguardResponse "The requirements.txt file is empty - no dependencies"
        else
            response=$(executeScanRequest "${requirements_arr[@]}")

            if [[ "$response" = "[]" ]]; then
                echoCodeguardResponse "No vulnerabilities found."
            else
                echoCodeguardJsonResponse "$response"
            fi
        fi
    else
        echoCodeguardResponse "This is not a git repository. Please run codeguard within a scope of a git repository"
    fi
 fi
 
