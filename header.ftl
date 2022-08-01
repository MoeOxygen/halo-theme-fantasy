<#--该主题移植自奇趣保罗的 Typecho 主题: Fantasy-->
<#macro layout title>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <title>${title}</title>
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1"/>
    <meta name="keywords" content="${meta_keywords!}"/>
    <meta name="description" content="${meta_description!}" />
    <link href="${theme_base!}/source/css/rain.css" rel="stylesheet" type="text/css"/>
    <link href="${theme_base!}/source/css/kico.css" rel="stylesheet" type="text/css"/>
    <link href="${theme_base!}/source/css/fantasy.css" rel="stylesheet" type="text/css"/>
    <link href="https://6.cdn.moea.top/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <#if settings.site_custom_style??  && settings.site_custom_style != "">
    <style>${settings.site_custom_style!}</style>
    </#if>
    <style>
    body {
        background: #f7f7f7 url("${settings.background_picture!}") repeat top center;
    }
    </style>
    <@global.head />
</head>
<body>
<@menuTag method="list">
<aside>
    <nav class="side-nav">
    <#list menus?sort_by('priority') as menu>
            <a href="${menu.url!}" target="${menu.target!}">${menu.name!} </a>
    </#list>
    </nav>
    <nav class="side-action">
        <div class="search-btn"></div>
    </nav>
    <div class="side-window">
        <div class="side-wrap">
            <form class="search-form" method="get" action="/search" role="search">
                <input type="text" name="keyword" placeholder="搜索什么?">
            </form>
            <div class="side-category color-bar">
            <@categoryTag method="list">
  <#list categories as category>
    <a href="${category.fullPath!}">${category.name!}</a>
  </#list>
</@categoryTag>
            </div>
        </div>
    </div>
</aside>
</@menuTag>
<header>
<div class="toggle"></div>
    <div class="wrap min">
    <h1 class="headline"><span>${blog_title!}</span></h1>
    <div class="head-social">
        <#if settings.social_github??  && settings.social_github != "">
            <a rel="nofollow" title="GitHub" href="${settings.social_github!}" target="_blank">
             <i class="fa fa-github"></i>
            </a>
		</#if>
        <#if settings.social_weibo??  && settings.social_weibo != "">
            <a rel="nofollow" title="Weibo" href="${settings.social_weibo!}" target="_blank">
             <i class="fa fa-weibo"></i>
            </a>
		</#if>
        <#if settings.social_twitter??  && settings.social_twitter != "">
            <a rel="nofollow" title="Twitter" href="${settings.social_twitter!}" target="_blank">
             <i class="fa fa-twitter"></i>
            </a>
		</#if>
        <#if settings.social_qq??  && settings.social_qq != "">
            <a rel="nofollow" title="QQ" href="https://wpa.qq.com/msgrd?v=3&uin=${settings.social_qq}&site=qq&menu=yes" target="_blank">
             <i class="fa fa-qq"></i>
            </a>
		</#if>
    </div>
</div>
</header>


<#nested >


<@global.footer />
</body>
</html>
</#macro>

