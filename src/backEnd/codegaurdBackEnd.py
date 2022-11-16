from flask import Flask
app = Flask(__name__)


@app.route('/login', methods=['GET'])
def login():
    return "this is working"
