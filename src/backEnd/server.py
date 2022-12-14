from flask import Flask
from flask import request, Response
import json
from dependencyExecutor import DependencyExecutor
from leaderElection import LeaderElection
import signal


def handler(signum, frame):
    le.zk.stop()
    le.zk.close()
    exit(1)


app = Flask(__name__)
dependencyExecutor = DependencyExecutor()
fetchFromSource = dependencyExecutor.fetchFromSource

app.secret_key = "super secret key"
le = LeaderElection('localhost:2181', 'codeguard', '/election')
le.register()
signal.signal(signal.SIGINT, handler)


@app.route('/scan', methods=['POST'])
def login():
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
