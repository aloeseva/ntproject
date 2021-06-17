<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page "#" false false>
    <div class="col-sm-12">
        <div class="iq-card">
            <div class="iq-card-header d-flex justify-content-between">
                <div class="iq-header-title">
                    <h4 class="card-title">List of users</h4>
                </div>
            </div>
            <div class="iq-card-body">
                <div class="table-responsive">
                    <table class="files-lists table table-striped mt-4">
                        <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Role</th>
                            <th scope="col">Edit</th>
                            <th scope="col">Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list users as user>
                            <tr>
                                <td>${user.username}</td>
                                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                                <td><a href="/user/${user.id}">edit</a></td>
                                <#if user.id != currentUserId>
                                    <td><a href="/user/delete/admin/${user.id}" class="btn btn-outline-danger"><i
                                                    class="ri-alert-line"></i> delete</a></td>
                                <#else>
                                    <td></td>
                                </#if>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</@c.page>
