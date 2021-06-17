<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page "/" false false>

    <div class="col-lg-8 offset-lg-2">
        <div class=" col-sm-12">
            <div id="post-modal-data" class="iq-card iq-card-block iq-card-stretch iq-card-height">
                <div class="iq-card-header d-flex justify-content-between" style="justify-content: center !important;">
                    <div class="iq-header-title">
                        <h4 class="card-title">Top Posts For Today</h4>
                    </div>
                </div>
            </div>
            <#if isPage>
                <#list messages as message>
                    <#if message.author??>
                    <div class="iq-card iq-card-block iq-card-stretch iq-card-height" data-id="${message.id}">

                        <div class="iq-card-body" data-id="${message.id}">
                            <div class="user-post-data">
                                <div class="d-flex flex-wrap">
                                    <div class="media-support-info mt-2">
                                        <h5 class="mb-0 d-inline-block">
                                            <a href="/user-messages/${message.author.id}"
                                               class="">${message.authorName}</a>
                                        </h5>
                                    </div>
                                    <#if message.author.id == currentUserId || isAdmin>
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
                                                    <a class="dropdown-item p-3"
                                                       href="/messages/delete/${message.author.id}/${message.id}">
                                                        <div class="d-flex align-items-top">
                                                            <div class="icon font-size-20"><i
                                                                        class="ri-close-circle-line"></i>
                                                            </div>
                                                            <div class="data ml-2">
                                                                <h6>Delete</h6>
                                                                <p class="mb-0">Delete your post</p>
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
                                            <div class="like-data">
                                                <a href="/messages/${message.id}/comment">
                                                    <h6 title="Открыть комментарии">
                                                        <#list comments as comment>
                                                            <#if comment.id == message.id>
                                                                <#if comment.exist>
                                                                    ${comment.size} Comment
                                                                <#else>
                                                                    0 Comment
                                                                </#if>
                                                            </#if>
                                                        </#list>
                                                    </h6>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <#list comments as comment>
                                    <#if comment.id == message.id>
                                        <#if comment.exist>
                                            <#list comment.comments as com>
                                                <div class="d-flex flex-wrap" style="justify-content: flex-end;">
                                                    <#if com.author.id == currentUserId || isAdmin>
                                                        <div class="iq-card-post-toolbar">
                                                            <div class="dropdown">
                                          <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false" role="button">
                                          <i class="ri-more-fill"></i>
                                          </span>
                                                                <div class="dropdown-menu m-0 p-0">
                                                                    <a class="dropdown-item p-3"
                                                                       href="/messages/comDelete/${com.author.id}/${com.id}">
                                                                        <div class="d-flex align-items-top">
                                                                            <div class="icon font-size-20">
                                                                                <i class="ri-close-circle-line"></i>
                                                                            </div>
                                                                            <div class="data ml-2">
                                                                                <h6>Delete</h6>
                                                                                <p class="mb-0">Delete your
                                                                                    comment</p>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </#if>
                                                </div>
                                                <ul class="post-comments p-0 m-0">
                                                    <li class="mb-2">
                                                        <div class="d-flex flex-wrap">
                                                            <div class="comment-data-block ml-3">
                                                                <a href="/user-messages/${com.author.id}"><h6>${com.authorName}</h6></a>
                                                                <p class="mb-0">${com.text}</p>
                                                                <div class="d-flex flex-wrap align-items-center comment-activity">
                                                                    <div class="like-data">
                                                                        <a class="col align-self-center"
                                                                           href="/messages/${com.id}/comLike">
                                                                            <#if com.meLiked>
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
                                                    ${com.likes} Likes
                                                </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="like-data">
                                                                        <a class="col align-self-center"
                                                                           href="/messages/${com.id}/comDislike">
                                                                            <#if com.meDisliked>
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
                                                    ${com.dislikes} dislikes
                                                </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </#list>
                                        <#else >
                                            <ul class="post-comments p-0 m-0">
                                                <li class="mb-2">
                                                    <div class="d-flex flex-wrap">
                                                        <div class="comment-data-block ml-3">
                                                            <p class="mb-0">No comments</p>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </#if>
                                    </#if>
                                </#list>
                                <#list comments as comment>
                                    <#if comment.id == message.id>
                                        <#if comment.exist>
                                            <#if (comment.size > 3)>
                                                <ul class="post-comments p-0 m-0">
                                                    <li class="mb-2">
                                                        <div class="d-flex flex-wrap" style="justify-content: center !important;">
                                                            <div class="comment-data-block ml-3">
                                                                <p class="mb-0">
                                                                    <a class="col align-self-center"
                                                                       href="/messages/${message.id}/comment">
                                                                        Загрузить еще...
                                                                    </a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </#if>
                                        </#if>
                                    </#if>
                                </#list>
                                <form method="post"
                                      class="comment-text d-flex align-items-center mt-3"
                                      action="/messages/${message.id}/comment"
                                      enctype="multipart/form-data"
                                >
                                    <input type="text"
                                           class="form-control rounded"
                                           name="text"
                                           placeholder="Введите сообщение"/>
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                </form>
                            </div>
                        </div>
                    </div>
                    </#if>
                </#list>
            <#else>
                <div id="post-modal-data" class="iq-card iq-card-block iq-card-stretch iq-card-height">
                    <div class="iq-card-header d-flex justify-content-between" style="justify-content: center !important;">
                        <div class="iq-header-title">
                            <h4 class="card-title">No messages</h4>
                        </div>
                    </div>
                </div>
            </#if>
        </div>
    </div>
</@c.page>