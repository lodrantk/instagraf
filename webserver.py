import bottle
from bottle import request
from graf_funkcije import narisi
 
@bottle.get('/')
def zacetek():
    return bottle.template("index.html")

@bottle.post('/graf')
def graf_funkcije():
    function = request.forms.get("function")
    title = request.forms.get("title")
    xmin = request.forms.get("xmin")
    xmax = request.forms.get("xmax")
    legend = request.forms.get("legend")
    xlabel = request.forms.get("xlabel")
    ylabel = request.forms.get("ylabel")
    color = request.forms.get("color")
    linewidth = request.forms.get("linewidth")
    fontsize = request.forms.get("fontsize")
    linestyle = request.forms.get("linestyle")
    grid = request.forms.get("grid")
    usetex = request.forms.get("usetex")

    narisi(function, xmin, xmax, title, legend, xlabel, ylabel, color, linewidth, fontsize, linestyle, grid, usetex)

bottle.run(debug=True, reloader=True)