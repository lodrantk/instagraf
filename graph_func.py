import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rc
from matplotlib import rcParams
from uuid import uuid4
from asteval import Interpreter
from matplotlib.ticker import ScalarFormatter


def graph_func(function, xmin, xmax, title, legend, xlabel, ylabel, color, linewidth, fontsize, linestyle, grid, usetex, marker):
    plt.clf()

    """
    - "marker" tu niti nima smisla, ker je le posledica moje izbrane natančnosti
    - plottanje več funkcij hkrati ...?
    - sesuje se za č, š, ž v oznakah: rc("text.latex", unicode= True) se trudi, ampak mu ne uspe
    """

    # velike in majhne številke zapiši v formatu 1.56e-8
    plt.ticklabel_format(style='sci', scilimits=(-3, 4), axis='both')

    # privzet font: Helvetica noče delovat?
    rc('font', **{'family': 'sans-serif', 'sans-serif': ['Arial']})

    if usetex == "on":  # uporabi latex Modern Roman font
        rc('font', **{'family': 'serif', 'serif': ['Latin Modern Roman']})
        rc("text", usetex=True)
    else:
        # zapiši desetice 1.56*10^-8 ... očitno NE DELUJE !!!, latex to naredi sam
        ScalarFormatter(useMathText=True)

    rcParams['font.size'] = fontsize
    # bi se to splačalo posebej določat kot "labelsize"?; če uvedemo "napredno"
    rcParams['xtick.labelsize'] = fontsize
    rcParams['ytick.labelsize'] = fontsize

    if xmin == "" or xmax == "":
        # privzeto def. območje, če ga uporabnik ne specificira
        x = np.linspace(-3, 3, 100)
    else:
        # če vpiše samo eno mejo zaenkrat dobi graf v privzetih mejah
        # kakšna naj bo tu natanačnost num=št. točk med mejama=int?
        x = np.linspace(float(xmin), float(xmax), 1000)

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

    plt.tight_layout()  # poskuša ne odrezat oznak osi

    name = uuid4().hex

    plt.savefig("output/" + name + ".png", dpi=300)
    plt.savefig("output/" + name + ".pdf")

    return name
