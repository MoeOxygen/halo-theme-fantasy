<#include "header.ftl">
<@layout title="${post.title!} - ${blog_title!}">
<main>
    <div class="wrap min">
        <section class="board">
            <div class="post-title">
                <h2>${post.title!}</h2>
            <div class="post-meta">
                <time class="date">${post.createTime?string('yyyy-MM-dd')}</time>
                <@categoryTag method="listByPostId" postId="${post.id?c}">
                <#list categories as category>
                <span class="category"><a href="${category.fullPath!}">${category.name!}</a></span>
                </#list>
                </@categoryTag>
                <span class="comments">${post.commentCount!} 评论</span>
            </div>
            </div>
    <article class="post-content">
        ${post.formatContent!}
    </article>
    </section>
    
<#include "module/comment.ftl">
<@comment post=post type="post" />

    <#if (metas.toc?boolean)!true>
    <div class="toc"></div>
    </#if>
    </div>
</main>
</@layout>
<#include "footer.ftl">
<@footer />
