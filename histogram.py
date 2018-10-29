#!/bin/bash
#Author : Mohammad Ismail
#Email: mdismail543@gmail.com
#
import pandas as pd

data = pd.read_csv('error_per_min_out.log.csv', sep=',',header=None, index_col =0)

data.plot(kind='bar')
plt.ylabel('Errors')
plt.xlabel('Time')
plt.title('Error Rate')

plt.show()