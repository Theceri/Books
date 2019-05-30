<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>

<body>

<h1> {{$book->title}} </h1>

<h2>By: <a href=""> {{$book->authors[0]->name}} </a> </h2>

<p> {{$book->description}} </p>

<h2>Recommended by:</h2>

<p> {{$book->title}} is recommended by these great people: </p>

<ul>

    <li><a href="">  </a></li>
    <li></li>
    <li></li>

</ul>

<h2>More books by {{$book->authors[0]->name}} </h2>

<ul>

    <li></li>
    <li></li>

</ul>

<h2>{{$book->authors[0]->name}} has also co-authored:</h2>

<ul>

    <li></li>
    <li></li>

</ul>

</body>

</html>