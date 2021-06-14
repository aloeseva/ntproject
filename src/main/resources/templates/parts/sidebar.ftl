<#include "security.ftl">

<!-- Sidebar  -->
<div class="iq-sidebar">
    <div id="sidebar-scrollbar">
        <nav class="iq-sidebar-menu">
            <ul id="iq-sidebar-toggle" class="iq-menu">
                <li>
                    <a href="/main" class="iq-waves-effect"><i
                                class="las la-newspaper"></i><span>Messages</span></a>
                </li>
                <#if user??>
                    <li>
                        <a href="/user-messages/${currentUserId}" class="iq-waves-effect"><i
                                    class="las la-user"></i><span>Profile</span></a>
                    </li>
                </#if>
            </ul>
        </nav>
        <div class="p-3"></div>
    </div>
</div>