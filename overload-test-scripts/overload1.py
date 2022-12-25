import os
import time
from threading import Thread

def call_to_codeguard():
    start_time_op=time.time()
    os.system("codeguard scan")
    start_time.append(time.time -start_time_op)


start_time= []
threads=[]
range_num=int(input("please insert the number of threads for oveload the codeguard cli ==>"))
for i in range(5):
    new_thread = Thread(target=call_to_codeguard)
    threads.append(new_thread)

for thread in threads:
    thread.join()