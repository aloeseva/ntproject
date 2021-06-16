<#include "security.ftl">

<#macro login path isRegisterForm>
    <form class="mt-4" action="${path}" method="post">
        <div class="form-group">
            <label for="exampleInputUsername">User Name :</label>
            <input type="text"
                   name="username"
                   value="<#if user??>${user.username}</#if>"
                   class="form-control mb-0 ${(usernameError??)?string('is-invalid', '')}"
                   id="exampleInputUsername"
                   placeholder="User name">
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Password:</label>
            <input type="password"
                   name="password"
                   class="form-control mb-0 ${(passwordError??)?string('is-invalid', '')}"
                   id="exampleInputPassword1"
                   placeholder="Password">
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
        <#if isRegisterForm>
            <div class="form-group">
                <label for="exampleInputPassword2">Password:</label>
                <input type="password"
                       name="password2"
                       class="form-control mb-0 ${(password2Error??)?string('is-invalid', '')}"
                       id="exampleInputPassword2"
                       placeholder="Retype password">
                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>

            <div class="form-group">
                <label for="exampleInputEmail">Email:</label>
                <input type="email"
                       name="email"
                       value="<#if user??>${user.email}</#if>"
                       class="form-control mb-0 ${(emailError??)?string('is-invalid', '')}"
                       id="exampleInputEmail"
                       placeholder="some@some.com">
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>

            <div class="form-group">
                <div class="g-recaptcha"
                     data-sitekey="6LdFmIsaAAAAAAkteWx7AGBcIv9oTuc9ydbasik4"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="d-inline-block w-100">
            <button type="submit" class="btn btn-primary float-right"><#if isRegisterForm>Создать<#else>Войти</#if></button>
        </div>
        <div class="sign-info">
            <#if !isRegisterForm>
                <span class="dark-color d-inline-block line-height-2">Впервые на сайте? <a href="/registration">Зарегистрироваться</a>
                </span>
            <#else >
                <span class="dark-color d-inline-block line-height-2">Уже имеете аккаунт? <a href="/login">Войти</a>
                </span>
            </#if>
        </div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit" style="text-align: center;">
            <#if known>Выйти<#else>Войти</#if></button>
    </form>
</#macro>
