import os
import time
from threading import Thread

def call_to_codeguard():
    start_time_op = time.time()
    os.system("codeguard")
    timing_list.append(time.time() - start_time_op)


timing_list= []
threads=[]
counter=1 
range_num=int(input("please insert the number of threads for oveload the codeguard cli ==>"))
for i in range(range_num):
    new_thread = Thread(target=call_to_codeguard)
    threads.append(new_thread)

for thread in threads:
    thread.join()


for j in timing_list: 
    print("Round {}: {} sec".format(counter,j))
    counter+=1

print("The test done !!")