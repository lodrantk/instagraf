<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>instagraf</title>
    <link rel="stylesheet" href="static/style.css" type="text/css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flexboxgrid/6.3.1/flexboxgrid.min.css" type="text/css">
</head>

<body>
    <div class="wrapper">
        <div class="center">
            <h2> tvoj instagraf</h2>
            <div class="img">
                <img src="graf/{{name}}.png" alt="slika grafa" style="width:500px;">
            </div>

            <div class="buttons">
                <a href="graf/{{name}}.pdf" download="instagraf">
                    <button>prenesi .pdf</button>
                </a>
                <a href="graf/{{name}}.png" download="instagraf">
                    <button class="btn2">prenesi .png</button></a>
            </div>
            <div class="buttons">
                <a href="/">
                    <button class="btn4">pojdi nazaj</button>
                </a>
            </div>

            <div id="containform" class="container">
                <form method="post" action="/graf">

                    <div class="row">
                        <div class="col-lbl">
                            <label for="function">funkcija f(x) =</label>
                        </div>
                        <div class="col-txt">
                            <input type="text" id="function" name="function" value="x**2">
                        </div>
                        <div class="col3">
                            <label for="legend" class="check">prikaži legendo
                                <input type="checkbox" id="legend" name="legend">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lbl">
                            <label for="title">naslov grafa</label>
                        </div>
                        <div class="col-txt">
                            <input type="text" id="title" name="title">
                        </div>
                        <div class="col3">
                            <label class="check" for="grid">prikaži mrežo
                                <input type="checkbox" id="grid" name="grid">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lbl">
                            <label for="xlabel">oznaka x osi</label>
                        </div>
                        <div class="col-txt">
                            <input type="text" id="xlabel" name="xlabel">
                        </div>
                        <div class="col3">
                            <label class="check" for="usetex">uporabi Latex
                                <input type="checkbox" id="usetex" name="usetex">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-lbl">
                            <label for="ylabel">oznaka y osi</label>
                        </div>
                        <div class="col-txt">
                            <input type="text" id="ylabel" name="ylabel">
                        </div>
                        <div class="col3">
                            <label for="color">barva funkcije:</label>
                            <input type="color" id="color" name="color" value="#ff0000"><br><br>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lbl">
                            <label for="xmin">spodnja meja x</label>
                        </div>
                        <div class="col-txt">
                            <input type="text" id="xmin" name="xmin">
                        </div>
                        <div class="col3">
                            <label for="marker">tip oznake:</label>
                            <select name="marker" id="marker">
                                <option value="">brez</option>
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

                    <div class="row">
                        <div class="col-lbl">
                            <label for="xmax">zgornja meja x</label>
                        </div>
                        <div class="col-txt">
                            <input type="text" id="xmax" name="xmax">
                        </div>
                        <div class="col3">
                            <div class="dropdown">
                                <label for="linestyle">tip črte:</label>
                                <select name="linestyle" id="linestyle">
                                    <option value="">brez</option>
                                    <option value="-" selected>polna</option>
                                    <option value="--">črtkana</option>
                                    <option value=":">pike</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lbl">
                            <label for="linewidth">debelina krivulje:</label>
                        </div>
                        <div class="col-txt">
                            <div class="slidecontainer">
                                <input class="slider" type="range" id="linewidth" name="linewidth" value="2" min="1" max="8" oninput="this.nextElementSibling.value = this.value">
                                <output>2</output>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-lbl">
                            <label for="fontsize">velikost črk:</label>
                        </div>
                        <div class="col-txt">
                            <div class="slidecontainer">
                                <input class="slider" type="range" id="fontsize" name="fontsize" value="15" min="1" max="30" oninput="this.nextElementSibling.value = this.value">
                                <output>15</output>
                            </div>
                        </div>
                    </div>



                    <div class="buttons">
                        <input type="submit" id="narisi" value="nariši graf" hidden />
                        <label for="narisi">nariši graf</label>
                    </div>



                </form>
            </div>
        </div>
    </div>


</body>

</html>