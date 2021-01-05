import numpy as np
from numpy import *
import matplotlib.pyplot as plt
from matplotlib import rc
from matplotlib import rcParams

def narisi(function, xmin, xmax, title, legend, xlabel, ylabel, color, linewidth, fontsize, linestyle, grid, usetex):
    plt.clf()

    if usetex == "on":
        rc('font', **{'family': 'serif', 'serif': ['Latin Modern Roman']})
        rc('text', usetex=True)
        plt.gcf().subplots_adjust(bottom=0.2, left=0.2)

    rcParams['font.size'] = fontsize
    rcParams['xtick.labelsize'] = fontsize
    rcParams['ytick.labelsize'] = fontsize

    if xmin == "" or xmax == "":
        x = np.linspace(-3, 3, 1000)
    else:
        x = np.linspace(float(xmin), float(xmax), 1000)

    plt.plot(x, eval(function), linewidth=linewidth, color=color, linestyle=linestyle, label=function)
   
    plt.ylabel(str(ylabel))
    plt.xlabel(str(xlabel))

    if title != None:
        plt.title(str(title))

    if legend == "on":
        plt.legend(loc="best")
    if grid == "on":
        plt.grid

    return plt.savefig("graf.png", dpi=300)
