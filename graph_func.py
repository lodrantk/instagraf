import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rc
from matplotlib import rcParams
from uuid import uuid4
from asteval import Interpreter

def graph_func(function, xmin, xmax, title, legend, xlabel, ylabel, linecolor, linewidth, fontsize, linestyle, grid, usetex):
    plt.clf()
    plt.rcdefaults() #tick-sizes were sketchy without reset
    rcParams['font.size'] = fontsize
    rcParams['xtick.labelsize'] = fontsize
    rcParams['ytick.labelsize'] = fontsize

    #change default font
    rc('font', **{'family': 'sans-serif', 'sans-serif': ['Arial']})

    if usetex == "on":  # use default Latex font
        rc('font', **{'family': 'serif', 'serif': ['Latin Modern Roman']})
        rc("text", usetex=True)

    if xmin == "" or xmax == "":
        x = np.linspace(0, 5, 100000)
    else:
        # both limits need to be set!
        x = np.linspace(float(xmin), float(xmax), 100000) #how can I properly set the precision??
    
    # evaluate function in a not evil way
    aevalc = Interpreter()
    expr = aevalc.parse(function.strip())
    aevalc.symtable['x'] = x
    y = aevalc.run(expr)

    #plot function
    plt.plot(x, y, linewidth=linewidth, color=linecolor,
             linestyle=linestyle, label=function)
    
    plt.ylabel(str(ylabel))
    plt.xlabel(str(xlabel))

    if title != None:
        plt.title(str(title))
    if legend == "on":
        plt.legend(loc="best")
    if grid == "on":
        plt.grid()

    plt.tight_layout()  # don't cut off axis labels
    name = uuid4().hex # generate file name

    plt.savefig("output/" + name + ".png", dpi=300)
    plt.savefig("output/" + name + ".pdf")

    return name
