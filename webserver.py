import bottle
from bottle import request, get, static_file
from graf_funkcije import narisi


@get('/')
def zacetna():
    return bottle.template("templates/index.tpl")


@get('/static/<filename>.css')
def stylesheets(filename):
    return static_file('{}.css'.format(filename), root='static')


@get('/graf/<filename>.png')
def pnggraphs(filename):
    return static_file('{}.png'.format(filename), root='output')


@get('/static/<filename>.png')
def pngimg(filename):
    return static_file('{}.png'.format(filename), root='static')


@get('/graf/<filename>.pdf')
def pdfgraphs(filename):
    return static_file('{}.pdf'.format(filename), root='output')


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
    marker = request.forms.get("marker")

    name = narisi(function, xmin, xmax, title, legend, xlabel, ylabel,
                  color, linewidth, fontsize, linestyle, grid, usetex, marker)

    return bottle.template("templates/graf.tpl", name=name, function=function, title=title, xmin=xmin, xmax=xmax, legend=(legend == "on"), ylabel=ylabel, xlabel=xlabel, color=color, linewidth=linewidth, fontsize=fontsize, linestyle=linestyle, grid=grid, usetex=usetex, marker=marker)


bottle.run(debug=True, host="0.0.0.0", port=80, reloader=True)
