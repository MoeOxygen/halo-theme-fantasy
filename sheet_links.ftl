<#include "header.ftl">
<@layout title="${sheet.title!} - ${blog_title!}">
<main>
    <div class="wrap min">
    <section class="board">
    <div class="post-title">
    <h2>${sheet.title!}</h2>
    </div>
    <article class="post-content exclude-image exclude-tree">
    ${sheet.formatContent!}
    <div class="clearfix">
        <@linkTag method="list">
            <#if links?? && links?size gt 0>
                <#list links as link>
                    <a class="friends-link" href="${link.url!}" target="_blank" rel="external">
                    <img src="${link.logo!}" />
                    <h3 class="link-name">${link.name!}</h3>
                        <#if link.description!=''>
                            <p class="link-desc">${link.description!}</p>
                        </#if>
                    </a>
                </#list>
            </#if>
        </@linkTag>
        </div>
        </article>
    </section>
    <#include "module/comment.ftl">
    <@comment post=sheet type="sheet" />
    </div>
</main>
</@layout>
<#include "footer.ftl">
<@footer />
