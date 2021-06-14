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
                <#--                <hr>-->
                <#--                <ul class="post-opt-block d-flex align-items-center list-inline m-0 p-0">-->
                <#--                    <li class="iq-bg-primary rounded p-2 pointer mr-3">-->
                <#--                        <input type="file" name="file" id="customFile" />-->
                <#--                        <a href="#"></a>-->
                <#--                        <img src="/static/img/07.png" alt="icon" class="img-fluid"> Photo-->
                <#--                    </li>-->

                <#--&lt;#&ndash;                    <label class="custom-file-label" for="customFile">Choose file</label>&ndash;&gt;-->
                <#--                </ul>-->
            </div>
            <div class="modal fade <#if message??>show</#if>" id="post-modal" tabindex="-1" role="dialog"
                 aria-labelledby="post-modalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="post-modalLabel">Create Post</h5>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"><i
                                        class="ri-close-fill"></i></button>
                        </div>
                        <div class="modal-body">
                            <form method="post" <#if !message??> action="/main" </#if> enctype="multipart/form-data">
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
                                <div class="form-group">
                                    <div class="custom-file">
                                        <ul class="post-opt-block d-flex align-items-center list-inline m-0 p-0">
                                            <li class="iq-bg-primary rounded p-2 pointer mr-3">
                                                <input type="file" name="file" id="customFile"/>
                                                <#--                                                <label class="custom-file-label" for="customFile">Choose file</label>-->
                                            </li>
                                        </ul>
                                        <#--                                        <input type="file" name="file" id="customFile"/>-->
                                        <#--                                        <label class="custom-file-label" for="customFile">Choose file</label>-->
                                    </div>
                                </div>
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <input type="hidden" name="id" value="<#if message??>${message.id}</#if>"/>
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

<#--<a class="btn btn-primary offset-md-3" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">-->
<#--    Message editor-->
<#--</a>-->
<#--<div class="collapse <#if message??>show</#if>" id="collapseExample">-->
<#--    <div class="form-group mt-3 col-md-6 offset-md-3" style="width: auto">-->
<#--        <form method="post" enctype="multipart/form-data">-->
<#--            <div class="form-group">-->
<#--                <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"-->
<#--                       value="<#if message??>${message.text}</#if>" name="text" placeholder="Введите сообщение" />-->
<#--                <#if textError??>-->
<#--                    <div class="invalid-feedback">-->
<#--                        ${textError}-->
<#--                    </div>-->
<#--                </#if>-->
<#--            </div>-->
<#--            <div class="form-group">-->
<#--                <input type="text" class="form-control"-->
<#--                       value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Тэг" />-->
<#--                <#if tagError??>-->
<#--                    <div class="invalid-feedback">-->
<#--                        ${tagError}-->
<#--                    </div>-->
<#--                </#if>-->
<#--            </div>-->
<#--            <div class="form-group">-->
<#--                <div class="custom-file">-->
<#--                    <input type="file" name="file" id="customFile" />-->
<#--                    <label class="custom-file-label" for="customFile">Choose file</label>-->
<#--                </div>-->
<#--            </div>-->
<#--            <input type="hidden" name="_csrf" value="${_csrf.token}" />-->
<#--            <input type="hidden" name="id" value="<#if message??>${message.id}</#if>" />-->
<#--            <div class="form-group">-->
<#--                <button type="submit" class="btn btn-primary">Save message</button>-->
<#--            </div>-->
<#--        </form>-->
<#--    </div>-->
<#--</div>-->
