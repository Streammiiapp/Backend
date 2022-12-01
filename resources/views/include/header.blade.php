
<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">

<head>
    <title>{{ isset($title) ? $title : env("APP_NAME")." - One Stop Social Network" }}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="shortcut icon"
          href="{{ asset('vendor/crudbooster/assets/logo_crudbooster.png') }}">
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>

    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="{{asset("assets/css/styles.css")}}" rel="stylesheet" />
    @include("layouts.seo_tags",["title"=> isset($title) ? $title : env("APP_NAME")])
</head>
<body>
