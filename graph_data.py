import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rc
from matplotlib import rcParams
from uuid import uuid4
from asteval import Interpreter
from matplotlib.ticker import ScalarFormatter


def graph_data(plotdatax, plotdatay, title, xlabel, ylabel, fontsize, grid, usetex, legend,
                     linestyle, linecolor, linewidth, marker, markercolor, linefit, fitcolor):
    plt.clf()

"""
    rcParams['font.size'] = fontsize
    rcParams['xtick.labelsize'] = fontsize
    rcParams['ytick.labelsize'] = fontsize
"""
    x = list(map(int, plotdatax.split(",")))
    y = list(map(int, plotdatax.split(",")))

    # default font (sans-serif)
    rc('font', **{'family': 'sans-serif', 'sans-serif': ['Arial']})

    if usetex == "on":  # use default Latex font (serif)
        rc('font', **{'family': 'serif', 'serif': ['Latin Modern Roman']})
        rc("text", usetex=True)

    if marker == "":
        plt.plot(x, y, c=linecolor, linestyle=linestyle,
                     linewidth=linewidth)
    if linestyle == "":
        plt.scatter(x, y, c=markercolor, marker=marker)
    else:
        plt.plot(x, y, c=linecolor, linestyle=linestyle,
                     linewidth=linewidth)
        plt.scatter(x, y, c=markercolor, marker=marker)
    
    if linefit == "on":
        def premica(x, k, n):
            return k*x + n

        # sigma = yerr?
        fitpar, fitcov = curve_fit(premica, xdata=x, ydata=y)
        k, n = fitpar
        label = '$ y = kx  + n$\n$k = %.4f \pm %.4f$, \n$ n = %.4f \pm %.4f$' % (
            fitpar[0], fitcov[0][0]**0.5, fitpar[1], fitcov[1][1]**0.5)
        plt.plot(x, k*x + n, linewidth=linewidth,
                 c=fitcolor, label=label, zorder=-5)
    
    plt.xlabel(str(xlabel))
    plt.ylabel(str(ylabel))

    if title != None:
        plt.title(str(title))

    if legend == "on":
        plt.legend(loc="best")
    if grid == "on":
        plt.grid()

    plt.tight_layout()  # don't cut off axis labels

    name = uuid4().hex

    plt.savefig("output/" + name + ".png", dpi=300)
    plt.savefig("output/" + name + ".pdf")
    return name
