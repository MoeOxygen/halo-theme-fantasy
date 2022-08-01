<#include "header.ftl">
<@layout title="${sheet.title!} - ${blog_title!}">
<div id="main">
<main>
    <div class="wrap min">
        <section class="board">
            <div class="post-title">
    <h2>${sheet.title!}</h2>
    <div class="post-meta">
        <time class="date">${post.createTime?string('yyyy-MM-dd')}</time>
        <@commentTag method="count">
        <span class="comments">${sheet.commentCount!} 评论</span>
        </@commentTag>
    </div>
    </div>
    <article class="post-content">
        ${sheet.formatContent!}
    </article>
    </section>
    </div>
</main>
    <#include "module/comment.ftl">
    <@comment post=sheet type="sheet" />
</div>
</@layout>
<#include "footer.ftl">
<@footer />

