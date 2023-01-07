from pymongo import MongoClient

class MongoDBConnector():

    def __init__(self):
        conn_str = 'mongo:27017'
        # conn_str = 'mongodb://localhost:27017'
        self.client = MongoClient(conn_str, serverSelectionTimeoutMS=5000)
        