<#include "security.ftl">
<#import "login.ftl" as l>

<!-- TOP Nav Bar -->
<#macro navbar path isMessagePage>
<div class="iq-top-navbar">
    <div class="iq-navbar-custom">
        <nav class="navbar navbar-expand-lg navbar-light p-0">
            <div class="iq-navbar-logo d-flex justify-content-between">
                <a href="/">
                    <img src="/static/img/gorila.png" class="img-fluid" alt="NTProject">
                    <span>NTP</span>
                </a>
                <div class="iq-menu-bt align-self-center">
                    <div class="wrapper-menu">
                        <div class="main-circle">
                            <i class="ri-menu-line"></i>
                        </div>
                    </div>
                </div>
            </div>
            <#if isMessagePage>
                <div class="iq-search-bar">
                    <form method="get" action="${path}" class="searchbox">
                        <input type="text" name="filter" class="text search-input" value="${filter!}" placeholder="Type here to search...">
                        <i class="search-link ri-search-line"></i>
                    </form>
                </div>
            </#if>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-label="Toggle navigation">
                <i class="ri-menu-3-line"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto navbar-list">
                    <#if user??>
                        <li>
                            <a href="/user-messages/${currentUserId}" class="iq-waves-effect d-flex align-items-center">
                                <img src="/static/img/user.png" class="img-fluid rounded-circle mr-3" alt="user">
                                <div class="caption">
                                    <h6 class="mb-0 line-height">${name}</h6>
                                </div>
                            </a>
                        </li>
                    <#else>
                        <li>
                            <@l.logout />
                        </li>
                    </#if>
                    <li>
                        <a href="/" class="iq-waves-effect d-flex align-items-center">
                            <i class="ri-home-line"></i>
                        </a>
                    </li>
                </ul>
                <ul class="navbar-list">
                    <li>
                        <a href="#" class="search-toggle iq-waves-effect d-flex align-items-center">
                            <i class="ri-arrow-down-s-fill"></i>
                        </a>
                        <div class="iq-sub-dropdown iq-user-dropdown">
                            <div class="iq-card shadow-none m-0">
                                <div class="iq-card-body p-0 ">
                                    <div class="bg-primary p-3 line-height">
                                        <h5 class="mb-0 text-white line-height">${name}</h5>
                                        <#--                                        <span class="text-white font-size-12">Available</span>-->
                                    </div>
                                    <#if user??>
                                        <a href="/user-messages/${currentUserId}"
                                           class="iq-sub-card iq-bg-primary-hover">
                                            <div class="media align-items-center">
                                                <div class="rounded iq-card-icon iq-bg-primary">
                                                    <i class="ri-file-user-line"></i>
                                                </div>
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0 ">My Profile</h6>
                                                    <p class="mb-0 font-size-12">View personal profile details.</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="/user/profile" class="iq-sub-card iq-bg-warning-hover">
                                            <div class="media align-items-center">
                                                <div class="rounded iq-card-icon iq-bg-warning">
                                                    <i class="ri-profile-line"></i>
                                                </div>
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0 ">Edit Profile</h6>
                                                    <p class="mb-0 font-size-12">Modify your personal details.</p>
                                                </div>
                                            </div>
                                        </a>
                                        <#if isAdmin>
                                            <a href="/user" class="iq-sub-card iq-bg-info-hover">
                                                <div class="media align-items-center">
                                                    <div class="rounded iq-card-icon iq-bg-info">
                                                        <i class="ri-account-box-line"></i>
                                                    </div>
                                                    <div class="media-body ml-3">
                                                        <h6 class="mb-0 ">User list</h6>
                                                        <p class="mb-0 font-size-12">Panel for the administrator.</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </#if>
                                    </#if>

                                    <div class="d-inline-block w-100 text-center p-3">
                                        <@l.logout />
                                        <#--                                        <a class="bg-primary iq-sign-btn" href="sign-in.html" role="button">Sign out<i-->
                                        <#--                                                    class="ri-login-box-line ml-2"></i></a>-->
                                    </div>

                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>
</#macro>
<!-- TOP Nav Bar END -->

<#--<nav class="navbar navbar-expand-lg navbar-dark bg-dark">-->
<#--    <a class="navbar-brand" href="/">-->
<#--        <img src="https://img.icons8.com/material/24/4a90e2/gorilla.png" width="35" height="35" alt="NTProject">-->
<#--    </a>-->
<#--    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"-->
<#--            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">-->
<#--        <span class="navbar-toggler-icon"></span>-->
<#--    </button>-->

<#--    <div class="collapse navbar-collapse" id="navbarNavDropdown">-->
<#--        <ul class="navbar-nav mr-auto">-->
<#--            <#if user??>-->
<#--                <li class="nav-item">-->
<#--                    <a class="nav-link" href="/main">Messages</a>-->
<#--                </li>-->
<#--                <li class="nav-item">-->
<#--                    <a class="nav-link" href="/user-messages/${currentUserId}">My messages</a>-->
<#--                </li>-->
<#--            </#if>-->
<#--        </ul>-->

<#--        <ul class="navbar-nav ml-md-auto d-md-flex">-->
<#--            <#if user??>-->
<#--                <li class="nav-item dropdown">-->
<#--                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"-->
<#--                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">-->
<#--                        ${name}-->
<#--                    </a>-->
<#--                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown"-->
<#--                         style="text-align: center;">-->
<#--                        <#if isAdmin>-->
<#--                            <a class="nav-link" href="/user" style="color: #6c757d">User list</a>-->
<#--                        </#if>-->
<#--                        <#if user??>-->
<#--                            <a class="nav-link" href="/user/profile" style="color: #6c757d">Profile</a>-->
<#--                        </#if>-->
<#--                        <div role="separator" class="dropdown-divider"></div>-->
<#--                        <@l.logout />-->
<#--                    </div>-->
<#--                </li>-->
<#--            <#else>-->
<#--                <@l.logout />-->
<#--            </#if>-->
<#--        </ul>-->
<#--    </div>-->
<#--</nav>-->
