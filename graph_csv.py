import numpy as np
import matplotlib.pyplot as plt
from uuid import uuid4
from matplotlib import rc
from matplotlib import rcParams
from pandas import read_csv
from scipy.optimize import curve_fit


def get_data(uploadfile, hasheader, xdata, ydata, delimiter):
    xdata = int(xdata) - 1
    ydata = int(ydata) - 1
    if hasheader != "on":
        dat = read_csv(uploadfile.file, header=None, sep=delimiter)
    else:
        dat = read_csv(uploadfile.file, sep=delimiter)

    data = dat.to_numpy()
    x = data[:, xdata]
    y = data[:, ydata]

    xlabel = list(dat.columns)[xdata]
    ylabel = list(dat.columns)[ydata]

    return x, y, xlabel, ylabel


def graph_csv(
    uploadfile,
    title,
    xlabel,
    ylabel,
    fontsize,
    grid,
    usetex,
    legend,
    linestyle,
    linecolor,
    linewidth,
    marker,
    markercolor,
    linefit,
    fitcolor,
    hasheader,
    xdata,
    ydata,
    delimiter,
):
    plt.clf()
    rcParams["font.size"] = fontsize
    rcParams["xtick.labelsize"] = fontsize
    rcParams["ytick.labelsize"] = fontsize

    x, y, xlabel_head, ylabel_head = get_data(
        uploadfile, hasheader, xdata, ydata, delimiter
    )

    # default font (sans-serif)
    rc("font", **{"family": "sans-serif", "sans-serif": ["Arial"]})

    if usetex == "on":  # use default Latex font (serif)
        rc("font", **{"family": "serif", "serif": ["Latin Modern Roman"]})
        rc("text", usetex=True)

    if marker == "":
        plt.plot(x, y, c=linecolor, linestyle=linestyle, linewidth=linewidth)
    if linestyle == "":
        plt.scatter(x, y, c=markercolor, marker=marker)
    else:
        plt.plot(x, y, c=linecolor, linestyle=linestyle, linewidth=linewidth)
        plt.scatter(x, y, c=markercolor, marker=marker)

    if linefit == "on":

        def premica(x, k, n):
            return k * x + n

        # sigma = yerr?
        fitpar, fitcov = curve_fit(premica, xdata=x, ydata=y)
        k, n = fitpar
        label = "$ y = kx  + n$\n$k = %.4f \pm %.4f$, \n$ n = %.4f \pm %.4f$" % (
            fitpar[0],
            fitcov[0][0] ** 0.5,
            fitpar[1],
            fitcov[1][1] ** 0.5,
        )
        plt.plot(x, k * x + n, linewidth=linewidth, c=fitcolor, label=label, zorder=-5)
        if legend == "on":
            plt.legend(loc="best")

    if hasheader == "on":
        plt.xlabel(str(xlabel_head))
        plt.ylabel(str(ylabel_head))
    else:
        plt.xlabel(str(xlabel))
        plt.ylabel(str(ylabel))

    if title != None:
        plt.title(str(title))

    if grid == "on":
        plt.grid()

    plt.tight_layout()  # don't cut off axis labels

    name = uuid4().hex

    plt.savefig("output/" + name + ".png", dpi=300)
    plt.savefig("output/" + name + ".pdf")

    return name
