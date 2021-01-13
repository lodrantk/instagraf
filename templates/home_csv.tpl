<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>instagraf</title>
    <link rel="stylesheet" href="static/style.css" type="text/css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flexboxgrid/6.3.1/flexboxgrid.css"
        type="text/css">
</head>

<body>
    <div class="page">
        <div class="row center-xs">
            <h3 class="hero-headline">instagraf podatkov</h3>
        </div>
        <form method="POST" action="/graph_csv" enctype="multipart/form-data">
            <div class="row center-xs">
                <div class="uploadbutton">
                    <input type="file" accept=".csv" id="uploadfile" name="uploadfile" hidden />
                    <label for="uploadfile">naloži datoteko</label>
                </div>
            </div>

            <div class="row center-xs">

                <div class="container col-xs-10 col-sm-10 col-md-7 col-lg-7">
                    <div class="row around-xs">
                        <div class="row-xs-12 row-sm-12 col-md-7 col-lg-7">
                            <div class="row start-xs">
                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <label for="title">naslov grafa</label>
                                </div>

                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <input type="text" id="title" name="title">
                                </div>
                            </div>
                            <div class="row start-xs">
                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <label for="xlabel">oznaka x osi</label>
                                </div>

                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <input type="text" id="xlabel" name="xlabel">
                                </div>
                            </div>
                            <div class="row start-xs">
                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <label for="ylabel">oznaka y osi</label>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <input type="text" id="ylabel" name="ylabel">
                                </div>
                            </div>

                            <div class="row start-xs">
                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <label for="linewidth">debelina krivulje</label>
                                </div>

                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <div class="slidecontainer">
                                        <input class="slider" type="range" id="linewidth" name="linewidth" value="2"
                                            min="1" max="8" oninput="this.nextElementSibling.value = this.value">
                                        <!--  <output>2</output> -->
                                    </div>
                                </div>

                                <div class="row start-xs">
                                    <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                        <label for="fontsize">velikost črk</label>
                                    </div>

                                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                        <div class="slidecontainer">
                                            <input class="slider" type="range" id="fontsize" name="fontsize" value="15"
                                                min="1" max="50" oninput="this.nextElementSibling.value = this.value">
                                            <!-- <output>15</output> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row-xs-12 row-sm-12 col-md-5 col-lg-5">

                                <div class="row">
                                    <label for="legend" class="check">prikaži legendo
                                        <input type="checkbox" id="legend" name="legend">
                                        <span class="checkmark"></span>
                                    </label>

                                </div>

                                <div class="row">
                                    <label for="linefit" class="check">prilagodi premico
                                        <input type="checkbox" id="linefit" name="linefit">
                                        <span class="checkmark"></span>
                                    </label>

                                </div>

                                <div class="row start-xs">
                                    <label class="check" for="grid">prikaži mrežo
                                        <input type="checkbox" id="grid" name="grid">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>

                                <div class="row">
                                    <label class="check" for="usetex">uporabi Latex
                                        <input type="checkbox" id="usetex" name="usetex">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>

                                <div class="row">
                                    <label for="linecolor">barva krivulje</label>
                                    <input type="linecolor" id="linecolor" name="linecolor" value="#ff0000">
                                </div>
                                <div class="row">
                                    <label for="markercolor">barva oznake</label>
                                    <input type="markercolor" id="markercolor" name="markercolor" value="#ff0000">
                                </div>
                                <div class="row">
                                    <label for="fitcolor">barva premice</label>
                                    <input type="fitcolor" id="fitcolor" name="fitcolor" value="#ff0000">
                                </div>

                                <div class="row">

                                    <label for="linestyle">tip črte</label>
                                    <div class="dropdown">
                                        <select class="select-css" name="linestyle" id="linestyle">
                                            <option value="">brez</option>
                                            <option value="-" selected>polna</option>
                                            <option value="--">črtkana</option>
                                            <option value=":">pike</option>

                                        </select>
                                    </div>
                                </div>

                                <div class="row">
                                    <label for="marker">tip oznake</label>
                                    <div class="dropdown">
                                        <select class="select-css" name="marker" id="marker">
                                            <option value="" selected>brez</option>
                                            <option value=".">pika</option>
                                            <option value="o">krožec</option>
                                            <option value="x">križec</option>
                                            <option value="+">plus</option>
                                            <option value="s">kvadrat</option>
                                            <option value="^">trikotnik</option>
                                            <option value="D">romb</option>
                                            <option value="*">zvezdica</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="row center-xs">
                        <div class="buttons">
                            <input type="submit" id="graphcsv" value="nariši graf" hidden />
                            <label for="graphcsv">nariši graf</label>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </div>
    <div class="row center-xs">
        <div class="buttons">
            <a href="/">
                <button class="btn4">pojdi nazaj</button>
            </a>
        </div>
    </div>





</body>

</html>