# instagraf

A website that generates pretty graphs from mathematical formulas f(x), manually input numerical data or uploaded .csv files.

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
* plot graphs from uploaded .csv files
* change line and marker types, linewidth, fontsize, marker and line color
* display legend and/or grid
* fit straght line to data and get parameters

**To-do list:**
* plot graphs from direct manual input ... table for users to input numbers, add/remove rows as necessary
* FORM VALIDATION: add error messages

* function plot precision?
* `graph_csv.tpl` currently not picking up data from `home_csv.tpl`?
* custom image size?

* add tooltip instructions where necessary (Latex)
* add _toolbar_ to help write function expressions: `^ -> **`, `x -> *` ...
* match headers across pages
* Bootstrap `index.py`

## Status
My project is: _in progress_.
