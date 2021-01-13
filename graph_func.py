import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rc
from matplotlib import rcParams
from uuid import uuid4
from asteval import Interpreter
from matplotlib.ticker import ScalarFormatter


def graph_func(function, xmin, xmax, title, legend, xlabel, ylabel, color, linewidth, fontsize, linestyle, grid, usetex, marker):
    plt.clf()
    rcParams.update(plt.rcParamsDefault) #tick-sizes were sketchy without reset
    rcParams['font.size'] = fontsize
    rcParams['xtick.labelsize'] = fontsize
    rcParams['ytick.labelsize'] = fontsize

    """
    - plot multiple functions at once ... ?
    - č, š, ž?
    """

    #set number format 1.56e-8
    plt.ticklabel_format(style='sci', scilimits=(-3, 4), axis='both')

    #change default font
    rc('font', **{'family': 'sans-serif', 'sans-serif': ['Arial']})

    if usetex == "on":  # use default Latex font
        rc('font', **{'family': 'serif', 'serif': ['Latin Modern Roman']})
        rc("text", usetex=True)

    if xmin == "" or xmax == "":
        # default domain
        x = np.linspace(-3, 3, 100)
    else:
        # both limits need to be set!
        x = np.linspace(float(xmin), float(xmax), 1000) #how can I properly set the precision??

    # evaluate function in a not evil way
    aevalc = Interpreter()
    expr = aevalc.parse(function.strip())
    aevalc.symtable['x'] = x
    y = aevalc.run(expr)

    plt.plot(x, y, linewidth=linewidth, color=color,
             linestyle=linestyle, label=function, marker=marker)

    plt.ylabel(str(ylabel))
    plt.xlabel(str(xlabel))

    if title != None:
        plt.title(str(title))

    if legend == "on":
        plt.legend(loc="best")
    if str(grid) == "on":
        plt.grid()

    plt.tight_layout()  # don't cut off axis labels

    name = uuid4().hex

    plt.savefig("output/" + name + ".png", dpi=300)
    plt.savefig("output/" + name + ".pdf")

    return name
