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
        <span class="comments">${sheet.commentCount!} 评论</span>
        </@commentTag>
    </div>
    </div>
    <article class="post-content">
        ${sheet.formatContent!}
    </article>
    </section>
    
    <#include "module/comment.ftl">
    <@comment post=sheet type="sheet" />

    <#if (metas.toc?boolean)!true>
    <div class="toc">
    </div>
    </#if>
    </div>

<#if settings.toc_bool!false>
    <script src="https://6.cdn.moea.top/js/tocbot@4.12.0/tocbot.min.js"></script>
    <script data-pjax>
      var tocset = {
        tocSelector: ".toc",
        contentSelector: ".post-content",
        headingSelector: "h1,h2,h3,h4,h5,h6",
        scrollSmooth: true,
        headingsOffset: 15,
      };
      tocbot.init(tocset);
    </script>
</#if>

</main>
</@layout>
<#include "footer.ftl">
<@footer />

