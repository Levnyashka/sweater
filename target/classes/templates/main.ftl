<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <form method="get" action="/main" class="form-inline">
        <input type="text" name="filter" value="${filter?ifExists}" placeholder="Поиск">
        <button type="submit" class="btn btn-primary ml-2">Найти</button>
    </form>
</div>
<!-- Кнопка для развёртки -->
<a class="btn btn-primary" data-toggle="collapse" href="#AddMessage" role="button" aria-expanded="false" aria-controls="AddMessage">Добавить сообщение</a>
<div class="collapse" id="AddMessage">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <input class="form-control" type="text" name="text" placeholder="Введите сообщение" />
            </div>
            <div class="form-group">
                <input class="form-control" type="text" name="tag" placeholder="Тэг">
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customfile">
                    <label class="custom-file-label" for="customfile">Выберите файл</label>
                </div>
            </div>
            <button class="btn btn-primary" type="submit">Добавить</button>
        </form>
    </div>
</div>

<div class="card-columns">
    <#list messages as message>
    <div class="card my-3">
        <#if message.filename??>
        <img class="card-img-top" src="/img/${message.filename}" width="255" height="255">
    </#if>
    <div class="m-2">
        <span>${message.text}</span>
        <i>${message.tag}</i>
    </div>
    <div class="card-footer-text-muted">${message.authorName}</div>
    </div>
    <#else>
    No message
    </#list>
</div>
</@c.page>