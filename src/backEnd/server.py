from flask import Flask
from flask import request, Response
import json
from dependencyExecutor import DependencyExecutor
from zooKeeperRegister import ZooKeeperRegisterClient


app = Flask(__name__)
dependencyExecutor = DependencyExecutor()
zooKeeperClient = ZooKeeperRegisterClient(app)
fetchFromSource = dependencyExecutor.fetchFromSource


@app.route('/scan', methods=['POST'])
def scan():
    dependencies = request.get_json()
    vulnerabilities = []
    try:
        vulnerabilities = fetchFromSource(dependencies)
    except Exception as err:
        print(err)
    if (len(vulnerabilities) > 0):
        return Response(json.dumps(vulnerabilities), status=200, mimetype='application/json')

    return Response("{}", status=200, mimetype='application/json')


app.run()
