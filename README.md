#  (fizikalni) instagraf

A website that generates pretty graphs from mathematical formulas f(x), manually input numerical data or uploaded .csv files. Perfect for young physicists adding plots to their reports.

Projekt pri predmetu Računalništvo (Fizika, 2. letnik, FMF UL).

## Setup
To run Instagraf locally and observe it's current condition:

Make sure you have pipenv installed (or run `pip install pipenv`). 

Then you can run:

`pipenv install`

`pipenv shell`

`python webserver.py`.

## Sources and Technologies
* the webserver is based on the Python Web Framework [Bottle](https://bottlepy.org/docs/dev/)
* all graphs are drawn with [Matplotlib](https://matplotlib.org/3.1.0/index.html), with the help of [Numpy](https://numpy.org/doc/stable/) and [Pandas](https://pandas.pydata.org/) (for .csv file import data)
* responsive website design is made with [Bootstrap v.5](https://getbootstrap.com/)
* user-input mathematical functions are safely evaluated by [Asteval](https://newville.github.io/asteval/)

All used JavaScript code is sourced directly from the internet (as I don't know much JavaScript at this point):
* [show/hide division](http://jsfiddle.net/mithunsatheesh/wwcRr/),
* [customized upload-file button](https://stackoverflow.com/questions/41542845/how-to-display-file-name-for-custom-styled-input-file-using-jquery).

So are some style features:
* [customized range slider](https://www.w3schools.com/howto/howto_js_rangeslider.asp).

## Features
* plot functions f(x)
* plot data from uploaded .csv files or data from direct input (scatter or line plot)
* save your plots as .pdf or .png
* customize your plots: 
    * change line and marker types, marker and line color, linewidth, fontsize ...
    * display legend and/or grid
    * use Latex notation (ex. $\frac{U_0}{I_max}$) in the plot title and axis labels
    * fit straght line to data and get parameters

**To-do list:**
* plot from input:
    * import from `home` to `graph`
    * fontsize params not recognized? (returns TypeError)

* FORM VALIDATION: how to?
    * validate that file is in fact `.csv`
    * validate formula
    * validate input data

* function plot precision?
* `graph_csv.tpl` currently not picking up data from `home_csv.tpl`?
* custom image size?

* add tooltip instructions where necessary (Latex)
* add _toolbar_ to help write function expressions: `^ -> **`, `x -> *` ...
* match headers across pages
* č, š, ž work in labels when plotting from home-page, but not from graph-page?


## Status
My project is: _in progress_.
