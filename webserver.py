import bottle
from bottle import request, get, static_file
from graf_funkcije import narisi


@get('/')
def zacetek():
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

    print(title)
    name = narisi(function, xmin, xmax, title, legend, xlabel, ylabel,
                  color, linewidth, fontsize, linestyle, grid, usetex, marker)

    return bottle.template("templates/graf.tpl", name=name)



bottle.run(debug=True, reloader=True)
