<#import "navbar.ftl" as n>

<#macro page path isMessagePage friendPage>
    <!DOCTYPE html>
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
        <meta charset="UTF-8"/>
        <title>NTProject</title>

        <!-- Required meta tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
              integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">


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
    <#if friendPage && !isMessagePage>
        <div class="col-lg-8 offset-lg-2">
            <div class="header-for-bg">
                <div class="background-header position-relative">
                    <img src="/static/img/friends.jpg" class="img-fluid w-100" alt="header-bg">
                    <div class="title-on-header">
                        <div class="data-block">
                            <h2>${userChannel.username}</h2>
                            <h4>${type}</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="iq-card" style="
                        margin-top: 70px;
                        margin-bottom: -135px;"
                    >
                        <div class="iq-card-body p-0">
                            <div class="user-tabing">
                                <ul class="nav nav-pills d-flex align-items-center justify-content-center profile-feed-items p-0 m-0">
                                    <li class="col-sm-6 p-0">
                                        <a class="nav-link <#if "${type}" != "subscriptions" > active</#if>"
                                           href="/user/subscribers/${userChannel.id}/list">
                                            Followers
                                        </a>
                                    </li>
                                    <li class="col-sm-6 p-0">
                                        <a class="nav-link <#if "${type}" == "subscriptions" > active</#if>"
                                           href="/user/subscriptions/${userChannel.id}/list">
                                            Following
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </#if>

    <#if friendPage && isMessagePage>
        <div class="col-lg-8 offset-lg-2">
            <div class="header-for-bg">
                <div class="background-header position-relative">
                    <img src="/static/img/friends.jpg" class="img-fluid w-100" alt="header-bg">
                </div>
            </div>
        </div>
    </#if>

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
