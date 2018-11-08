<#import "parts/common.ftl" as common>
<#import "parts/login.ftl" as lg>

<@common.page>
<div class="mb-1">Add new user</div>
${message?ifExists}
<@lg.login "/registration" true/>

</@common.page>