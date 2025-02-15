import os
import numpy as np
import pandas as pd
import shutil
import csv

data_files = os.listdir("results")
file_types = ['power.txt','timing.txt','utilization.txt']

req_data = ['Total On-Chip Power','Data Path Delay','Slice LUTs']

Power = []
Delay = []
LUTs = []

for data in data_files :
    for file in file_types:
        with open("results/{}/{}".format(data,file),'r') as File:
             inp = File.read()

        words = inp.split('\n')   

        for req_word in words:
            if file_types[0] in file:
                if req_data[0] in req_word:
                    pwr = float(req_word.split()[6])
                    Power.append(pwr)
  

        for req_word in words:
            if file_types[1] in file:
                if req_data[1] in req_word:
                    delay = float(req_word.split()[3][:-2])
                    Delay.append(delay)


        for req_word in words:
            if file_types[2] in file:
                if req_data[2] in req_word:
                    luts = float(req_word.split()[4])
                    LUTs.append(luts)
             
Final_results = [Power,Delay,LUTs]
row_name = ['Power','Delay','LUTs']

df = pd.DataFrame(Final_results, index = row_name)
df.columns = data_files

df.to_csv('Final_results.csv', index = row_name)