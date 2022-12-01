@include('include.header')
@include('include.nav')

<!-- Masthead-->
<header class="masthead center">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="head-content">
                    <div class="masthead-subheading">One Stop<br/> Social Network</div>
                    <p>Welcome to the Jister App. The place to express yourself without limits. Here you can interact with friends through posts, chats, groups, and so much more. Our anonymity feature allows you to like, comment, or post content without anyone knowing who you are. Download today to experience all this and more!</p>
                </div>
            </div>
            
        </div>
    </div>
</header>
<section class="download py-4">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 center">
                <h4 class="mb-0 white">Download our App Now!</h4>
            </div>
            <div class="col-md-6 center">
                <p class="app-btns mb-0">
                    <a href="{{ env("ANDROID_URL") }}" target="_blank"><img src="{{ asset("assets/images/google.png") }}" alt="google button"></a>
                    <a href="{{ env("IOS_URL") }}" target="_blank"><img src="{{ asset("assets/images/apple.png") }}"
                                                     alt="apple button"></a>
                </p>
            </div>
        </div>
    </div>
</section>
<!-- Features-->
<section class="page-section position-relative" id="features">
    <img src="{{ asset("assets/images/mobile1-bg.png") }}" alt="mobile image"
         class="img-fluid mobile-bg d-none d-lg-block"/>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="section-heading text-center text-uppercase">Features</h2>
            </div>
            <div class="col-md-5 download-bg center">
                <img src="{{ asset("assets/images/mobile2.png") }}" alt="mobile image"
                     class="img-fluid mobile dis-none"/>
            </div>
            <div class="col-md-7 pt-5 pdt-md-0">
                <ul class="list-unstyled">
                    <li class="media pb-3">
                        <img class="mr-3" src="{{ asset("assets/images/icon1.png") }}" alt="Icon image">
                        <div class="media-body">
                            <h5 class="mt-0 mb-1">J Spot</h5>
                            <p>The J Spot is a place to showcase what your “Jist” is. You can catalog videos of anything you desire, and these videos will appear on your profile on your personal channel where your followers can watch anytime.</p>
                        </div>
                    </li>
                    <li class="media pb-3">
                        <img class="mr-3" src="{{ asset("assets/images/icon2.png") }}" alt="Icon image">
                        <div class="media-body">
                            <h5 class="mt-0 mb-1">Jist Nation</h5>
                            <p>Jist Nation is where you can explore what other Jisters are posting. There you will find categories such as style, sports, food, comedy, beauty, entertainment, etc. Use this section to be inspired by your fellow Jisters’ content. Also, this section is where you can search for users by name and to search for hashtag feeds.</p>
                        </div>
                    </li>
                    <li class="media pb-3">
                        <img class="mr-3" src="{{ asset("assets/images/icon3.png") }}" alt="Icon image">
                        <div class="media-body">
                            <h5 class="mt-0 mb-1">Exclusive Reactions</h5>
                            <p>Jister app has exclusive reactions that you can use to respond to any post you see. These reactions are Jister, Juicy Jist, Side-Eye, Laughing, Duh, Dislike, Loving, and Blushing. Use these emojis to express how you feel about what other Jisters post.</p>
                        </div>
                    </li>
                    <li class="media">
                        <img class="mr-3" src="{{ asset("assets/images/icon4.png") }}" alt="Icon image">
                        <div class="media-body">
                            <h5 class="mt-0 mb-1">Anonymity</h5>
                            <p>Ever wanted to post something to social media but didn’t want people to know it was you? The Jister app has the ability for you to like, message, comment, or post anything to the app anonymously. Hit the switch at the top of your feed or profile to activate Dark Mode. In this mode, no one will know that it is you liking, commenting, or posting. Feel free to express yourself without limits!</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>
<section class="download py-4">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 center">
                <h4 class="mb-0 white">Download our App Now!</h4>
            </div>
            <div class="col-md-6 center">
                <p class="app-btns mb-0">
                    <a href="{{ env("ANDROID_URL") }}" target="_blank"><img src="{{ asset("assets/images/google.png") }}" alt="google button"></a>
                    <a href="{{ env("IOS_URL") }}" target="_blank"><img src="{{ asset("assets/images/apple.png") }}"
                                                     alt="apple button"></a>
                </p>
            </div>
        </div>
    </div>
</section>
{{--<section class="video-bg page-section">
    <div class="container">
        <div class="row">
            <div class="col-md-6 center pt-md-5 mb-3">
                <h4 class="mb-3 white">Check out our Video</h4>
                <p class="white">Praesent eu dolor eu orci vehicula euismod. Vivamus sed sollicitudin libero, vel
                    malesuada velit. Praesent eu dolor eu orci vehicula euismod. Vivamus sed sollicitudin libero, vel
                    malesuada velit</p>
                <a href="https://www.youtube.com/" target="_blank"><img class="mr-3 img-fluid"
                                                                        src="{{asset("assets/images/ubutton.png")}}"
                                                                        alt="youtube button image"></a>
            </div>
            <div class="col-md-6 center  mb-3">
                <a href="https://www.youtube.com/" target="_blank"><img class="mr-3 img-fluid"
                                                                        src="{{ asset("assets/images/youtube.png") }}"
                                                                        style="width:450px;" alt="youtube image"></a>
            </div>
        </div>
    </div>
</section>--}}
<section class="page-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="section-heading text-center text-uppercase">APP SCREENS</h2>
            </div>
            <div class="col-md-12 text-center mb-3">
                <img class="mr-3 img-fluid" src="{{ asset("assets/images/app-screen1.png") }}" alt="App Screen image">
            </div>
        </div>
    </div>
</section>
@include('include.footer')
