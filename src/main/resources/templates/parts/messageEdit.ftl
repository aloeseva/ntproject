<#include "security.ftl">
<#if message??>
    <script>
        $(document).ready(function () {
            //this is just to verify that click works
            $('.post-text.ml-3.w-100').click(function () {
                console.log('clicked');
            });

            $('.post-text.ml-3.w-100').trigger('click');
        });
    </script>
</#if>
<div class="col-lg-8 offset-lg-2">
    <div class="col-sm-12">
        <div id="post-modal-data" class="iq-card iq-card-block iq-card-stretch iq-card-height">
            <div class="iq-card-header d-flex justify-content-between">
                <div class="iq-header-title">
                    <h4 class="card-title">Create Post</h4>
                </div>
            </div>
            <div class="iq-card-body" data-toggle="modal" data-target="#post-modal">
                <div class="d-flex align-items-center">
                    <form class="post-text ml-3 w-100">
                        <input type="text" class="form-control rounded"
                               placeholder="Write something here..." style="border:none;">
                    </form>
                </div>
            </div>
            <div class="modal fade <#if message??>show</#if>" id="post-modal" tabindex="-1" role="dialog"
                 aria-labelledby="post-modalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="post-modalLabel">Create Post</h5>
                            <a class="btn btn-secondary" href="/user-messages/${currentUserId}" role="button">
                                <i class="ri-close-fill"></i>
                            </a>
                        </div>
                        <div class="modal-body">
                            <form method="post" <#if !message??> action="/" </#if> enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                                           value="<#if message??>${message.text}</#if>" name="text"
                                           placeholder="Введите сообщение"/>
                                    <#if textError??>
                                        <div class="invalid-feedback">
                                            ${textError}
                                        </div>
                                    </#if>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control"
                                           value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Тэг"/>
                                    <#if tagError??>
                                        <div class="invalid-feedback">
                                            ${tagError}
                                        </div>
                                    </#if>
                                </div>
                                <hr>
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <input type="hidden" name="id" value="<#if message?? && !textError??>${message.id}</#if>"/>
                                <br>
                                <button type="submit" class="btn btn-primary d-block w-100 mt-3">Post</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
