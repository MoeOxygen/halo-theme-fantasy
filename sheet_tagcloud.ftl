<#include "header.ftl">
<@layout title="${sheet.title!} - ${blog_title!}">
<main>
<div class="wrap min">
<section class="board">
    <div class="tagcloud">
    <@tagTag method="list">
    <ul>
    <#list tags as tag>
    <li><a href="${tag.fullPath!}" style="--tagsize: ${tag.postCount!};" tagcount="${tag.postCount!}">${tag.name!}</a></li>
    </#list>
    </ul>
    </@tagTag>
    </div>
</section>
</div>
</main>
</@layout>
<#include "footer.ftl">
<@footer />
