<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="form-group offset-md-3">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control mr-2 mt-3" value="${filter?ifExists}" placeholder="Search by tag" />
            <button type="submit" class="btn btn-primary mt-3">Search</button>
        </form>
    </div>
</div>

<#include "parts/messageEdit.ftl" />

<#include "parts/messageList.ftl" />

</@c.page>
