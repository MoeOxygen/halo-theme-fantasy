<#include "header.ftl">
<@layout title="404 - ${blog_title!}">
<main>
    <div class="wrap min">
        <section class="board error-page">
			<div class="post-title">
    <h2>404</h2>
				<p>你正在寻找的文章已经不见了，不妨看看其他文章？</p>
            </div>
			<ul class="archives-list">
            <@postTag method="latest" top="3">
    <#list posts as post>
    <li class="archive-post"><a class="archive-post-title" href="${post.fullPath!}">${post.title!}</a></a><span class="date">${post.createTime?string('yyyy-MM-dd')}</span></li>
    </#list>
</@postTag>
            </ul>
        </section>
    </div>
</main>
</@layout>
<#include "footer.ftl">
<@footer />
