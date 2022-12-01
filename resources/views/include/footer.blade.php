<section class="download py-4">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 center">
                <h4 class="mb-0 white">Download our App Now!</h4>
            </div>
            <div class="col-md-6 center">
                <p class="app-btns mb-0">
                    <a href="{{ env("ANDROID_URL") }}" target="_blank"><img src="{{ asset("assets/images/google.png") }}" alt="google button"></a>
                    <a href="{{ env("IOS_URL") }}" target="_blank"><img src="{{ asset("assets/images/apple.png") }}" alt="apple button"></a>
                </p>
            </div>
        </div>
    </div>
</section>
<!-- Footer-->
<footer class="footer py-4">
    <div class="container">
        <div class="row align-items-center justify-content-center">
            <div class="col-md-12 pb-2">©Copyrights <span id="year"></span>. All rights reserved</div>
        </div>
    </div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- Core theme JS-->
<script src="{{ asset("assets/js/scripts.js") }}"></script>
<script>
    function getYear() {
        var d = new Date();
        var n = d.getFullYear();
        document.getElementById("year").innerHTML = n;
    }
    getYear();
</script>
</body>
</html>
