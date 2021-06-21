<#import "parts/common.ftl" as c>

<@c.page "#" false false>
    <div class="col-sm-12">
        <div class="iq-card">
            <div class="iq-card-header d-flex justify-content-between">
                <div class="iq-header-title">
                    <h4 class="card-title">Изменение пользователя</h4>
                </div>
            </div>
            <div class="iq-card-body">
                <form action="/user" method="post">
                    <div class="table-responsive">
                        <table class="files-lists table table-striped mt-4">
                            <thead>
                            <tr>
                                <th scope="col">Имя</th>
                                <th scope="col">Пользователь</th>
                                <th scope="col">Админ</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <input type="text" name="username"  class="form-control" value="${user.username}"/>
                                </td>
                                <#list roles as role>
                                    <td>
                                        <div>
                                            <label><input type="checkbox"
                                                          name="${role}" ${user.roles?seq_contains(role)?string("checked", "")} />
                                            </label>
                                        </div>
                                    </td>
                                </#list>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <input type="hidden" value="${user.id}" name="userId"/>
                    <input type="hidden" value="${_csrf.token}" name="_csrf"/>
                    <button type="submit" class="btn btn-primary">Сохранить</button>
                </form>
            </div>
        </div>
    </div>
</@c.page>
