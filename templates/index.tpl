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
        <div class="row" style="padding: 20px;">
            <h1 class="display-1">nariši svoj instagraf</h1>
        </div>

        <div class="row align-items-center justify-content-center">
            <div class="col-sm-auto buttons">
                <a href="/home_csv">
                    <button class="button">iz .csv datoteke</button>
                </a>
            </div>
            <div class="col-sm-auto buttons">
                <a href="/home_data">
                    <button class="button">ročni vnos</button>
                </a>
            </div>
            <div class="col-sm-auto buttons">
                <a href="/home_func">
                    <button class="button">formula</button>
                </a>
            </div>
        </div>
    </div>

</body>

</html>