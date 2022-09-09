<#include "header.ftl">
<@layout title="标签列表 - ${blog_title!}">
<main>
    <div class="wrap min">
        <section class="board head">
    <h3>标签列表</h3>
    </section>
    <section class="board">
        <@tagTag method="list">
            <#if tags?? && tags?size gt 0>
                <#list tags as tag>
                    <div class="post-item">
                    <h3 class="title"><a href="${tag.fullPath!}">${tag.name!}</a></h3>
                    </div>
                </#list>
            </#if>
        </@tagTag>
    </section>
    </div>
</main>
</@layout>
<#include "footer.ftl">
<@footer />
