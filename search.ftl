<#include "header.ftl">
<@layout title="含关键词 ${keyword!} 的文章 - ${blog_title!}">

<main>
    <div class="wrap min">
        <section class="board head">
            <h3>搜索结果：${keyword!}</h3>
            </section>
    <section class="board">
    <#list posts.content as post>
            <div class="post-item">
            <time class="date">${post.createTime?string('yyyy-MM-dd')}</time>
                <h3 class="title"><a href="${post.fullPath!}">${post.title!}</a></h3>
            </div>
        </#list>
    </section>
    </div>
</main>

<#if posts.totalPages gt 1>
            <section class="page-navigator">
                <@paginationTag method="search" page="${posts.number}" total="${posts.totalPages}" keyword="${keyword}" display="3">
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

</@layout>
<#include "footer.ftl">
<@footer />