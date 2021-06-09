<#import "parts/login.ftl" as l>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SocialV - Responsive Bootstrap 4 Admin Dashboard Template</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="https://img.icons8.com/material/24/4a90e2/gorilla.png"/>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <!-- Typography CSS -->
    <link rel="stylesheet" href="/css/typography.css">
    <!-- Style CSS -->
    <link rel="stylesheet" href="/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="/css/responsive.css">
</head>
<body>
<!-- loader Start -->
<div id="loading">
    <div id="loading-center">
    </div>
</div>
<!-- loader END -->
<!-- Sign in Start -->
<section class="sign-in-page">
    <div id="container-inside">
        <div id="circle-small"></div>
        <div id="circle-medium"></div>
        <div id="circle-large"></div>
        <div id="circle-xlarge"></div>
        <div id="circle-xxlarge"></div>
    </div>
    <div class="container p-0">
        <div class="row no-gutters">
            <div class="col-md-6 text-center pt-5">
                <div class="sign-in-detail text-white">
                    <a class="sign-in-logo mb-5" href="/"><img src="/icon/image_4.png" class="img-fluid" alt="logo"></a>
                    <div class="item">
                        <img src="images/login/1.png" class="img-fluid mb-4" alt="logo">
                        <h4 class="mb-1 text-white">Manage your orders</h4>
                        <p>It is a long established fact that a reader will be distracted by the readable
                            content.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 bg-white pt-5">
                <div class="sign-in-from">
                    <h1 class="mb-0">Sign in</h1>
                    <@l.login "/registration" true />
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Sign in END -->
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/js/jquery.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<!-- Appear JavaScript -->
<script src="/js/jquery.appear.js"></script>
<!-- Countdown JavaScript -->
<script src="/js/countdown.min.js"></script>
<!-- Counterup JavaScript -->
<script src="/js/waypoints.min.js"></script>
<script src="/js/jquery.counterup.min.js"></script>
<!-- Wow JavaScript -->
<script src="/js/wow.min.js"></script>
<!-- lottie JavaScript -->
<script src="/js/lottie.js"></script>
<!-- Apexcharts JavaScript -->
<script src="/js/apexcharts.js"></script>
<!-- Slick JavaScript -->
<script src="/js/slick.min.js"></script>
<!-- Select2 JavaScript -->
<script src="/js/select2.min.js"></script>
<!-- Owl Carousel JavaScript -->
<script src="/js/owl.carousel.min.js"></script>
<!-- Magnific Popup JavaScript -->
<script src="/js/jquery.magnific-popup.min.js"></script>
<!-- Smooth Scrollbar JavaScript -->
<script src="/js/smooth-scrollbar.js"></script>
<!-- Chart Custom JavaScript -->
<script src="/js/chart-custom.js"></script>
<!-- Custom JavaScript -->
<script src="/js/custom.js"></script>
</body>
</html>