import bottle
from bottle import request, get, static_file
from graph_func import graph_func
from graph_csv import graph_csv
from graph_data import graph_data
import os

# create directory 'output' for saved figures
if not os.path.exists("output"):
    os.makedirs("output")

    
@get("/")
def homepage():
    return bottle.template("templates/index.tpl")


@get("/static/<filename>.css")
def stylesheets(filename):
    return static_file("{}.css".format(filename), root="static")


@get("/home_func")
def homefunc():
    return bottle.template("templates/home_func.tpl")


@get("/graph_png/<filename>.png")
def png(filename):
    if filename == "error_image":
        return static_file("{}.png".format(filename), root="static")
    else:
        return static_file("{}.png".format(filename), root="output")


@get("/graph_pdf/<filename>.pdf")
def pdf(filename):
    if filename == "error_image":
        return static_file("{}.pdf".format(filename), root="static")
    else:
        return static_file("{}.pdf".format(filename), root="output")


@get("/home_csv")
def homecsv():
    return bottle.template("templates/home_csv.tpl")


@get("/home_data")
def homedata():
    return bottle.template("templates/home_data.tpl")


@get("/static/<filename>.jpg")  # for background image
def jpgimg(filename):
    return static_file("{}.jpg".format(filename), root="static")


@bottle.post("/graph_func")
def graph():
    function = request.forms.get("function")
    title = request.forms.get("title")
    xmin = request.forms.get("xmin")
    xmax = request.forms.get("xmax")
    legend = request.forms.get("legend")
    xlabel = request.forms.get("xlabel")
    ylabel = request.forms.get("ylabel")
    linecolor = request.forms.get("linecolor")
    linewidth = request.forms.get("linewidthRange")
    fontsize = request.forms.get("fontsizeRange")
    linestyle = request.forms.get("linestyle")
    grid = request.forms.get("grid")
    usetex = request.forms.get("usetex")
    try:
        name = graph_func(
            function,
            xmin,
            xmax,
            title,
            legend,
            xlabel,
            ylabel,
            linecolor,
            linewidth,
            fontsize,
            linestyle,
            grid,
            usetex,
        )
        return bottle.template(
            "templates/graph_func.tpl",
            errormessage="",
            name=name,
            function=function,
            title=title,
            xmin=xmin,
            xmax=xmax,
            legend=(legend == "on"),
            ylabel=ylabel,
            xlabel=xlabel,
            linecolor=linecolor,
            linewidth=linewidth,
            fontsize=fontsize,
            linestyle=linestyle,
            grid=grid,
            usetex=usetex,
        )
    except Exception:
        errormessage = "Vnešena formula ni ustrezna."
        return bottle.template(
            "templates/graph_func.tpl",
            errormessage=errormessage,
            name="error_image",
            function=function,
            title=title,
            xmin=xmin,
            xmax=xmax,
            legend=(legend == "on"),
            ylabel=ylabel,
            xlabel=xlabel,
            linecolor=linecolor,
            linewidth=linewidth,
            fontsize=fontsize,
            linestyle=linestyle,
            grid=grid,
            usetex=usetex,
        )


@bottle.post("/graph_csv")
def graphcsv():
    uploadfile = request.files.get("uploadfile")
    hasheader = request.forms.get("hasheader")

    xdata = request.forms.get("xdata")
    ydata = request.forms.get("ydata")
    delimiter = request.forms.get("delimiter")

    title = request.forms.get("title")
    xlabel = request.forms.get("xlabel")
    ylabel = request.forms.get("ylabel")

    fontsize = request.forms.get("fontsizeRange")
    grid = request.forms.get("grid")
    usetex = request.forms.get("usetex")
    legend = request.forms.get("legend")

    linestyle = request.forms.get("linestyle")
    linecolor = request.forms.get("linecolor")
    linewidth = request.forms.get("linewidthRange")

    marker = request.forms.get("marker")
    markercolor = request.forms.get("markercolor")

    linefit = request.forms.get("linefit")
    fitcolor = request.forms.get("fitcolor")

    try:
        name = graph_csv(
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
        )
        return bottle.template(
            "templates/graph_csv.tpl",
            errormessage="",
            name=name,
            delimiter=delimiter,
            xdata=xdata,
            ydata=ydata,
            title=title,
            xlabel=xlabel,
            ylabel=ylabel,
            fontsize=fontsize,
            grid=grid,
            usetex=usetex,
            legend=legend,
            linestyle=linestyle,
            linewidth=linewidth,
            linecolor=linecolor,
            marker=marker,
            markercolor=markercolor,
            linefit=linefit,
            fitcolor=fitcolor,
            hasheader=hasheader,
        )
    except Exception:
        errormessage = "Izbrana datoteka ni ustrezna ali izbrani stolpci ne obstajajo."
        return bottle.template(
            "templates/graph_csv.tpl",
            errormessage=errormessage,
            name="error_image",
            delimiter=delimiter,
            xdata=xdata,
            ydata=ydata,
            title=title,
            xlabel=xlabel,
            ylabel=ylabel,
            fontsize=fontsize,
            grid=grid,
            usetex=usetex,
            legend=legend,
            linestyle=linestyle,
            linewidth=linewidth,
            linecolor=linecolor,
            marker=marker,
            markercolor=markercolor,
            linefit=linefit,
            fitcolor=fitcolor,
            hasheader=hasheader,
        )


@bottle.post("/graph_data")
def graphdata():

    plotdatax = request.forms.get("plotdatax")
    plotdatay = request.forms.get("plotdatay")

    title = request.forms.get("title")
    xlabel = request.forms.get("xlabel")
    ylabel = request.forms.get("ylabel")

    fontsize = request.forms.get("fontsizeRange")
    grid = request.forms.get("grid")
    usetex = request.forms.get("usetex")
    legend = request.forms.get("legend")

    linestyle = request.forms.get("linestyle")
    linecolor = request.forms.get("linecolor")
    linewidth = request.forms.get("linewidthRange")

    marker = request.forms.get("marker")
    markercolor = request.forms.get("markercolor")

    linefit = request.forms.get("linefit")
    fitcolor = request.forms.get("fitcolor")

    hasyerror = request.forms.get("hasyerror")
    yerror = request.forms.get("yerror")

    hasxerror = request.forms.get("hasxerror")
    xerror = request.forms.get("xerror")

    try:
        name = graph_data(
            plotdatax,
            plotdatay,
            hasxerror,
            xerror,
            hasyerror,
            yerror,
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
        )
        return bottle.template(
            "templates/graph_data.tpl",
            errormessage="",
            hasxerror=hasxerror,
            hasyerror=hasyerror,
            xerror=xerror,
            yerror=yerror,
            plotdatay=plotdatay,
            plotdatax=plotdatax,
            name=name,
            title=title,
            xlabel=xlabel,
            ylabel=ylabel,
            fontsize=fontsize,
            grid=grid,
            usetex=usetex,
            legend=legend,
            linestyle=linestyle,
            linewidth=linewidth,
            linecolor=linecolor,
            marker=marker,
            markercolor=markercolor,
            linefit=linefit,
            fitcolor=fitcolor,
        )
    except Exception:
        errormessage = "Vnešeni podatki niso ustrezni."
        return bottle.template(
            "templates/graph_data.tpl",
            errormessage=errormessage,
            hasxerror=hasxerror,
            hasyerror=hasyerror,
            xerror=xerror,
            yerror=yerror,
            plotdatay=plotdatay,
            plotdatax=plotdatax,
            name="error_image",
            title=title,
            xlabel=xlabel,
            ylabel=ylabel,
            fontsize=fontsize,
            grid=grid,
            usetex=usetex,
            legend=legend,
            linestyle=linestyle,
            linewidth=linewidth,
            linecolor=linecolor,
            marker=marker,
            markercolor=markercolor,
            linefit=linefit,
            fitcolor=fitcolor,
        )


bottle.run(debug=True, reloader=True)
