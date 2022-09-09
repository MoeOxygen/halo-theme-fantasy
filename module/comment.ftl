<#macro comment post,type>
    <#if !post.disallowComment!false>
        <script src="//cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.min.js"></script>
        <script src="${options.comment_internal_plugin_js!'//6.cdn.moea.top/files/halo-theme-fantasy/js/halo-comment.min.js'}"></script>
        <section class="board">
        <halo-comment id="${post.id?c}" type="${type}"/>
        </section>
    </#if>
</#macro>