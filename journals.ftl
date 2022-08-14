<#include "header.ftl">
<@layout title="日志 - ${blog_title!}">
<div id="main">
<main>
    <div class="wrap min">
        <section class="board">
            <div class="post-title">
    <h2>日志</h2>
    </div>
    <article class="post-content">
    <div class="jr-main">
    <#list journals.content as journal>
    <a class="item">
            <div class="jr-line"></div>
            <div class="jr-dot jr-pt"></div> 
            <div class="jr-box">
                <div class="jr-cbox">
                    <div>
                        <div class="date">${journal.createTime?string('yyyy-MM-dd')}</div> 
                        <div class="title">${journal.content!}</div> 
                    </div>
                </div>
            </div>
    </a>
        </#list>
    </div>
    </article>
    </section>
    </div>
</main>
</div>
</@layout>
<#include "footer.ftl">
<@footer />

