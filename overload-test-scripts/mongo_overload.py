from pymongo import MongoClient
import threading
import time

# List for saving all threads results.
results = []

# function to query the database
def query_database(db, query):
  start_time = time.time()
  # execute the query and print the results
  result = db.codegard_cache.find(query)
  for r in result:
    results.append(r)
    # print(r)
  elapsed_time = time.time() - start_time
  print(f"Thread ID: {threading.get_ident()}, Elapsed time: {elapsed_time} seconds")

# create a connection to the MongoDB server
conn_str = 'mongodb://localhost:27017'
client = MongoClient(conn_str, serverSelectionTimeoutMS=5000)

# get a reference to the database
db = client.codegard

# create a thread for each query
threads = []
for i in range(50):
  query = { "name": "requests" }
  t = threading.Thread(target=query_database, args=(db, query))
  threads.append(t)

# start the threads
for t in threads:
  t.start()

# wait for the threads to finish
for t in threads:
  t.join()


# close the connection to the server
client.close()

