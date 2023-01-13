# Codeguard

This repo holds all the code for Ruppin distributed systems final project.

## System requirements

1. Unix-like operating system. Example: MacOs, Linux.
2. Docker & Docker compose. [Link](https://www.docker.com/)
3. Git. [Link](https://git-scm.com/)
4. jq. [Link](https://stedolan.github.io/jq/)
5. pipreqs. [Link](https://pypi.org/project/pipreqs/)

## Usage:

1. Clone the codeguard repo.
2. Change directory to src/cli. (cd src/cli)
3. Run the install_cli.sh installation script as admin. (sudo ./install_cli.sh)
4. Change to the repo main directory. (cd ../.. from /cli)
5. Run the docker compose file. (docker compose up -d)
6. Scan for vulnerabilitiesusing using the codeguard CLI. (use codeguard -h for CLI usage instructions)

**Note: For step 3: verify you have the right premissions on '/usr/local/bin' for installation.**

## High level architecture:


![codeguard_architecture drawio](https://user-images.githubusercontent.com/82441934/212345554-3bbc447b-aba6-43d0-97dc-394be4f5eda2.png)
