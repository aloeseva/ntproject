<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page "#" false false>
    <div class="col-sm-12">
        <div class="iq-card">
            <div class="iq-card-header d-flex justify-content-between">
                <div class="iq-header-title">
                    <h4 class="card-title">Список пользователей</h4>
                </div>
            </div>
            <div class="iq-card-body">
                <div class="table-responsive">
                    <table class="files-lists table table-striped mt-4">
                        <thead>
                        <tr>
                            <th scope="col">Имя</th>
                            <th scope="col">Роль</th>
                            <th scope="col">Изменить</th>
                            <th scope="col">Удалить</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list users as user>
                            <tr>
                                <td>${user.username}</td>
                                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                                <td><a href="/user/${user.id}">изменить</a></td>
                                <#if user.id != currentUserId>
                                    <td><a href="/user/delete/admin/${user.id}" class="btn btn-outline-danger"><i
                                                    class="ri-alert-line"></i> удалить</a></td>
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
