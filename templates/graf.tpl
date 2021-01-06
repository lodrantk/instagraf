<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Instagraf</title>
    <link rel="stylesheet" href="static/style.css" type="text/css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flexboxgrid/6.3.1/flexboxgrid.css" type="text/css">
</head>

<body>
    <div class="page">
        <div class="row center-xs">
            <h2 class="hero-headline"> tvoj instagraf</h2>
        </div>
        <div class="wrap container-fluid">
            <div class="row center-xs">
                <div>
                    <img src="graf/{{name}}.png" alt="slika grafa" style="height:300px;">
                </div>
            </div>
            <div class="row center-xs">
                <div class="buttons">
                    <a href="graf/{{name}}.pdf" download="instagraf">
                        <button>prenesi .pdf</button>
                    </a>
                    <a href="graf/{{name}}.png" download="instagraf">
                        <button class="btn2">prenesi .png</button></a>
                </div>
            </div>
            <div class="row center-xs">
                <div class="buttons">
                    <a href="/">
                        <button class="btn4">pojdi nazaj</button>
                    </a>
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
                                        <input type="text" id="function" name="function" value="{{function}}">
                                    </div>
                                </div>
                                <div class="row start-xs">
                                    <div class="col-xs-5">
                                        <label for="title">naslov grafa</label>
                                    </div>

                                    <div class="col-xs-7">
                                        <input type="text" id="title" name="title" value="{{title}}">
                                    </div>
                                </div>
                                <div class="row start-xs">
                                    <div class="col-xs-5">
                                        <label for="xlabel">oznaka x osi</label>
                                    </div>

                                    <div class="col-xs-7">
                                        <input type="text" id="xlabel" name="xlabel" value="{{xlabel}}">
                                    </div>
                                </div>
                                <div class="row start-xs">
                                    <div class="col-xs-5">
                                        <label for="ylabel">oznaka y osi</label>
                                    </div>
                                    <div class="col-xs-7">
                                        <input type="text" id="ylabel" name="ylabel" value="{{ylabel}}">
                                    </div>
                                </div>

                                <div class="row start-xs">
                                    <div class="col-xs-5">
                                        <label for="xmin">spodnja meja x</label>
                                    </div>

                                    <div class="col-xs-7">
                                        <input type="text" id="xmin" name="xmin" value="{{xmin}}">
                                    </div>
                                </div>

                                <div class="row start-xs">
                                    <div class="col-xs-5">
                                        <label for="xmax">zgornja meja x</label>
                                    </div>

                                    <div class="col-xs-7">
                                        <input type="text" id="xmax" name="xmax" value="{{xmax}}">
                                    </div>
                                </div>

                                <div class="row start-xs">
                                    <div class="col-xs-5">
                                        <label for="linewidth">debelina krivulje</label>
                                    </div>

                                    <div class="col-xs-7">
                                        <div class="slidecontainer">
                                            <input class="slider" type="range" id="linewidth" name="linewidth" value="{{linewidth}}" min="1" max="8" oninput="this.nextElementSibling.value = this.value">
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
                                            <input class="slider" type="range" id="fontsize" name="fontsize" value="{{fontsize}}" min="1" max="50" oninput="this.nextElementSibling.value = this.value">
                                            <!-- <output>15</output> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-4">

                                <div class="row">
                                    <label for="legend" class="check">prikaži legendo
                                        <input type="checkbox" id="legend" name="legend" {{"checked" if legend else ""}} />
                                        <span class="checkmark"></span>
                                    </label>

                                </div>

                                <div class="row start-xs">
                                    <label class="check" for="grid">prikaži mrežo
                                        <input type="checkbox" id="grid" name="grid"  {{"checked" if grid == "on" else ""}} >
                                        <span class="checkmark"></span>
                                    </label>
                                </div>

                                <div class="row">
                                    <label class="check" for="usetex">uporabi Latex
                                        <input type="checkbox" id="usetex" name="usetex"  {{"checked" if usetex == "on" else ""}}>
                                        <span class="checkmark"></span>
                                    </label>
                                </div>

                                <div class="row">
                                    <label for="color">barva krivulje</label>
                                    <input type="color" id="color" name="color" value="{{color}}">
                                </div>

                                <div class="row">

                                    <label for="linestyle">tip črte</label>
                                    <div class="dropdown">
                                        <select class="select-css" name="linestyle" id="linestyle" value="{{linestyle}}">
                                            <option value="" {{"selected" if linestyle=="" else "" }}>brez</option>
                                            <option value="-" {{"selected" if linestyle=="-" else "" }}>polna</option>
                                            <option value="--" {{"selected" if linestyle=="--" else "" }}>črtkana
                                            </option>
                                            <option value=":" {{"selected" if linestyle==":" else "" }}>pike</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row">
                                    <label for="marker">tip oznake</label>
                                    <div class="dropdown">
                                        <select class="select-css" name="marker" id="marker" value="{{marker}}">
                                            <option value="" {{"selected" if linestyle=="" else "" }}>brez</option>
                                            <option value="." {{"selected" if linestyle=="." else "" }}>pika</option>
                                            <option value="o" {{"selected" if linestyle=="x" else "" }}>krožec</option>
                                            <option value="x" {{"selected" if linestyle=="x" else "" }}>križec</option>
                                            <option value="+" {{"selected" if linestyle=="+" else "" }}>plus</option>
                                            <option value="s" {{"selected" if linestyle=="s" else "" }}>kvadrat</option>
                                            <option value="^" {{"selected" if linestyle=="^" else "" }}>trikotnik</option>
                                            <option value="D" {{"selected" if linestyle=="D" else "" }}>romb</option>
                                            <option value="*" {{"selected" if linestyle=="*" else "" }}>zvezdica</option>
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