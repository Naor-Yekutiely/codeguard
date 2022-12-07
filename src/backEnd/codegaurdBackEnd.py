from flask import Flask
from flask import request, Response
import json
import requests


app = Flask(__name__)


@app.route('/scan', methods=['POST'])
def login():
    dependencies = request.get_json()
    vulnerabilities = []
    for dependency in dependencies["dependencies"]:
        try:
            response = requests.get(
                f'https://services.nvd.nist.gov/rest/json/cves/2.0?keywordSearch={dependency}')

            if response.status_code == 200:
                response_body = json.loads(response.text)
                if (response_body['totalResults'] > 0):
                    vulnerability = {
                        "dependency_name": dependency,
                        "number_of_found_vulnerabilities": len(response_body['vulnerabilities'])
                    }
                    vulnerabilities.append(vulnerability)
            else:
                print(
                    f'Get Request with parameter Failed with status code {response.status_code}')
        except Exception as err:
            print(err)
    if (len(vulnerabilities) > 0):
        return Response(json.dumps(vulnerabilities), status=200, mimetype='application/json')

    return Response("{}", status=200, mimetype='application/json')


app.run()
