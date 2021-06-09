<#macro page>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <title>NTProject</title>

        <!-- Required meta tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

        <#--    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">-->

        <!-- Bootstrap CSS -->
        <#--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous" />-->
        <#--    <link rel="stylesheet" href="/static/style.css" />-->
        <script src="https://www.google.com/recaptcha/api.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/turbolinks/5.2.0/turbolinks.js"></script>

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
        <!-- lottie JavaScript -->
        <script src="/js/lottie.js"></script>
        <!-- am core JavaScript -->
        <script src="/js/core.js"></script>
        <!-- am charts JavaScript -->
        <script src="/js/charts.js"></script>
        <!-- am animated JavaScript -->
        <script src="/js/animated.js"></script>
        <!-- am kelly JavaScript -->
        <script src="/js/kelly.js"></script>
        <!-- am maps JavaScript -->
        <script src="/js/maps.js"></script>
        <!-- am worldLow JavaScript -->
        <script src="/js/worldLow.js"></script>
        <!-- Chart Custom JavaScript -->
        <script src="/js/chart-custom.js"></script>
        <!-- Custom JavaScript -->
        <script src="/js/custom.js"></script>

        <!-- Optional JavaScript -->
        <style>
            .turbolinks-progress-bar {
                height: 2px;
                background-color: navy;
            }
        </style>
    </head>
    <body class="right-column-fixed">
    <#include "navbar.ftl">
    <div class="wrapper">
        <#nested>
    </div>

    </body>
    </html>
</#macro>
