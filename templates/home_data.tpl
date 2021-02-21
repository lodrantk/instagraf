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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
            <h1 class="display-1">instagraf podatkov</h1>
        </div>

        <form method="POST" action="/graph_data" enctype="multipart/form-data">

            <div class="container plotdata" style="background: none;">
                <div class="row align-items-center justify-content-center">
                    <label for="plotdatax" class="col-1 col-form-label">os x: </label>
                    <div class="col-11 col-md-7 align-items-start">
                        <input type="text" class="form-control" name="plotdatax" id="plotdatax"
                            placeholder="npr. 1, 2, 3, 4, 5"
                            onkeyup="this.value = this.value.replace(/[^0-9\,.-]/g,'')" required>
                    </div>
                </div>

                <div class="row align-items-center justify-content-center">
                    <label for="plotdatay" class="col-1 col-form-label">os y: </label>
                    <div class="col-11 col-md-7">
                        <input type="text" class="form-control" name="plotdatay" id="plotdatay"
                            placeholder="npr. 3, 4, 5, 8, 9"
                            onkeyup="this.value = this.value.replace(/[^0-9\,.-]/g,'')" required>
                    </div>
                </div>

                <div id="showxerror" class="errortext" style="display: none">
                    <div class="row align-items-center justify-content-center">
                        <label for="xerror" class="col-1 col-form-label">napaka x: </label>
                        <div class="col-11 col-md-7">
                            <input type="text" class="form-control" name="xerror" id="xerror"
                                placeholder="npr. 0.1, 0.1, 0.1"
                                onkeyup="this.value = this.value.replace(/[^0-9\,.-]/g,'')">
                        </div>
                    </div>
                </div>

                <div id="showyerror" class="errortext" style="display: none">
                    <div class="row align-items-center justify-content-center">
                        <label for="xerror" class="col-1 col-form-label">napaka y: </label>
                        <div class="col-11 col-md-7">
                            <input type="text" class="form-control" name="yerror" id="yerror"
                                placeholder="npr. 0.05, 0.08, 0.16"
                                onkeyup="this.value = this.value.replace(/[^0-9\,.-]/g,'')">
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="row align-items-center">
                    <div class="row-sm row-md col-lg-7 col-xl-7 col-xxl-7">

                        <div class="row mb-3">
                            <label for="title" class="row-sm col-md-3 col-lg-3 col-xl-3 col-xxl-3 col-form-label">naslov
                                grafa </label>
                            <div class="row-sm col-md col-lg col-xl col-xxl">
                                <input type="text" class="form-control" id="title" name="title" value="">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="xlabel"
                                class="row-sm col-md-3 col-lg-3 col-xl-3 col-xxl-3 col-form-label">oznaka x
                                osi</label>
                            <div class="row-sm col-md col-lg col-xl col-xxl">
                                <input type="text" class="form-control" id="xlabel" name="xlabel" value="x">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="ylabel"
                                class="row-sm col-md-3 col-lg-3 col-xl-3 col-xxl-3 col-form-label">oznaka y
                                osi</label>
                            <div class="row-sm col-md col-lg col-xl col-xxl">
                                <input type="text" class="form-control" id="ylabel" name="ylabel" value="y">
                            </div>
                        </div>

                        <div class="row mb-3 align-items-center">
                            <label for="linewidth"
                                class="row-12 col-md-3 col-lg-3 col-xl-3 col-xxl-3 control-label col-form-label">debelina
                                črte</label>
                            <div class="col-4 col-md-3 col-lg-2 col-xl-2 col-xxl-2">
                                <input type="number" class="form-control" id="linewidth" name="linewidthInput" min="1"
                                    max="8" value="2" oninput="this.form.linewidthRange.value=this.value" />
                            </div>
                            <div class="col-8 col-md-6 col-lg-7 col-xl-7 col-xxl-7">
                                <input type="range" class="slider" name="linewidthRange" min="1" max="8" value="2"
                                    oninput="this.form.linewidthInput.value=this.value" />
                            </div>
                        </div>

                        <div class="row mb-3 align-items-center">
                            <label for="fontsize"
                                class="row-12 col-md-3 col-lg-3 col-xl-3 col-xxl-3 control-label col-form-label">velikost
                                črk</label>
                            <div class="col-4 col-md-3 col-lg-2 col-xl-2 col-xxl-2">
                                <input type="number" class="form-control" id="fontsize" name="fontsizeInput" min="10"
                                    max="40" value="18" oninput="this.form.fontsizeRange.value=this.value" />
                            </div>
                            <div class="col-8 col-sm-8 col-md-6 col-lg-7 col-xl-7 col-xxl-7">
                                <input type="range" class="slider" name="fontsizeRange" min="10" max="40" value="18"
                                    oninput="this.form.fontsizeInput.value=this.value" />
                            </div>
                        </div>

                        <div class="row mb-3 align-items-center">
                            <div class="col-4 col-md-3 col-lg-3 col-xl-3 col-xxl-3">
                                <label for="linestyle">tip črte</label>
                            </div>
                            <div class="col-8 col-md col-lg col-xl col-xxl">
                                <select class="form-select" name="linestyle" id="linestyle">

                                    <option value="" selected>brez</option>
                                    <option value="-">polna</option>
                                    <option value="--">črtkana
                                    </option>
                                    <option value=":">pike</option>
                                </select>
                            </div>
                        </div>

                        <div class="row mb-3 align-items-center">
                            <div class="col-4 col-md-3 col-lg-3 col-xl-3 col-xxl-3">
                                <label for="linestyle">tip oznake</label>
                            </div>
                            <div class="col-8 col-md col-lg col-xl col-xxl">
                                <select class="form-select" name="marker" id="marker">
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

                    <div class="row-sm row-md col-lg-5 col-xl-5 col-xxl-5">
                        <div class="form-check md-3">
                            <input class="form-check-input" type="checkbox" name="hasxerror" id="hasxerror">
                            <label class="form-check-label mb-3 " for="hasxerror">
                                prikaži napako v x
                            </label>
                        </div>

                        <script type="text/javascript">
                            $('#hasxerror').change(function () {
                                $('#showxerror').toggle();
                            });
                        </script>

                        <div class="form-check md-3">
                            <input class="form-check-input" type="checkbox" name="hasyerror" id="hasyerror">
                            <label class="form-check-label mb-3 " for="hasyerror">
                                prikaži napako v y
                            </label>
                        </div>

                        <script type="text/javascript">
                            $('#hasyerror').change(function () {
                                $('#showyerror').toggle();
                            });
                        </script>

                        <div class="form-check md-3">
                            <input class="form-check-input" type="checkbox" name="grid" id="grid">
                            <label class="form-check-label mb-3 " for="grid">
                                prikaži mrežo
                            </label>
                        </div>

                        <div class="form-check md-3">

                            <input class="form-check-input" type="checkbox" name="usetex" id="usetex">
                            <label class="form-check-label mb-3 " for="usetex">
                                uporabi Latex
                            </label>

                            <a href="#" data-toggle="tooltip"
                                title="Upoštevaj Latex notacijo v oznakah osi in naslovu (npr. $\frac{a}{b}$).">?</a>

                        </div>


                        <div class="form-check md-3">
                            <input class="form-check-input" type="checkbox" name="linefit" id="linefit"
                                onclick="showMe('showfitcolor')">
                            <label class="form-check-label mb-3 " for="linefit">
                                prilagodi premico
                            </label>
                        </div>


                        <div id="showfitcolor" style="display: none">

                            <div class="row mb-3 align-items-center">
                                <div class="col-3">
                                    <input type="color" id="fitcolor" name="fitcolor" value="dodgerblue"
                                        title="Choose your color">
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

                        <div class="form-check md-3">
                            <input class="form-check-input" type="checkbox" name="legend" id="legend">
                            <label class="form-check-label mb-3" for="legend">
                                prikaži legendo
                            </label>

                            <a href="#" data-toggle="tooltip"
                                title="Če smo podatkom prilagodili premico, bo v legendi enačba s parametri.">?</a>
                        </div>

                        <div class="row mb-3 align-items-center">
                            <div class="col-3">
                                <input type="color" id="linecolor" name="linecolor" value="dodgerblue"
                                    title="Choose your color">
                            </div>

                            <div class="col-9">
                                <label for="linecolor" class="form-label">barva krivulje (skozi točke)</label>

                            </div>
                        </div>

                        <div class="row mb-3 align-items-center">
                            <div class="col-3">
                                <input type="color" id="markercolor" name="markercolor" value="dodgerblue"
                                    title="Choose your color">
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
                    <input type="submit" id="graphdata" value="nariši graf" hidden />
                    <label for="graphdata">nariši graf</label>
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