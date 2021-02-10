<!doctype html>
<html lang="sl">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="static/style.css" type="text/css">


    <title>Instagraf</title>
</head>

<body>
    <div class="container-fluid align-items-center">

        <div class="row" style="padding: 20px;">
            <h1 class="display-1">tvoj instagraf</h1>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
            integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
            integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
            crossorigin="anonymous"></script>

        <div class="row align-items-center">
            <div>
                <img src="graph_func/{{name}}.png" alt="slika grafa" style="height:500px;">
            </div>
        </div>
        <div class="row align-items-center">
            <div class="buttons">
                <a href="graph_func/{{name}}.pdf" download="moj_instagraf">
                    <button>prenesi .pdf</button>
                </a>
                <a href="graph_func/{{name}}.png" download="moj_instagraf">
                    <button class="btn2">prenesi .png</button></a>
            </div>
        </div>
        <div class="row align-items-center">
            <div class="buttons">
                <a href="/home_func">
                    <button class="btn4">pojdi nazaj</button>
                </a>
            </div>
        </div>


        <form method="post" action="/graph_func">
            <div class="container">
                <div class="row align-items-start">
                    <div class="row-sm row-md col-lg-7 col-xl-7 col-xxl-7">
                        <div class="row mb-3">
                            <label for="function"
                                class="row-sm col-md-3 col-lg-3 col-xl-3 col-xxl-3 col-form-label">funkcija f(x) =
                            </label>
                            <div class="row-sm col-md col-lg col-xl col-xxl">
                                <input type="text" class="form-control" id="function" name="function"
                                    value="{{function}}">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="title" class="row-sm col-md-3 col-lg-3 col-xl-3 col-xxl-3 col-form-label">naslov
                                grafa </label>
                            <div class="row-sm col-md col-lg col-xl col-xxl">
                                <input type="text" class="form-control" id="title" name="title" value="{{title}}">
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

                        <div class="row mb-3">
                            <label for="xmin"
                                class="col-6 col-md-3 col-lg-3 col-xl-3 col-xxl-3 control-label col-form-label">spodnja
                                meja x</label>
                            <div class="col-6 col-md-3 col-lg-2 col-xl-2 col-xxl-2">
                                <input type="text" class="form-control" id="xmin" name="xmin" value="{{xmin}}">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="xmax"
                                class="col-6 col-md-3 col-lg-3 col-xl-3 col-xxl-3 control-label col-form-label">zgornja
                                meja x</label>
                            <div class="col-6 col-md-3 col-lg-2 col-xl-2 col-xxl-2">
                                <input type="text" class="form-control" id="xmax" name="xmax" value="{{xmax}}">
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
                            <label class="form-check-label mb-3 " for="grid">
                                uporabi Latex
                            </label>
                        </div>
                        

                        <div class="row mb-3 align-items-center">
                            <div class="col-3">
                                <input type="color" id="linecolor" value="{{linecolor}}" title="Choose your color">
                            </div>

                            <div class="col-9">
                                <label for="linecolor" class="form-label">barva krivulje</label>

                            </div>
                        </div>

                        <div class="row mb-3 align-items-center">
                            <div class="col-4 col-md-3 col-lg-3 col-xl-3 col-xxl-3">
                                <label for="linestyle">tip črte</label>
                            </div>
                            <div class="col-8 col-md col-lg col-xl col-xxl">
                                <select class="form-select" name="linestyle" id="linestyle" value="{{linestyle}}">
                                    <option value="" {{" selected" if linestyle=="" else "" }}>brez</option>
                                    <option value="-" {{"selected" if linestyle=="-" else "" }}>polna</option>
                                    <option value="--" {{"selected" if linestyle=="--" else "" }}>črtkana
                                    </option>
                                    <option value=":" {{"selected" if linestyle==":" else "" }}>pike</option>
                                </select>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
            <div class="row align-items-center justify-content-center">
                <div class="uploadbutton">
                    <input type="submit" id="narisi" value="ponovno nariši graf" hidden />
                    <label for="narisi">ponovno nariši graf</label>
                </div>
            </div>
        </form>

    </div>

</body>


</html>