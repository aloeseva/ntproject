<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

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
                            <img src="/static/img/user.png" alt="profile-img" class="avatar-130 img-fluid"
                                 style="width: 120px ;height: 120px"/>
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
                                <#if userChannel.id == currentUserId>
                                    <li class="text-center pl-3">
                                        <h6>Edit profile</h6>
                                        <a href="/user/profile">
                                            <i class="ri-pencil-line">
                                            </i>
                                        </a>
                                    </li>
                                </#if>
                                <li class="text-center pl-3">
                                    <h6>Followers</h6>
                                    <a href="/user/subscribers/${userChannel.id}/list"><p
                                                class="mb-0">${subscribersCount}</p></a>
                                </li>
                                <li class="text-center pl-3">
                                    <h6>Following</h6>
                                    <a href="/user/subscriptions/${userChannel.id}/list"><p
                                                class="mb-0">${subscriptionsCount}</p></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <#if isCurrentUser>
        <#include "parts/messageEdit.ftl" />
    </#if>

    <#include "parts/messageList.ftl" />
</@c.page>
