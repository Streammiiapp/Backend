<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Faq</h2>
  @foreach($contents as $content)
    <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#{{$content->id}}">{{$content->question}}</button>
    <div id="{{$content->id}}" class="collapse">
        {{$content->answer}}
    </div>
    <br><br>
  @endforeach
</div>

</body>
</html> 