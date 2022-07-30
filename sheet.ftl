<#include "header.ftl">
<@layout title="${sheet.title!} - ${blog_title!}">
<main>
    <div class="wrap min">
        <section class="board">
            <div class="post-title">
    <h2>${sheet.title!}</h2>
    <div class="post-meta">
        <time class="date">${post.createTime?string('yyyy-MM-dd')}</time>
        <@commentTag method="count">
        <span class="comments">${count!0} 评论</span>
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
</@layout>

<#include "footer.ftl">
<@footer />

