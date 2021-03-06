<#import "parts/common.ftl" as common>
<@common.page>
Список пользователей
<table>
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Roles</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
    <tr>
        <td>${user.id}</td>
        <td>${user.username}</td>
        <td>
            <#list user.roles as role>
            ${role}<#sep>,
        </#list>
        </td>
        <td><a href="/user/${user.id}">Edit</a></td>
    </tr>
    </#list>
    </tbody>
</table>
</@common.page>