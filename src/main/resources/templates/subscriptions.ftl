<#import "parts/common.ftl" as c>

<@c.page "#" false true false>
    <div class="wrapper">
        <div id="content-page" class="content-page">
            <div class="container">
                <div class="row">
                    <#list users as user>
                        <div class="col-md-6">
                            <div class="iq-card">
                                <div class="iq-card-body profile-page p-0">
                                    <div class="profile-header-image">
                                        <div class="cover-container">
                                            <img src="/static/img/profile-b.jpg" alt="profile-bg"
                                                 class="rounded img-fluid w-100">
                                        </div>
                                        <div class="profile-info p-4">
                                            <div class="user-detail">
                                                <div class="d-flex flex-wrap justify-content-between align-items-start">
                                                    <div class="profile-detail d-flex">
                                                        <div class="profile-img pr-4">
                                                            <img src="/static/img/user.png" alt="profile-img"
                                                                 class="avatar-130 img-fluid"/>
                                                        </div>
                                                        <div class="user-data-block">
                                                            <a href="/user-messages/${user.id}"><h4
                                                                        class="">${user.getUsername()}</h4></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>
            </div>
        </div>
    </div>
</@c.page>
