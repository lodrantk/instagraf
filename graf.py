import numpy as np
import matplotlib.pyplot as plt

from matplotlib import rc
from matplotlib import rcParams
import pandas

dat = pandas.read_csv("m45_HR5-result.csv")
data = dat.to_numpy()
x = data[:, 0]
y = data[:, 1]



# if graphtype == "scatter":
#     plt.scatter(x, y, color=color, fmt=fmt, markersize=markersize)
# if graphtype == "line":
#     plt.plot(x, y, color=color, linestyle=linestyle, linewidth=linewidth, )
# if graphtype == "scatter":
#     plt.scatter(x, y, color=color, marker=marker, markersize=markersize)

