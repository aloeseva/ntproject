<#include "security.ftl">

<!-- Sidebar  -->
<div class="iq-sidebar">
    <div id="sidebar-scrollbar">
        <nav class="iq-sidebar-menu">
            <ul id="iq-sidebar-toggle" class="iq-menu">
                <#if user??>
                    <li>
                        <a href="/" class="iq-waves-effect"><i
                                    class="las la-newspaper"></i><span>Messages</span></a>
                    </li>
                </#if>
                <li>
                    <a href="/top" class="iq-waves-effect"><i class="las la-hand-point-up"></i><span>Top messages</span></a>
                </li>
                <#if user??>
                    <li>
                        <a href="/user-messages/${currentUserId}" class="iq-waves-effect"><i
                                    class="las la-user"></i><span>Profile</span></a>
                    </li>
                    <li>
                        <a href="/user/subscribers/${currentUserId}/list" class="iq-waves-effect"><i
                                    class="las la-user-friends"></i><span>Friend Lists</span></a>
                    </li>
                    <li>
                        <a href="/user/list" class="iq-waves-effect"><i
                                    class="las la-search"></i><span>Find users</span></a>
                    </li>
                </#if>

                <#if user??>
                <!-- Yandex.Metrika informer -->
                <a href="https://metrika.yandex.ru/stat/?id=81020854&amp;from=informer"
                   target="_blank" rel="nofollow"><img
                            src="https://informer.yandex.ru/informer/81020854/3_0_1E2745FF_1E2745FF_1_pageviews"
                            style="width: 61px;height:31px;border: 0;margin-top: 387px;" alt="Яндекс.Метрика"
                            title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)"
                            class="ym-advanced-informer" data-cid="81020854" data-lang="ru"/></a>
                <!-- /Yandex.Metrika informer -->
                <#else>
                    <!-- Yandex.Metrika informer -->
                    <a href="https://metrika.yandex.ru/stat/?id=81020854&amp;from=informer"
                       target="_blank" rel="nofollow"><img
                                src="https://informer.yandex.ru/informer/81020854/3_0_1E2745FF_1E2745FF_1_pageviews"
                                style="width: 61px;height:31px;border: 0;margin-top: 590px;" alt="Яндекс.Метрика"
                                title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)"
                                class="ym-advanced-informer" data-cid="81020854" data-lang="ru"/></a>
                    <!-- /Yandex.Metrika informer -->
                </#if>
            </ul>
        </nav>
        <div class="p-3"></div>
    </div>
</div>