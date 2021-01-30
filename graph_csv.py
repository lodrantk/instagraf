import numpy as np
import matplotlib.pyplot as plt
from uuid import uuid4
from matplotlib import rc
from matplotlib import rcParams
from pandas import read_csv
from scipy.optimize import curve_fit
from matplotlib.ticker import ScalarFormatter


"""
- file
- fontsize, usetex
- title, legend, xlabel, ylabel
- linecolor, linestyle, linewidth
- markercolor, marker
- linefit, fitcolor
- grid
- graphtype: scatter, line, bar, pie (x je lahko tudi string?)
... lahko se pa grem fizika in omogočam le plottanje številk in razširim fittanje premice na fittanje poljubne krivulje
- errors: plt.errorbar; to fiziki rabimo
- izberi kateri podatek je v katerem stolpcu (dropdown: x, y, xerr, yerr)
- kaj pa plottanje več funkcij iz .csv hkrati ... 
"""
def get_data(uploadfile, hasheader):
    if hasheader != "on":
        dat = read_csv(uploadfile.file, header=None)
    else:
        dat = read_csv(uploadfile.file)

    data = dat.to_numpy()
    x = data[:, 0]
    y = data[:, 1]
    xlabel = list(dat.columns)[0]
    ylabel = list(dat.columns)[1]

    return x, y, xlabel, ylabel

def graph_csv(uploadfile, title, xlabel, ylabel, fontsize, grid, usetex, legend, linestyle, linecolor, linewidth, marker, markercolor, linefit, fitcolor, hasheader):
    plt.clf()
    rcParams['font.size'] = fontsize
    rcParams['xtick.labelsize'] = fontsize
    rcParams['ytick.labelsize'] = fontsize

    x, y, xlabel_head, ylabel_head = get_data(uploadfile, hasheader)

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
    

    if hasheader == "on":
        plt.xlabel(str(xlabel_head))
        plt.ylabel(str(ylabel_head))
    else:
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



    # if graphtype == "line":
    #     # if "errors" == "on":
    #     #     plt.errorbar(x, y, xerr=xerr, yerr=yerr, color=color, linestyle=linestyle, linewidth=linewidth)
    #     if marker != "":
    #         plt.plot(x, y, linecolor=linecolor, linestyle=linestyle,
    #                  linewidth=linewidth, marker=marker, markersize=markersize)
    #     else:
    #         plt.plot(x, y, c=linecolor, linestyle=linestyle,
    #                  linewidth=linewidth)
    #         plt.scatter(x, y, c=markercolor, markersize=markersize, marker=marker)

    # if graphtype == "scatter":
    #     # if "errors" == "on":
    #     #     plt.errorbar(x, y, xerr=xerr, yerr=yerr, color=color, marker=marker, markersize=markersize)
    #     plt.scatter(x, y, c=markercolor, markersize=markersize, marker=marker)

    #... line and scatter graphs are easily achived by customizing the marker and line params, no need to set specific graphtype?