<#import "parts/common.ftl" as c>

<@c.page "/user-messages/${userChannel.id}" true false>

    <div class="col-sm-8 offset-sm-2">
        <div class="iq-card">
            <div class="iq-card-body profile-page p-0">
                <div class="profile-header">
                    <div class="cover-container">
                        <img src="/static/img/profile-b.jpg" alt="profile-bg" class="rounded img-fluid">
                    </div>
                    <div class="user-detail text-center mb-3" style="bottom: 5px;">
                        <div class="profile-img">
                            <img src="/static/img/user.png" alt="profile-img" class="avatar-130 img-fluid" style="width: 120px ;height: 120px"/>
                        </div>
                        <div class="profile-detail">
                            <h3 class="">${userChannel.username}</h3>
                        </div>
                    </div>
                    <div class="profile-info p-4 d-flex align-items-center justify-content-between position-relative">
                        <div class="social-links">
                            <#if !isCurrentUser>
                                <#if isSubscriber>
                                    <a class="btn btn-info" href="/user/unsubscribe/${userChannel.id}">Unsubscribe</a>
                                <#else>
                                    <a class="btn btn-info" href="/user/subscribe/${userChannel.id}">Subscribe</a>
                                </#if>
                            </#if>
                        </div>
                        <div class="social-info">
                            <ul class="social-data-block d-flex align-items-center justify-content-between list-inline p-0 m-0">
                                <li class="text-center pl-3">
                                    <h6>Edit profile</h6>
                                    <a href="/user/profile">
                                        <i class="ri-pencil-line">
                                        </i>
                                    </a>
                                </li>
                                <li class="text-center pl-3">
                                    <h6>Followers</h6>
                                    <a href="/user/subscribers/${userChannel.id}/list"><p
                                                class="mb-0">${subscribersCount}</p></a>
                                    <#--                                    <p class="mb-0">206</p>-->
                                </li>
                                <li class="text-center pl-3">
                                    <h6>Following</h6>
                                    <a href="/user/subscriptions/${userChannel.id}/list"><p
                                                class="mb-0">${subscriptionsCount}</p></a>
                                    <#--                                    <p class="mb-0">100</p>-->
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<#--    <h3>${userChannel.username}</h3>-->
<#--    <#if !isCurrentUser>-->
<#--        <#if isSubscriber>-->
<#--            <a class="btn btn-info" href="/user/unsubscribe/${userChannel.id}">Unsubscribe</a>-->
<#--        <#else>-->
<#--            <a class="btn btn-info" href="/user/subscribe/${userChannel.id}">Subscribe</a>-->
<#--        </#if>-->
<#--    </#if>-->
<#--    <div class="container my-3">-->
<#--        <div class="row">-->
<#--            <div class="col">-->
<#--                <div class="card">-->
<#--                    <div class="card-body">-->
<#--                        <div class="card-title" style="color: black">Subscriptions</div>-->
<#--                        <h3 class="card-text">-->
<#--                            <a href="/user/subscriptions/${userChannel.id}/list">${subscriptionsCount}</a>-->
<#--                        </h3>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </div>-->
<#--            <div class="col">-->
<#--                <div class="card">-->
<#--                    <div class="card-body">-->
<#--                        <div class="card-title" style="color: black">Subscribers</div>-->
<#--                        <h3 class="card-text">-->
<#--                            <a href="/user/subscribers/${userChannel.id}/list">${subscribersCount}</a>-->
<#--                        </h3>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </div>-->
<#--        </div>-->
<#--    </div>-->
    <#if isCurrentUser>
        <#include "parts/messageEdit.ftl" />
    </#if>

    <#include "parts/messageList.ftl" />
</@c.page>
