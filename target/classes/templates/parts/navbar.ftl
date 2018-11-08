<#include "security.ftl">
<#import "login.ftl" as lg>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <!-- Свёрнутый вид -->
    <a class="navbar-brand" href="#">Sweater</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Развёрнутый вид Описание меню-->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="#">Главная</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/main">Сообщения</a>
            </li>
            <!-- Проверка доступности -->
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user">Список пользователей</a>
            </li>
            </#if>
        </ul>
        <!-- mr-3 отступ справа в 3 единицы-->
        <div class="navbar-text mr-3">${name}</div>
        <@lg.logout />

    </div>
</nav>