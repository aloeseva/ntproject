<#import "parts/login.ftl" as l>

<!doctype html>
<html lang="en">
<head>
    <!-- Yandex.Metrika counter -->
    <script type="text/javascript" >
        (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
            m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
        (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

        ym(81020854, "init", {
            clickmap:true,
            trackLinks:true,
            accurateTrackBounce:true,
            webvisor:true
        });
    </script>
    <noscript><div><img src="https://mc.yandex.ru/watch/81020854" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
    <!-- /Yandex.Metrika counter -->
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
    <script src="https://www.google.com/recaptcha/api.js"></script>
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
                        <h4 class="mb-1 text-white">Здорово! Вы почти в нашей команде!</h4>
                        <p>Осталось всего ничего, просто заполните форму и вступайте в ряды NTP.</p>
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
<#--<!-- Optional JavaScript &ndash;&gt;-->
<#--<!-- jQuery first, then Popper.js, then Bootstrap JS &ndash;&gt;-->
<#--<script src="/js/jquery.mi.js"></script>-->
<#--<script src="/js/popper.mi.js"></script>-->
<#--<script src="/js/bootstrap.mi.js"></script>-->
<#--<!-- Appear JavaScript &ndash;&gt;-->
<#--<script src="/js/jquery.appea.js"></script>-->
<#--<!-- Countdown JavaScript &ndash;&gt;-->
<#--<script src="/js/countdown.mi.js"></script>-->
<#--<!-- Counterup JavaScript &ndash;&gt;-->
<#--<script src="/js/waypoints.mi.js"></script>-->
<#--<script src="/js/jquery.counterup.mi.js"></script>-->
<#--<!-- Wow JavaScript &ndash;&gt;-->
<#--<script src="/js/wow.mi.js"></script>-->
<#--<!-- lottie JavaScript &ndash;&gt;-->
<#--<script src="/js/lotti.js"></script>-->
<#--<!-- Apexcharts JavaScript &ndash;&gt;-->
<#--<script src="/js/apexchart.js"></script>-->
<#--<!-- Slick JavaScript &ndash;&gt;-->
<#--<script src="/js/slick.mi.js"></script>-->
<#--<!-- Select2 JavaScript &ndash;&gt;-->
<#--<script src="/js/select2.mi.js"></script>-->
<#--<!-- Owl Carousel JavaScript &ndash;&gt;-->
<#--<script src="/js/owl.carousel.mi.js"></script>-->
<#--<!-- Magnific Popup JavaScript &ndash;&gt;-->
<#--<script src="/js/jquery.magnific-popup.mi.js"></script>-->
<#--<!-- Smooth Scrollbar JavaScript &ndash;&gt;-->
<#--<script src="/js/smooth-scrollba.js"></script>-->
<#--<!-- Chart Custom JavaScript &ndash;&gt;-->
<#--<script src="/js/chart-custo.js"></script>-->
<#--<!-- Custom JavaScript &ndash;&gt;-->
<#--<script src="/js/custo.js"></script>-->
</body>
</html>