<#include "security.ftl">
<#import "login.ftl" as l>

<!-- TOP Nav Bar -->
<#macro navbar path isMessagePage isUserPage>
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
                        <input type="text" name="filter" class="text search-input" value="${filter!}" placeholder="Поиск по тегу...">
                        <i class="search-link ri-search-line"></i>
                    </form>
                </div>
            </#if>
            <#if isUserPage>
                <div class="iq-search-bar">
                    <form method="get" action="${path}" class="searchbox">
                        <input type="text" name="filter" class="text search-input" value="${filter!}" placeholder="Поиск...">
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
                                    </div>
                                    <#if user??>
                                        <a href="/user-messages/${currentUserId}"
                                           class="iq-sub-card iq-bg-primary-hover">
                                            <div class="media align-items-center">
                                                <div class="rounded iq-card-icon iq-bg-primary">
                                                    <i class="ri-file-user-line"></i>
                                                </div>
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0 ">Мой профиль</h6>
                                                    <p class="mb-0 font-size-12">Посмотреть личный профиль.</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="/user/profile" class="iq-sub-card iq-bg-warning-hover">
                                            <div class="media align-items-center">
                                                <div class="rounded iq-card-icon iq-bg-warning">
                                                    <i class="ri-profile-line"></i>
                                                </div>
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0 ">Изменить профиль</h6>
                                                    <p class="mb-0 font-size-12">Измените детали профиля.</p>
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
                                                        <h6 class="mb-0 ">Список пользователей</h6>
                                                        <p class="mb-0 font-size-12">Панель для администратора.</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </#if>
                                    </#if>

                                    <div class="d-inline-block w-100 text-center p-3">
                                        <@l.logout />
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
