import matplotlib.pyplot as plt
import pandas as pd

data = pd.read_csv('test5.csv', sep=',',header=None, index_col =0)

data.plot(kind='bar')
plt.ylabel('Responce')
plt.xlabel('Time')
plt.title('Responce Time')

plt.show()