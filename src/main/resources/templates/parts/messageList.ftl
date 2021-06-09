<#include "security.ftl">
<#import "pager.ftl" as p>

<@p.pager page url />

<div class="col-lg-8 row m-0 p-0" data-id="${message.id}>
    <div class="col-sm-12">
        <#list page.content as message>
            <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                <div class="iq-card-body">
                    <div class="user-post-data">
                        <div class="d-flex flex-wrap">
                            <div class="media-support-info mt-2">
                                <h5 class="mb-0 d-inline-block">
                                    <a href="/user-messages/${message.author.id}" class="">${message.authorName}</a>
                                </h5>
                            </div>
                            <#if message.author.id == currentUserId>
                                <div class="iq-card-post-toolbar">
                                    <div class="dropdown">
                                          <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false" role="button">
                                          <i class="ri-more-fill"></i>
                                          </span>
                                        <div class="dropdown-menu m-0 p-0">
                                            <a class="dropdown-item p-3"
                                               href="/user-messages/${message.author.id}?message=${message.id}">
                                                <div class="d-flex align-items-top">
                                                    <div class="icon font-size-20"><i class="ri-save-line"></i>
                                                    </div>
                                                    <div class="data ml-2">
                                                        <h6>Edit</h6>
                                                        <p class="mb-0">Edit your post</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </#if>
                        </div>
                    </div>
                    <div class="mt-3">
                        <p>${message.text}</p>
                        <i>#${message.tag}</i>
                    </div>
                    <#if message.filename??>
                        <div class="user-post">
                            <div class="d-flex">
                                <div class="col-md-6">
                                    <img src="/img/${message.filename}"
                                         alt="${message.filename}"
                                         class="img-fluid rounded w-100">
                                </div>
                            </div>
                        </div>
                    </#if>
                </div>
            </div>
        <#else>
            No message
        </#list>
    </div>
</div>

<#--<div class="card-column" style=" align-items: center" id="message-list">-->
<#--    <#list page.content as message>-->
<#--        <div class="card my-3 col-md-6 offset-md-3" data-id="${message.id}">-->
<#--            <#if message.filename??>-->
<#--                <img src="/img/${message.filename}" class="card-img-top" alt="${message.filename}"/>-->
<#--            </#if>-->
<#--            <div class="m-2" style="color: black">-->
<#--                <span>${message.text}</span><br/>-->
<#--                <i>#${message.tag}</i>-->
<#--            </div>-->
<#--            <div class="card-footer text-muted container">-->
<#--                <div class="row">-->
<#--                    <a class="col align-self-center"-->
<#--                       href="/user-messages/${message.author.id}">${message.authorName}</a>-->
<#--                    <a class="col align-self-center" href="/messages/${message.id}/like">-->
<#--                        <#if message.meLiked>-->
<#--                            <i class="fas fa-heart"></i>-->
<#--                        <#else>-->
<#--                            <i class="far fa-heart"></i>-->
<#--                        </#if>-->
<#--                        ${message.likes}-->
<#--                    </a>-->
<#--                    <#if message.author.id == currentUserId>-->
<#--                        <a class="col btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">-->
<#--                            Edit-->
<#--                        </a>-->
<#--                    </#if>-->
<#--                </div>-->
<#--            </div>-->
<#--        </div>-->
<#--    <#else>-->
<#--        No message-->
<#--    </#list>-->
<#--</div>-->
<@p.pager page url />