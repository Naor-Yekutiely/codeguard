from flask import Flask
from flask import request
import json
import requests


app = Flask(__name__)


@app.route('/login', methods=['POST'])
def login():
    dependencies = request.get_json()
    vulnerabilities = []
    for dependency in dependencies["dependencies"]:
        try:
            vulnerability = requests.get(
                f'https://services.nvd.nist.gov/rest/json/cves/2.0?keywordSearch=influxdb==5.3.1')

            if vulnerability.status_code == 200:
                vulnerabilities.append(vulnerability)
            else:
                print("Get Request with parameter Failed!!.")
        except Exception as err:
            print(err)

    return ""


app.run()


# @app.route('/search', methods=['GET'])s
# def search():
#     x = requests.get('https://services.nvd.nist.gov/rest/json/cves/2.0')
#     print(x.status_code)
#     if x.status_code == 200:
#             return x.json()
#     else:
#      return "Get Request Failed!!."


# @app.route('/keyword', methods=['GET'])
# def search():
#     x = requests.get('https://services.nvd.nist.gov/rest/json/cves/2.0?keywordSearch='+requests.args.get("keywordSearch"))
#     print(x.status_code)
#     if x.status_code == 200:
#             return x.json()
#     else:
#      return "Get Request with parameter Failed!!."
