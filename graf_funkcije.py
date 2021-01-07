import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rc
from matplotlib import rcParams
from uuid import uuid4
from asteval import Interpreter
from matplotlib.ticker import ScalarFormatter

def narisi(function, xmin, xmax, title, legend, xlabel, ylabel, color, linewidth, fontsize, linestyle, grid, usetex, marker):
    plt.clf()

    plt.ticklabel_format(style='sci',scilimits=(-3,4),axis='both') #velike in majhne številke zapiši v formatu 1.56e-8

    if usetex == "on": #uporabi latex font, $$ math $$ notacijo upošteva tudi sicer
        rc('font', **{'family': 'serif', 'serif': ['Latin Modern Roman']})
        rc('text', usetex=True)
        # if xlabel != "" or ylabel != "":
        #     plt.gcf().subplots_adjust(bottom=0.2, left=0.2) ... tega ne rabim, če bo tight_layout() opravil svoje delo
    else:
        ScalarFormatter(useMathText=True) #zapiši desetice 1.56*10^-8 ... očitno NE DELUJE !!! 

    rcParams['font.size'] = fontsize
    rcParams['xtick.labelsize'] = fontsize #bi se to splačalo posebej določat kot "labelsize"?; če uvedemo "napredno"
    rcParams['ytick.labelsize'] = fontsize

    if xmin == "" or xmax == "":
        x = np.linspace(-3, 3, 100) #privzeto def. območje, če ga uporabnik ne specificira
    else:
        x = np.linspace(float(xmin), float(xmax), 100) #če vpiše samo eno mejo zanekrat dobi graf v privzetih mejah

    #evaluate function in a not evil way
    aevalc = Interpreter()
    expr= aevalc.parse(function.strip())
    aevalc.symtable['x'] = x
    y = aevalc.run(expr)

    plt.plot(x, y, linewidth=linewidth, color=color,
             linestyle=linestyle, label=function, marker=marker)

    plt.ylabel(str(ylabel)) #zdaj se sesuje za č, š, ž
    plt.xlabel(str(xlabel))

    if title != None:
        plt.title(str(title))

    if legend == "on":
        plt.legend(loc="best")
    if str(grid) == "on":
        plt.grid()

    plt.tight_layout() #poskuša ne odrezat oznak osi    

    name = uuid4().hex

    plt.savefig("output/" + name + ".png", dpi=300)
    plt.savefig("output/" + name + ".pdf")
    
    return name
