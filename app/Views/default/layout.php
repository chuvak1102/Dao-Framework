<?php use Framework\App;?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

<div class="header">
    {% include header %}
</div>

<div class="content">
    {% block content %}
        
    {% endblock %}
</div>

<div>
    <?php include App::$template?>
</div>

<div class="footer">
    {% include footer %}
</div>

</body>
</html>

