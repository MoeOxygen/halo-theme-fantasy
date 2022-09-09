<#include "header.ftl">
<@layout title="分类列表 - ${blog_title!}">
<main>
    <div class="wrap min">
        <section class="board head">
    <h3>分类列表</h3>
    </section>
    <section class="board">
        <@categoryTag method="list">
            <#if categories?? && categories?size gt 0>
                <#list categories as category>
            <div class="post-item">
                    <h3 class="title"><a href="${category.fullPath!}">${category.name!}</a></h3>
                    </div>
                </#list>
            </#if>
        </@categoryTag>
        </section>
        </div>
 </main>
</@layout>
<#include "footer.ftl">
<@footer />
