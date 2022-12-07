from flask import Flask
import requests
import signal
from leader_election_algo import LeaderElection
from multiprocessing import Process
import time

def handler(signum, frame):
    le.zk.stop()
    le.zk.close()
    exit(1)


app = Flask(__name__)
app.secret_key = "super secret key"
le = LeaderElection('localhost:2181', 'AppChat', '/election')
le.register()
signal.signal(signal.SIGINT, handler)


@app.route('/login', methods=['GET'])
def login():
    return "this is working"


@app.route('/search', methods=['GET'])
def search():
    x = requests.get('https://services.nvd.nist.gov/rest/json/cves/2.0')
    print(x.status_code)
    if x.status_code == 200:
            return x.json()
    else:            
     return "Get Request Failed!!."


@app.route('/keyword', methods=['GET'])
def search():
    x = requests.get('https://services.nvd.nist.gov/rest/json/cves/2.0?keywordSearch='+requests.args.get("keywordSearch"))
    print(x.status_code)
    if x.status_code == 200:
            return x.json()
    else:            
     return "Get Request with parameter Failed!!."
