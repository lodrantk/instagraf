<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>instagraf</title>
    <link rel="stylesheet" href="static/style.css" type="text/css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flexboxgrid/6.3.1/flexboxgrid.css" type="text/css">
</head>

<body>
    <div class="page">
        <div class="row center-xs">
            <h2 class="hero-headline"> instagraf</h2>
        </div>
        <div class="row center-xs">
            <div class="buttons">
                <input type="file" accept=".csv" id="upload" hidden />
                <label for="upload">iz .csv datoteke</label>
                <button class="btn2">ročni vnos</button>
                <button class="btn2">formula</button>
            </div>
        </div>

        <div class="row center-xs">
            <form method="post" action="/graf">
                <div class="container col-xs-7">
                    <div class="row around-xs">
                        <div class="col-xs-7">
                            <div class="row start-xs">
                                <div class="col-xs-5">
                                    <label for="function">funkcija f(x) =</label>
                                </div>

                                <div class="col-xs-7">
                                    <input type="text" id="function" name="function" value="sin(x)**2 + 2*cos(log(x))">
                                </div>
                            </div>
                            <div class="row start-xs">
                                <div class="col-xs-5">
                                    <label for="title">naslov grafa</label>
                                </div>

                                <div class="col-xs-7">
                                    <input type="text" id="title" name="title">
                                </div>
                            </div>
                            <div class="row start-xs">
                                <div class="col-xs-5">
                                    <label for="xlabel">oznaka x osi</label>
                                </div>

                                <div class="col-xs-7">
                                    <input type="text" id="xlabel" name="xlabel">
                                </div>
                            </div>
                            <div class="row start-xs">
                                <div class="col-xs-5">
                                    <label for="ylabel">oznaka y osi</label>
                                </div>
                                <div class="col-xs-7">
                                    <input type="text" id="ylabel" name="ylabel">
                                </div>
                            </div>

                            <div class="row start-xs">
                                <div class="col-xs-5">
                                    <label for="xmin">spodnja meja x</label>
                                </div>

                                <div class="col-xs-7">
                                    <input type="text" id="xmin" name="xmin">
                                </div>
                            </div>

                            <div class="row start-xs">
                                <div class="col-xs-5">
                                    <label for="xmax">zgornja meja x</label>
                                </div>

                                <div class="col-xs-7">
                                    <input type="text" id="xmax" name="xmax">
                                </div>
                            </div>

                            <div class="row start-xs">
                                <div class="col-xs-5">
                                    <label for="linewidth">debelina krivulje</label>
                                </div>

                                <div class="col-xs-7">
                                    <div class="slidecontainer">
                                        <input class="slider" type="range" id="linewidth" name="linewidth" value="2" min="1" max="8" oninput="this.nextElementSibling.value = this.value">
                                        <!--  <output>2</output> -->
                                    </div>
                                </div>

                            </div>

                            <div class="row start-xs">
                                <div class="col-xs-5">
                                    <label for="fontsize">velikost črk</label>
                                </div>

                                <div class="col-xs-7">
                                    <div class="slidecontainer">
                                        <input class="slider" type="range" id="fontsize" name="fontsize" value="15" min="1" max="50" oninput="this.nextElementSibling.value = this.value">
                                        <!-- <output>15</output> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-4">

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

                            <div class="row">
                                <label for="color">barva krivulje</label>
                                <input type="color" id="color" name="color" value="#ff0000">
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
                        <input type="submit" id="narisi" value="nariši graf" hidden />
                        <label for="narisi">nariši graf</label>
                    </div>
                </div>

            </form>


        </div>

    </div>



</body>

</html>