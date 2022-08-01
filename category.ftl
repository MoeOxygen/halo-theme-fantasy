<#include "header.ftl">
<@layout title="分类：${category.name!} - ${blog_title!}">
<div id="main">
<main>
    <div class="wrap min">
        <section class="board head">
            <h3>分类：${category.name!}</h3>
            </section>
            <section class="board">
        <#list posts.content as post>
        <div class="post-item">
        <time class="date">${post.createTime?string('yyyy-MM-dd')}</time>
                <h3 class="title"><a href="${post.fullPath}">${post.title!}</a></h3>
        </div>
        </#list>
        </section>
        </div>

    <#if posts.totalPages gt 1>
            <section class="page-navigator">
                <@paginationTag method="categoryPosts" slug="${category.slug!}" page="${posts.number}" total="${posts.totalPages}" display="3">
                    <#if pagination.hasPrev>
                        <span class="prev">
                            <a href="${pagination.prevPageFullPath!}"></a>
                        </span>
                    </#if>
                    <#list pagination.rainbowPages as number>
                        <#if number.isCurrent>
                            <span class="current">
                                <a href="${number.fullPath!}">${number.page!}</a>
                            </span>
                        <#else>
                            <span>
                                <a href="${number.fullPath!}">${number.page!}</a>
                            </span>
                        </#if>
                    </#list>
                    <#if pagination.hasNext>
                        <span class="next">
                            <a href="${pagination.nextPageFullPath!}"></a>
                        </span>
                    </#if>
                </@paginationTag>
            </section>
        </#if>
</main>
</div>
</@layout>
<#include "footer.ftl">
<@footer />
