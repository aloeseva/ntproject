<#include "security.ftl">
<#import "pager.ftl" as p>

<@p.pager page url />

<div class="col-lg-8 offset-lg-2">
    <div class=" col-sm-12">
        <#list page.content as message>
            <div class="iq-card iq-card-block iq-card-stretch iq-card-height" data-id="${message.id}">
                <div class="iq-card-body" data-id="${message.id}">
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
                                                    <div class="data ml-2" >
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
<#--                    <#if message.filename??>-->
<#--                        <div class="user-post">-->
<#--                            <div class="d-flex">-->
<#--                                <div class="col-md-6">-->
<#--                                    <img src="/img/${message.filename}"-->
<#--                                         alt="${message.filename}"-->
<#--                                         class="img-fluid rounded w-100">-->
<#--                                </div>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </#if>-->
                    <div class="comment-area mt-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="like-block position-relative d-flex align-items-center">
                                <div class="d-flex align-items-center">
                                    <div class="like-data">
                                        <a class="col align-self-center" href="/messages/${message.id}/like">
                                            <#if message.meLiked>
                                                <i class="fas fa-heart"></i>
                                            <#else>
                                                <i class="far fa-heart"></i>
                                            </#if>
                                        </a>
                                    </div>
                                    <div class="total-like-block ml-2 mr-3">
                                        <div class="dropdown">
                                                <span class="dropdown-toggle" data-toggle="dropdown"
                                                      aria-haspopup="true" aria-expanded="false" role="button">
                                                    ${message.likes} Likes
                                                </span>
                                            <#--                                    <div class="dropdown-menu">-->
                                            <#--                                        <a class="dropdown-item" href="#">Max Emum</a>-->
                                            <#--                                        <a class="dropdown-item" href="#">Bill Yerds</a>-->
                                            <#--                                        <a class="dropdown-item" href="#">Hap E. Birthday</a>-->
                                            <#--                                        <a class="dropdown-item" href="#">Tara Misu</a>-->
                                            <#--                                        <a class="dropdown-item" href="#">Midge Itz</a>-->
                                            <#--                                        <a class="dropdown-item" href="#">Sal Vidge</a>-->
                                            <#--                                        <a class="dropdown-item" href="#">Other</a>-->
                                            <#--                                    </div>-->
                                        </div>
                                    </div>

                                    <div class="like-data">
                                        <a class="col align-self-center" href="/messages/${message.id}/dislike">
                                            <#if message.meDisliked>
                                                <i class="fas fa-thumbs-down"></i>
                                            <#else>
                                                <i class="far fa-thumbs-down"></i>
                                            </#if>
                                        </a>
                                    </div>
                                    <div class="total-like-block ml-2 mr-3">
                                        <div class="dropdown">
                                                <span class="dropdown-toggle" data-toggle="dropdown"
                                                      aria-haspopup="true" aria-expanded="false" role="button">
                                                    ${message.dislikes} dislikes
                                                </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="total-comment-block">
                                    <div class="dropdown">
                                             <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                                   aria-expanded="false" role="button">
                                             0 Comment
                                             </span>
                                        <#--                                <div class="dropdown-menu">-->
                                        <#--                                    <a class="dropdown-item" href="#">Max Emum</a>-->
                                        <#--                                    <a class="dropdown-item" href="#">Bill Yerds</a>-->
                                        <#--                                    <a class="dropdown-item" href="#">Hap E. Birthday</a>-->
                                        <#--                                    <a class="dropdown-item" href="#">Tara Misu</a>-->
                                        <#--                                    <a class="dropdown-item" href="#">Midge Itz</a>-->
                                        <#--                                    <a class="dropdown-item" href="#">Sal Vidge</a>-->
                                        <#--                                    <a class="dropdown-item" href="#">Other</a>-->
                                        <#--                                </div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <#--                <ul class="post-comments p-0 m-0">-->
                        <#--                    <li class="mb-2">-->
                        <#--                        <div class="d-flex flex-wrap">-->
                        <#--                            <div class="user-img">-->
                        <#--                                <img src="images/user/02.jpg" alt="userimg"-->
                        <#--                                     class="avatar-35 rounded-circle img-fluid">-->
                        <#--                            </div>-->
                        <#--                            <div class="comment-data-block ml-3">-->
                        <#--                                <h6>Monty Carlo</h6>-->
                        <#--                                <p class="mb-0">Lorem ipsum dolor sit amet</p>-->
                        <#--                                <div class="d-flex flex-wrap align-items-center comment-activity">-->
                        <#--                                    <a href="javascript:void();">like</a>-->
                        <#--                                    <a href="javascript:void();">reply</a>-->
                        <#--                                    <a href="javascript:void();">translate</a>-->
                        <#--                                    <span> 5 min </span>-->
                        <#--                                </div>-->
                        <#--                            </div>-->
                        <#--                        </div>-->
                        <#--                    </li>-->
                        <#--                    <li>-->
                        <#--                        <div class="d-flex flex-wrap">-->
                        <#--                            <div class="user-img">-->
                        <#--                                <img src="images/user/03.jpg" alt="userimg"-->
                        <#--                                     class="avatar-35 rounded-circle img-fluid">-->
                        <#--                            </div>-->
                        <#--                            <div class="comment-data-block ml-3">-->
                        <#--                                <h6>Paul Molive</h6>-->
                        <#--                                <p class="mb-0">Lorem ipsum dolor sit amet</p>-->
                        <#--                                <div class="d-flex flex-wrap align-items-center comment-activity">-->
                        <#--                                    <a href="javascript:void();">like</a>-->
                        <#--                                    <a href="javascript:void();">reply</a>-->
                        <#--                                    <a href="javascript:void();">translate</a>-->
                        <#--                                    <span> 5 min </span>-->
                        <#--                                </div>-->
                        <#--                            </div>-->
                        <#--                        </div>-->
                        <#--                    </li>-->
                        <#--                </ul>-->
                    </div>

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