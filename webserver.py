import bottle
from bottle import request, get, static_file
from graph_func import graph_func
from graph_csv import graph_csv
import os

# create directory 'output' for saved figures
if not os.path.exists('output'):
    os.makedirs('output')


@get('/')
def homepage():
    return bottle.template("templates/index.tpl")


@get('/home_func')
def homefunc():
    return bottle.template("templates/home_func.tpl")


@get('/home_csv')
def homecsv():
    return bottle.template("templates/home_csv.tpl")


@get('/static/<filename>.css')
def stylesheets(filename):
    return static_file('{}.css'.format(filename), root='static')


@get('/graph_func/<filename>.png')
def pnggraphs(filename):
    return static_file('{}.png'.format(filename), root='output')


@get('/static/<filename>.jpg')
def pngimg(filename):
    return static_file('{}.jpg'.format(filename), root='static')


@get('/graph_func/<filename>.pdf')
def pdfgraphs(filename):
    return static_file('{}.pdf'.format(filename), root='output')


@bottle.post('/graph_func')
def graph():
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

    name = graph_func(function, xmin, xmax, title, legend, xlabel, ylabel,
                      color, linewidth, fontsize, linestyle, grid, usetex, marker)

    return bottle.template("templates/graph_func.tpl", name=name, function=function, title=title, xmin=xmin, xmax=xmax, legend=(legend == "on"), ylabel=ylabel, xlabel=xlabel, color=color, linewidth=linewidth, fontsize=fontsize, linestyle=linestyle, grid=grid, usetex=usetex, marker=marker)


@bottle.post('/graph_csv')
def graphcsv():
    uploadfile = request.files.get('uploadfile')

    title = request.forms.get("title")
    xlabel = request.forms.get("xlabel")
    ylabel = request.forms.get("ylabel")

    fontsize = request.forms.get("fontsize")
    grid = request.forms.get("grid")
    usetex = request.forms.get("usetex")
    legend = request.forms.get("legend")

    linestyle = request.forms.get("linestyle")
    linecolor = request.forms.get("linecolor")
    linewidth = request.forms.get("linewidth")

    marker = request.forms.get("marker")
    markercolor = request.forms.get("markercolor")

    linefit = request.forms.get("linefit")
    fitcolor = request.forms.get("fitcolor")

    name = graph_csv(uploadfile, title, xlabel, ylabel, fontsize, grid, usetex, legend,
                     linestyle, linecolor, linewidth, marker, markercolor, linefit, fitcolor)

    return bottle.template("templates/graph_csv.tpl", name=name, title=title, xlabel=xlabel, ylabel=ylabel, fontsize=fontsize, grid=grid, usetex=usetex, legend=legend, linestyle=linestyle, linewidth=linewidth, linecolor=linecolor, marker=marker, markercolor=markercolor, linefit=linefit, fitcolor=fitcolor)


bottle.run(debug=True, host="0.0.0.0", port=80, reloader=True)
