import numpy as np
import matplotlib.pyplot as plt

from matplotlib import rc
from matplotlib import rcParams
import pandas


"""
- file
- fontsize, usetex
- title, legend, xlabel, ylabel
- linecolor, linestyle
- markercolor, marker
- fittanje premice: linefit, fitcolor
- grid
- graphtype: scatter, line, bar, pie (x je lahko tudi string)
... lahko se pa grem fizika in omogočam le plottanje številk in razširim fittanje premice na fittanje poljubne krivulje
- errors: plt.errorbar; to fiziki rabimo
- izberi kateri podatek je v katerem stolpcu (dropdown: x, y, xerr, yerr)
- kaj pa plottanje več funkcij iz .csv hkrati ... 
"""


def narisi_cvs(file, title, legend, xlabel, ylabel, color, fitcolor, linewidth, fontsize, linestyle, grid, usetex, marker, graphtype):

    dat = pandas.read_csv(file)
    data = dat.to_numpy()
    x = data[:, 0]
    y = data[:, 1]

    if usetex == "on":
        rc('font', **{'family': 'serif', 'serif': ['Latin Modern Roman']})
        rc('text', usetex=True)

    rcParams['font.size'] = fontsize
    rcParams['xtick.labelsize'] = fontsize
    rcParams['ytick.labelsize'] = fontsize

    if graphtype == "line":
        # if "errors" == "on":
        #     plt.errorbar(x, y, xerr=xerr, yerr=yerr, color=color, linestyle=linestyle, linewidth=linewidth)
        if marker != "":
            plt.plot(x, y, color=color, linestyle=linestyle,
                     linewidth=linewidth, marker=marker, markersize=markersize)
        else:
            plt.plot(x, y, color=color, linestyle=linestyle,
                     linewidth=linewidth)

    if graphtype == "scatter":
        # if "errors" == "on":
        #     plt.errorbar(x, y, xerr=xerr, yerr=yerr, color=color, marker=marker, markersize=markersize)
        plt.plot(x, y, color=color, linestyle=linestyle, linewidth=linewidth)

    if linefit == "on":
        def premica(x, k, n):
            return k*x + n

        # kaj naredi sigma če je yerr prazen
        fitpar, fitcov = curve_fit(premica, xdata=x, ydata=y, sigma=yerr)
        k, n = fitpar
        oznaka = '$ y = kx  + n$\n$k = %.4f \pm %.4f$, \n$ n = %.4f \pm %.4f$' % (
            fitpar[0], fitcov[0][0]**0.5, fitpar[1], fitcov[1][1]**0.5)
        plt.plot(x, k*x + n, markersize=markersize, linewidth=linewidth,
                 color=fitcolor, label=oznaka, zorder=-5)  # zorder ker hočem premico zadaj

    plt.ylabel(str(ylabel))
    plt.xlabel(str(xlabel))

    if title != None:
        plt.title(str(title))

    if legend == "on":
        plt.legend(loc="best")
    if str(grid) == "on":
        plt.grid()

    name = uuid4().hex

    plt.savefig("output/" + name + ".png", dpi=300)
    plt.savefig("output/" + name + ".pdf")
    return name
