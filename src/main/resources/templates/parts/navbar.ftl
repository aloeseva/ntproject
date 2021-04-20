<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">
        <img src="https://img.icons8.com/material/24/4a90e2/gorilla.png" width="35" height="35" alt="NTProject">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav mr-auto">
            <#if user??>
                <li class="nav-item">
                    <a class="nav-link" href="/main">Messages</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user-messages/${currentUserId}">My messages</a>
                </li>
            </#if>
        </ul>

        <ul class="navbar-nav ml-md-auto d-md-flex">
            <#if user??>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${name}
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown" style="text-align: center;">
                    <#if isAdmin>
                        <a class="nav-link" href="/user" style="color: #6c757d">User list</a>
                    </#if>
                    <#if user??>
                        <a class="nav-link" href="/user/profile" style="color: #6c757d">Profile</a>
                    </#if>
                    <div role="separator" class="dropdown-divider"></div>
                    <@l.logout />
                </div>
            </li>
            <#else>
            <@l.logout />
            </#if>
        </ul>
    </div>
</nav>
