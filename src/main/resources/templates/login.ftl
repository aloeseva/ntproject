<#import "parts/login.ftl" as l>

<!doctype html>

<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>NTProject</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="/static/img/gorila.png"/>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <!-- Typography CSS -->
    <link rel="stylesheet" href="/static/css/typography.css">
    <!-- Style CSS -->
    <link rel="stylesheet" href="/static/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="/static/css/responsiv.css">
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="/static/js/jquery.mi.js"></script>
    <script src="/static/js/popper.mi.js"></script>
    <script src="/static/js/bootstrap.mi.js"></script>
    <!-- Appear JavaScript -->
    <script src="/static/js/jquery.appea.js"></script>
    <!-- Countdown JavaScript -->
    <script src="/static/js/countdown.mi.js"></script>
    <!-- Counterup JavaScript -->
    <script src="/static/js/waypoints.mi.js"></script>
    <script src="/static/js/jquery.counterup.mi.js"></script>
    <!-- Wow JavaScript -->
    <script src="/static/js/wow.mi.js"></script>
    <!-- lottie JavaScript -->
    <script src="/static/js/lotti.js"></script>
    <!-- Apexcharts JavaScript -->
    <script src="/static/js/apexchart.js"></script>
    <!-- Slick JavaScript -->
    <script src="/static/js/slick.mi.js"></script>
    <!-- Select2 JavaScript -->
    <script src="/static/js/select2.mi.js"></script>
    <!-- Owl Carousel JavaScript -->
    <script src="/static/js/owl.carousel.mi.js"></script>
    <!-- Magnific Popup JavaScript -->
    <script src="/static/js/jquery.magnific-popup.mi.js"></script>
    <!-- Smooth Scrollbar JavaScript -->
    <script src="/static/js/smooth-scrollba.js"></script>
    <!-- Chart Custom JavaScript -->
    <script src="/static/js/chart-custo.js"></script>
    <!-- Custom JavaScript -->
    <script src="/static/js/custo.js"></script>
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
                    <a class="sign-in-logo mb-5" href="/top"><img src="/static/img/image_4.png" class="img-fluid" alt="logo"></a>
                    <div class="item">
                        <img src="/static/img/login.png" class="img-fluid mb-4" alt="logo">
                        <h4 class="mb-1 text-white">Manage your orders</h4>
                        <p>It is a long established fact that a reader will be distracted by the readable
                            content.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 bg-white pt-5">
                <div class="sign-in-from">
                    <h1 class="mb-0">Sign Up</h1>
                    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
                        <div class="alert alert-danger" role="alert">
                            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
                        </div>
                    </#if>
                    <#if message??>
                        <div class="alert alert-${messageType}" role="alert">
                            ${message}
                        </div>
                    </#if>
                    <@l.login "/login" false/>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Sign in END -->

</body>
</html>
