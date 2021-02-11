<!doctype html>
<html lang="sl">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="static/style.css" type="text/css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.18.2/dist/bootstrap-table.min.css">



    <title>Instagraf</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.18.2/dist/bootstrap-table.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
        integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
        crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</head>

<body>

    <div class="container-fluid">
        <div class="row justify-content-center " style="padding: 20px;">
            <h1 class="display-1">tvoj instagraf</h1>
        </div>

        <div class="row align-items-center">
            <div>
                <img src="graph_data/{{name}}.png" alt="slika grafa" style="height:400px;">
            </div>
        </div>
        <div class="row align-items-center">
            <div class="buttons">
                <a href="graph_data/{{name}}.pdf" download="moj_instagraf">
                    <button>prenesi .pdf</button>
                </a>
                <a href="graph_data/{{name}}.png" download="moj_instagraf">
                    <button class="btn2">prenesi .png</button></a>
            </div>
        </div>
        <div class="row align-items-center">
            <div class="buttons">
                <a href="/home_data">
                    <button class="btn4">pojdi nazaj</button>
                </a>
            </div>
        </div>

        <form method="POST" action="/graph_data" enctype="multipart/form-data">
            <div class="container plotdata" style="background: none;">
                <div class="row align-items-center justify-content-center">
                    <label for="plotdatax" class="col-1 col-form-label">os x: </label>
                    <div class="col-11 col-md-7 align-items-start">
                        <input type="text" class="form-control" name="plotdatax" id="plotdatax"
                            value="{{plotdatax}}" onkeyup="this.value = this.value.replace(/[^0-9\,\n]/g,'')" required>
                    </div>
                </div>

                <div class="row align-items-center justify-content-center">
                    <label for="plotdatay" class="col-1 col-form-label">os y: </label>
                    <div class="col-11 col-md-7">
                        <input type="text" class="form-control" name="plotdatay" id="plotdatay" value="{{plotdatay}}" onkeyup="this.value = this.value.replace(/[^0-9\,\n]/g,'')" required>
                    </div>
                </div>
            </div>

            <!--                 <div class="col" style="flex:0 0 0;">
                    <textarea name="plotdata" id="plotdata" rows="10" cols="20" placeholder="Vnesi podatke v obliki:
                x, y
                1, 2
                2, 4
                3, 6" onkeyup="this.value = this.value.replace(/[^0-9\,\n]/g,'')" style="margin: 20px;"></textarea>
                </div>
 -->

            <div class="container">
                <div class="row align-items-center">
                    <div class="row-sm row-md col-lg-7 col-xl-7 col-xxl-7">
                        <div class="row mb-3">
                            <label for="title" class="row-sm col-md-3 col-lg-3 col-xl-3 col-xxl-3 col-form-label">naslov
                                grafa </label>
                            <div class="row-sm col-md col-lg col-xl col-xxl">
                                <input type="text" class="form-control" id="title" name="title" value="{{title}}" novalidate>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="xlabel"
                                class="row-sm col-md-3 col-lg-3 col-xl-3 col-xxl-3 col-form-label">oznaka x
                                osi</label>
                            <div class="row-sm col-md col-lg col-xl col-xxl">
                                <input type="text" class="form-control" id="xlabel" name="xlabel" value="{{xlabel}}">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="ylabel"
                                class="row-sm col-md-3 col-lg-3 col-xl-3 col-xxl-3 col-form-label">oznaka y
                                osi</label>
                            <div class="row-sm col-md col-lg col-xl col-xxl">
                                <input type="text" class="form-control" id="ylabel" name="ylabel" value="{{ylabel}}">
                            </div>
                        </div>

                        <div class="row mb-3 align-items-center">
                            <label for="linewidth"
                                class="row-12 col-md-3 col-lg-3 col-xl-3 col-xxl-3 control-label col-form-label">debelina
                                črte</label>
                            <div class="col-4 col-md-3 col-lg-2 col-xl-2 col-xxl-2">
                                <input type="number" class="form-control" id="linewidth" name="linewidthInput" min="1"
                                    max="8" value="{{linewidth}}" oninput="this.form.linewidthRange.value=this.value" />
                            </div>
                            <div class="col-8 col-md-6 col-lg-7 col-xl-7 col-xxl-7">
                                <input type="range" class="slider" name="linewidthRange" min="1" max="8"
                                    value="{{linewidth}}" oninput="this.form.linewidthInput.value=this.value" />
                            </div>
                        </div>


                        <div class="row mb-3 align-items-center">
                            <label for="fontsize"
                                class="row-12 col-md-3 col-lg-3 col-xl-3 col-xxl-3 control-label col-form-label">velikost
                                črk</label>
                            <div class="col-4 col-md-3 col-lg-2 col-xl-2 col-xxl-2">
                                <input type="number" class="form-control" id="fontsize" name="fontsizeInput" min="10"
                                    max="40" value="{{fontsize}}" oninput="this.form.fontsizeRange.value=this.value" />
                            </div>
                            <div class="col-8 col-sm-8 col-md-6 col-lg-7 col-xl-7 col-xxl-7">
                                <input type="range" class="slider" name="fontsizeRange" min="10" max="40"
                                    value="{{fontsize}}" oninput="this.form.fontsizeInput.value=this.value" />
                            </div>
                        </div>

                        <div class="row mb-3 align-items-center">
                            <div class="col-4 col-md-3 col-lg-3 col-xl-3 col-xxl-3">
                                <label for="linestyle">tip črte</label>
                            </div>
                            <div class="col-8 col-md col-lg col-xl col-xxl">
                                <select class="form-select" name="linestyle" id="linestyle">

                                    <option value="" {{" selected" if linestyle=="" else "" }}>brez</option>
                                    <option value="-" {{" selected" if linestyle=="-" else "" }}>polna</option>
                                    <option value="--" {{" selected" if linestyle=="--" else "" }}>črtkana
                                    </option>
                                    <option value=":" {{" selected" if linestyle==":" else "" }}> pike</option>
                                </select>
                            </div>
                        </div>

                        <div class="row mb-3 align-items-center">
                            <div class="col-4 col-md-3 col-lg-3 col-xl-3 col-xxl-3">
                                <label for="linestyle">tip oznake</label>
                            </div>
                            <div class="col-8 col-md col-lg col-xl col-xxl">
                                <select class="form-select" name="marker" id="marker">
                                    <option value="" {{"selected" if marker=="" else "" }}>brez</option>
                                    <option value="." {{"selected" if marker=="." else "" }}>pika</option>
                                    <option value="o" {{"selected" if marker=="x" else "" }}>krožec</option>
                                    <option value="x" {{"selected" if marker=="x" else "" }}>križec</option>
                                    <option value="+" {{"selected" if marker=="+" else "" }}>plus</option>
                                    <option value="s" {{"selected" if marker=="s" else "" }}>kvadrat</option>
                                    <option value="^" {{"selected" if marker=="^" else "" }}>trikotnik
                                    </option>
                                    <option value="D" {{"selected" if marker=="D" else "" }}>romb</option>
                                    <option value="*" {{"selected" if marker=="*" else "" }}>zvezdica
                                    </option>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="row-sm row-md col-lg-5 col-xl-5 col-xxl-5">

                        <div class="form-check md-3">
                            <input class="form-check-input" type="checkbox" {{"checked" if legend else "" }}
                                name="legend" id="legend">
                            <label class="form-check-label mb-3" for="legend">
                                prikaži legendo
                            </label>
                        </div>

                        <div class="form-check md-3">
                            <input class="form-check-input" type="checkbox" {{"checked" if grid else "" }} name="grid"
                                id="grid">
                            <label class="form-check-label mb-3 " for="grid">
                                prikaži mrežo
                            </label>
                        </div>

                        <div class="form-check md-3">
                            <input class="form-check-input" type="checkbox" {{"checked" if usetex else "" }}
                                name="usetex" id="usetex">
                            <label class="form-check-label mb-3 " for="usetex">
                                uporabi Latex
                            </label>
                        </div>

                        <div class="form-check md-3">
                            <input class="form-check-input" type="checkbox" {{"checked" if linefit else "" }} name="linefit" id="linefit"
                                onclick="showMe('showfitcolor')">
                            <label class="form-check-label mb-3 " for="linefit">
                                prilagodi premico
                            </label>
                        </div>

                        <div id="showfitcolor" style="display: none">
                            <div class="row mb-3 align-items-center">
                                <div class="col-3">
                                    <input type="color" id="fitcolor" value="{{fitcolor}}" title="Choose your color">
                                </div>

                                <div class="col-9">
                                    <label for="fitcolor" class="form-label">barva premice</label>

                                </div>
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


                        <div class="row mb-3 align-items-center">
                            <div class="col-3">
                                <input type="color" id="linecolor" value="{{linecolor}}"">
                            </div>

                            <div class="col-9">
                                <label for="linecolor" class="form-label">barva krivulje (skozi točke)</label>

                            </div>
                        </div>

                        <div class="row mb-3 align-items-center">
                            <div class="col-3">
                                <input type="color" id="markercolor" value="{{markercolor}}" title="Choose your color">
                            </div>

                            <div class="col-9">
                                <label for="markercolor" class="form-label">barva oznak točk</label>

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

</body>

</html>