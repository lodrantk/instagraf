import numpy as np
from sympy.parsing.sympy_parser import parse_expr
import matplotlib.pyplot as plt
from matplotlib import rc
from matplotlib import rcParams
from uuid import uuid4
from sympy.utilities.lambdify import lambdify
from asteval import Interpreter

def narisi(function, xmin, xmax, title, legend, xlabel, ylabel, color, linewidth, fontsize, linestyle, grid, usetex, marker):
    plt.clf()
    print(marker)

    if usetex == "on":
        rc('font', **{'family': 'serif', 'serif': ['Latin Modern Roman']})
        rc('text', usetex=True)
        plt.gcf().subplots_adjust(bottom=0.2, left=0.2)

    rcParams['font.size'] = fontsize
    rcParams['xtick.labelsize'] = fontsize
    rcParams['ytick.labelsize'] = fontsize

    if xmin == "" or xmax == "":
        x = np.linspace(-3, 3, 100)
    else:
        x = np.linspace(float(xmin), float(xmax), 100)

    aevalc = Interpreter()

    exprc = aevalc.parse(function)
    aevalc.symtable['x'] = x
    y = aevalc.run(exprc)

    plt.plot(x, y, linewidth=linewidth, color=color,
             linestyle=linestyle, label=function, marker=marker)

    plt.ylabel(str(ylabel))
    plt.xlabel(str(xlabel))

    if title != None:
        plt.title(str(title))

    if legend == "on":
        plt.legend(loc="best")
    if grid == "on":
        plt.grid

    name = uuid4().hex

    plt.savefig("output/" + name + ".png", dpi=300)
    plt.savefig("output/" + name + ".pdf")
    return name
