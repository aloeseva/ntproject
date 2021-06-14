<#import "navbar.ftl" as n>

<#macro page path isMessagePage>
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
        <link rel="stylesheet" href="/static/css/bootstrap.min.css">
        <!-- Typography CSS -->
        <link rel="stylesheet" href="/static/css/typography.css">
        <!-- Style CSS -->
        <link rel="stylesheet" href="/static/css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="/static/css/responsiv.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">


        <#--        <script src="https://cdnjs.cloudflare.com/ajax/libs/turbolinks/5.2.0/turbolinks.js"></script>-->

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
        <!-- lottie JavaScript -->
        <script src="/static/js/lotti.js"></script>
        <!-- am core JavaScript -->
        <script src="/static/js/cor.js"></script>
        <!-- am charts JavaScript -->
        <script src="/static/js/chart.js"></script>
        <!-- am animated JavaScript -->
        <script src="/static/js/animate.js"></script>
        <!-- am kelly JavaScript -->
        <script src="/static/js/kell.js"></script>
        <!-- am maps JavaScript -->
        <script src="/static/js/map.js"></script>
        <!-- am worldLow JavaScript -->
        <script src="/static/js/worldLo.js"></script>
        <!-- Chart Custom JavaScript -->
        <script src="/static/js/chart-custo.js"></script>
        <!-- Custom JavaScript -->
        <script src="/static/js/custo.js"></script>

        <!-- Optional JavaScript -->
        <style>
            .turbolinks-progress-bar {
                height: 2px;
                background-color: navy;
            }
        </style>
    </head>

    <body class="right-column-fixed">
    <div id="loading">
        <div id="loading-center">
        </div>
    </div>
    <@n.navbar path isMessagePage />
    <#include "sidebar.ftl">
    <div class="wrapper">
        <div id="content-page" class="content-page">
            <div class="container">
                <div class="row">
        <#nested>
                </div>
            </div>
        </div>
    </div>

    </body>
    </html>
</#macro>
