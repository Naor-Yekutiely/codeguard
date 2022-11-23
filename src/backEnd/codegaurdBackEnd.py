from flask import Flask
import requests


app = Flask(__name__)


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
