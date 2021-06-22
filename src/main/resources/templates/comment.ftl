<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<#import "parts/pager.ftl" as p>

<@c.page "/" false false>
    <div class="col-lg-8 offset-lg-2">
        <div class=" col-sm-12">
            <div class="iq-card iq-card-block iq-card-stretch iq-card-height" data-id="${message.id}">
                <div class="iq-card-body" data-id="${message.id}">
                    <div class="user-post-data">
                        <div class="d-flex flex-wrap">
                            <div class="media-support-info mt-2">
                                <h5 class="mb-0 d-inline-block">
                                    <a href="/user-messages/${message.author.id}" class="">${message.authorName}</a>
                                </h5>
                                <p class="mb-0 text-primary">${message.date}</p>
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
                                                        <h6>Изменить</h6>
                                                        <p class="mb-0">Изменить пост</p>
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
                        <i class="ri-hashtag"></i><span>${message.tag}</span>
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
                                            <h6>
                                                ${message.likes}
                                            </h6>
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
                                            <h6>
                                                ${message.dislikes}
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="total-comment-block">
                                    <div class="like-data">
                                        <a href="#">
                                            <i class="far fa-comment-alt"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="total-comment-block">
                                    <div class="like-data">
                                        <a href="#">
                                            <h6 style="margin-left: 12px;">
                                                <#if isPage>
                                                    ${message.size}
                                                <#else >
                                                    0
                                                </#if>
                                            </h6>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <form method="post"
                              class="comment-text d-flex align-items-center mt-3"
                              action="/messages/${message.id}/comment"
                              enctype="multipart/form-data"
                        >
                            <input type="text"
                                   class="form-control rounded"
                                   name="text"
                                   placeholder="Введите комментарий..."/>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <@p.pager page url />

    <div class="col-lg-8 offset-lg-2">
        <div class=" col-sm-12">
            <div class="iq-card iq-card-block iq-card-stretch iq-card-height" data-id="${message.id}">
                <div class="iq-card-body" data-id="${message.id}">
                    <div class="comment-area mt-3">

                        <#list page.content as com>
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
                                                    ${com.likes}
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
                                                    ${com.dislikes}
                                                </span>
                                                    </div>
                                                </div>
                                                <span> ${com.date} </span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        <#else >
                            <ul class="post-comments p-0 m-0">
                                <li class="mb-2">
                                    <div class="d-flex flex-wrap">
                                        <div class="comment-data-block ml-3">
                                            <p class="mb-0">Комментариев нет</p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </#list>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <@p.pager page url />

</@c.page>