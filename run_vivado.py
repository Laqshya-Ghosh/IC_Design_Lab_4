import os
import numpy as np
import pandas as pd
import shutil
import csv

models = os.listdir("Modules")
os.system("vivado -mode batch -source tcl_create.tcl")

for mod in models:
    os.system("vivado -mode batch -source  tcl_add.tcl -tclargs {}".format(mod))

os.mkdir("results")

for filename in models:
    os.mkdir("results/"+filename[:-2])
    os.system("vivado -mode batch -source  tcl_run.tcl -tclargs {}".format(filename))
