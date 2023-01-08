from flask import Flask
from flask import request, Response
import json
import sys
from dependencyExecutor import DependencyExecutor



app = Flask(__name__)
dependencyExecutor = DependencyExecutor()
fetchFromSource = dependencyExecutor.fetchFromSource


@app.route('/scan', methods=['POST'])
def scan():
    dependencies = request.get_json()
    vulnerabilities = []
    try:
        vulnerabilities = fetchFromSource(dependencies)
    except Exception as err:
        print(err, file=sys.stdout)
    if (len(vulnerabilities) > 0):
        return Response(json.dumps(vulnerabilities), status=200, mimetype='application/json')

    return Response("[]", status=404, mimetype='application/json')

@app.route('/test', methods=['POST'])
def test():
    return Response("[]", status=200)



app.run(host="0.0.0.0")
