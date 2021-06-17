<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page "#" false false>
    <div class="col-lg-12">
        <div class="iq-edit-list-data">
            <div class="tab-content">
                <div class="tab-pane fade active show" id="personal-information" role="tabpanel">
                    <div class="iq-card">
                        <div class="iq-card-header d-flex justify-content-between">
                            <div class="iq-header-title">
                                <h4 class="card-title">Personal Information</h4>
                            </div>
                        </div>
                        <div class="iq-card-body">
                            ${message!}
                            <form method="post">
                                <div class="form-group row align-items-center">
                                    <div class="col-md-12">
                                        <div class="profile-img-edit">
                                            <img class="profile-pic" src="/static/img/user.png" alt="profile-pic">
                                            <div class="p-image">
                                                <i class="ri-pencil-line upload-button"></i>
<#--                                                <input class="file-upload" type="file" accept="image/*"/>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Password:</label>
                                    <div class="col-sm-6">
                                        <input type="password" name="password" class="form-control" placeholder="Password" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Email:</label>
                                    <div class="col-sm-6">
                                        <input type="email" name="email" class="form-control" placeholder="some@some.com" value="${email!''}" />
                                    </div>
                                </div>
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-primary mr-2">Submit</button>
                            </form>
                            <hr>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Удалить профиль:</label>
                                <div class="col-sm-6">
                                    <a href="/user/delete/${currentUserId}" class="btn btn-outline-danger"><i class="ri-alert-line"></i> delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</@c.page>
