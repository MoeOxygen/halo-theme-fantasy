<#include "header.ftl">
<@layout title="${sheet.title!} - ${blog_title!}">
<main>
    <div class="wrap min">
        <section class="board">
            <div class="post-title">
            <h2>${sheet.title!}</h2>
    </div>
    <article class="post-content exclude-img">
    <div class="row" id="bangumi-info">
    </div>
    </article>
    </section>
    </div>
</main>

    <#include "module/comment.ftl">
    <@comment post=sheet type="sheet" />
</@layout>

<#include "footer.ftl">
<@footer />

