<#import "parts/common.ftl" as common>
<@common.page>

Редактирование пользователя
<form action="/user" method="post">
    <!-- Ключ для защиты от меж сайтовой подделки запроса -->
    <input type="hidden" name="_csrf" value="${_csrf.token}" />

    <input type="text" name="UserId" value="${user.id}"/>
    <input type="text" name="UserName" value="${user.username}" />
    <#list roles as role>
    <div>
        <label>
            <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked","")}>${role}
        </label>
    </div>
    </#list>
    <button type="submit">Save</button>
</form>

</@common.page>