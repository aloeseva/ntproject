<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page "/" true false>
    <#if user??>
        <#include "parts/messageEdit.ftl" />
    </#if>
    <#include "parts/messageList.ftl" />
</@c.page>
