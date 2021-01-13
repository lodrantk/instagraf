<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>instagraf</title>
    <link rel="stylesheet" href="static/style.css" type="text/css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flexboxgrid/6.3.1/flexboxgrid.css"
        type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    <div class="page">
        <div class="row center-xs">
            <h3 class="hero-headline">instagraf podatkov</h3>
        </div>

        <form method="POST" action="/graph_csv" enctype="multipart/form-data">
            <div class="row center-xs">
                <div class="uploadbutton">
                    <label for="file-upload" class>naloži .csv datoteko</label>
                    <input id="file-upload" name="uploadfile" type="file" style="display:none;">
                </div>
                <div class="uploadname">
                    <label id="file-name"></label>
                </div>
                <script>
                    document.querySelector("#file-upload").onchange = function () {
                        document.querySelector("#file-name").textContent = this.files[0].name;
                    }
                </script>
            </div>

            <div class="row center-xs">
                <div class="wrap container col-sm-9 col-sm-9 col-md-7 col-md-7">
                    <div class="row center-md">
                        <div class="row-xs-10 row-sm-10 col-md-7 col-lg-7">
                            <div class="row start-xs">
                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <label for="title">naslov grafa</label>
                                </div>

                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <input type="text" id="title" name="title">
                                </div>
                            </div>
                            <div class="row start-xs">
                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <label for="xlabel">oznaka x osi</label>
                                </div>

                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <input type="text" id="xlabel" name="xlabel" value="x">
                                </div>
                            </div>
                            <div class="row start-xs">
                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <label for="ylabel">oznaka y osi</label>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <input type="text" id="ylabel" name="ylabel" value="y">
                                </div>
                            </div>

                            <div class="row start-xs">
                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <label for="linewidth">debelina krivulje</label>
                                </div>

                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <div class="slidecontainer">
                                        <input class="slider" type="range" id="linewidth" name="linewidth" value="2"
                                            min="1" max="8" oninput="this.nextElementSibling.value = this.value">
                                        <!--  <output>2</output> -->
                                    </div>
                                </div>
                            </div>

                            <div class="row start-xs">
                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <label for="fontsize">velikost črk</label>
                                </div>

                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <div class="slidecontainer">
                                        <input class="slider" type="range" id="fontsize" name="fontsize" value="15"
                                            min="5" max="30" oninput="this.nextElementSibling.value = this.value">
                                        <!--  <output>2</output> -->
                                    </div>
                                </div>
                            </div>

                            <div class="row start-xs">
                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <label for="linestyle">tip črte</label>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <div class="dropdown">
                                        <select class="select-css" name="linestyle" id="linestyle">
                                            <option value="" selected>brez</option>
                                            <option value="-">polna</option>
                                            <option value="--">črtkana</option>
                                            <option value=":">pike</option>

                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row start-xs">
                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <label for="marker">tip oznake</label>
                                </div>

                                <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5">
                                    <div class="dropdown"></div>
                                    <select class="select-css" name="marker" id="marker">
                                        <option value="">brez</option>
                                        <option value=".">pika</option>
                                        <option value="o" selected>krožec</option>
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
                        <div class="row-xs-10 row-sm-10 col-md-5 col-lg-5">

                            <div class="row">
                                <label for="legend" class="check">prikaži legendo
                                    <input type="checkbox" id="legend" name="legend">
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

                            <div class="row start-xs">

                                <label for="linefit" class="check">prilagodi premico
                                    <input type="checkbox" id="linefit" name="linefit" onclick="showMe('showfitcolor')">
                                    <span class="checkmark"></span>
                                </label>

                            </div>
                            <div id="showfitcolor" style="display: none">
                                <div class="row start-xs">
                                    <label for="fitcolor">barva premice</label>
                                    <input type="color" id="fitcolor" name="fitcolor" value="#069af3">
                                </div>
                            </div>

                            <!-- show color-picker for fitted line if checkbox checked -->
                            <script>
                                function showMe(box) {
                                    var chboxs = document.getElementsByName("linefit");
                                    var vis = "none";
                                    for (var i = 0; i < chboxs.length; i++) {
                                        if (chboxs[i].checked) {
                                            vis = "block";
                                            break;
                                        }
                                    }
                                    document.getElementById(box).style.display = vis;

                                }
                            </script>

                            <div class="row">
                                <label for="linecolor">barva črte</label>
                                <input type="color" id="linecolor" name="linecolor" value="#ff0000">
                            </div>
                            <div class="row">
                                <label for="markercolor">barva oznake</label>
                                <input type="color" id="markercolor" name="markercolor" value="#ff0000">
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