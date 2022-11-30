# Codeguard

This repo holds all the code for Ruppin distributed systems final project.

Usage:

1. Download the codegaurd cli from \*\*\*
2. Copy the codegaurd file to /usr/local/bin
3. Make the file executable by running: cd /usr/local/bin && chmod +x codeguard

high level architecture:
![image](https://user-images.githubusercontent.com/82441934/202120826-42602753-1bea-448e-b46b-06102022dd7b.png)

Codeguard backend open discussions:

1. Kafka will be used between CLI requests to Codeguard backend.
2. MongoDB will be used as cache between codeguard backend to the open source DB.

Open issues:

1. Find a public API for dependencies vulnerabilities check -> Found: https://nvd.nist.gov/developers/ Use https://pypi.org/project/nvdlib/

Get vulnerabilities list from nist:
curl -X GET https://services.nvd.nist.gov/rest/json/cves/2.0?keywordSearch=python > vulnerabilities.json
