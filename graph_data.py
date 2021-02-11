import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rc
from matplotlib import rcParams
from uuid import uuid4
from asteval import Interpreter
from matplotlib.ticker import ScalarFormatter
from scipy.optimize import curve_fit


def graph_data(x, y, hasxerror, xerr, hasyerror, yerr, title, xlabel, ylabel, fontsize, grid, usetex, legend,
               linestyle, linecolor, linewidth, marker, markercolor,linefit, fitcolor):
    plt.clf()
    rcParams['font.size'] = fontsize
    rcParams['xtick.labelsize'] = fontsize
    rcParams['ytick.labelsize'] = fontsize

    x = np.array(x)
    y = np.array(y)

    # default font (sans-serif)
    rc('font', **{'family': 'sans-serif', 'sans-serif': ['Arial']})

    if usetex == "on":  # use default Latex font (serif)
        rc('font', **{'family': 'serif', 'serif': ['Latin Modern Roman']})
        rc("text", usetex=True)

    if marker == "":
        plt.plot(x, y, color=linecolor, linestyle=linestyle,
                 linewidth=linewidth)
    if linestyle == "":
        plt.scatter(x, y, color=markercolor, marker=marker)
    else:
        plt.plot(x, y, color=linecolor, linestyle=linestyle,
                 linewidth=linewidth)
        plt.scatter(x, y, color=markercolor, marker=marker)

    if hasxerror == "on":
        if hasyerror == "on":
            plt.errorbar(x, y, xerr=xerr, yerr=yerr, color=markercolor,
                         marker=marker, linestyle="")
        else:
            plt.errorbar(x, y, xerr=xerr, color=markercolor,
                         marker=marker, linestyle="")
    elif hasyerror == "on":
        plt.errorbar(x, y, yerr=yerr, color=markercolor,
                     marker=marker, linestyle="")

    if linefit == "on":
        def premica(x, k, n):
            return k*x + n

        if hasyerror == "on":
            fitpar, fitcov = curve_fit(premica, xdata=x, ydata=y, sigma=yerr)
        else:
            fitpar, fitcov = curve_fit(premica, xdata=x, ydata=y)
        k, n = fitpar
        label = '$ y = kx  + n$\n$k = %.4f \pm %.4f$, \n$ n = %.4f \pm %.4f$' % (
            fitpar[0], fitcov[0][0]**0.5, fitpar[1], fitcov[1][1]**0.5)
        plt.plot(x, k*x + n, linewidth=linewidth,
                 color=fitcolor, label=label, zorder=-5)

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
