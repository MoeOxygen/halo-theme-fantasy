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
