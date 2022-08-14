<@menuTag method="list">
<aside>
    <nav class="side-nav">
    <#list menus?sort_by('priority') as menu>
            <a href="${menu.url}" target="${menu.target!}">${menu.name} </a>
    </#list>
    </nav>
    <#--搜索-->
    <nav class="side-action">
        <div class="search-btn"></div>
    </nav>
    <div class="side-window">
        <div class="side-wrap">
            <form class="search-form" method="post">
                <input type="text" name="s" placeholder="搜索什么?">
            </form>
        </div>
    </div>
</aside>
</@menuTag>