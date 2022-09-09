<#macro footer>

<footer>
    <div class="wrap mid">
        <section class="foot-action">
            <div class="to-top"></div>
        </section>
        <section class="foot-widget">
            <div class="row">
                <div class="col-m-3">
                  <h3>最新文章：</h3>
                    <ul class="clear">
                        <@postTag method="latest" top="6">
                            <#list posts as post>
                                <li>
                                    <a href="${post.fullPath!}">${post.title!}</a>
                                </li>
                            </#list>
                        </@postTag>
                    </ul>
                </div>
                <div class="col-m-3">
                  <h3>时光机：</h3>
                    <ul class="clear">
                        <@postTag method="archiveMonth" top="6">
                            <#list archives as archive>
                                <li><a href="${archives_url!}#${archive.year?c}">${archive.year?c} 年 ${archive.month?c} 月</a></li>   
                            </#list>
                        </@postTag>
                    </ul>
                </div>
                <div class="col-m-3">
                  <h3>最近评论：</h3>
                    <@commentTag method="latest" top="6">
                        <ul class="clear">
                            <#list comments.content as comment>
                                <li><a href="${comment.post.fullPath!}#comment-${comment.id!}">${comment.author!}: ${comment.content!}</a></li>
                            </#list>
                        </ul>
                    </@commentTag>
                </div>
                <div class="col-m-3">
                    <h3>站点信息：</h3>
                    <ul class="clear">
                        <@postTag method="count"><li>文章：${count!0} 篇</li></@postTag>
                        <@categoryTag method="count"><li>分类：${count!0} 个</li></@categoryTag>
                        <@commentTag method="count"><li>评论：${count!0} 条</li></@commentTag>
                        <@postTag method="latest" top="1"><#list posts as post><li>上次更新：${post.editTime?string('yy年MM月dd日')}</li></#list></@postTag>
                        <li>上次登录：${user.expireTime?string('yy年MM月dd日')}</li>
                    <ul>
                </div>
            </div>
        </section>
        <section class="foot-copyright">
            <div class="row">
                <div class="col-m-6 left bottom to-center">
                    <#if settings.icp_info??  && settings.icp_info != "">
                        <p><a href="https://beian.miit.gov.cn" rel="nofollow" target="_blank">${settings.icp_info!}</a></p>
                    </#if>
                    <#if settings.ga_info??  && settings.ga_info != "">
                        <p>
				            <a href="https://www.beian.gov.cn/portal/registerSystemInfo?recordcode=${settings.ga_info!}" rel="nofollow" target="_blank">
					        <img src="${theme_base!}/source/images/beian.png">${settings.ga_info!}
				            </a>
                        </p>
				    </#if>
                    <#if settings.hitokoto_bool!false>
                    <p id="foot-hitokoto">重要的是无论我们选择哪条路，都要担负起选择的责任。</p>
                    </#if>
                    <#if settings.created_time?? && settings.created_time != ''>
                    <p class="foot-date">站点已萌萌哒存活了 <a>0</a> 天 <a>0</a> 小时 <a>0</a> 分 <a>0</a> 秒</p>
                    </#if>
                </div>
                <div class="col-m-6 right bottom to-center"><!--请保留版权, 该主题移植自奇趣保罗的 Typecho 主题: Fantasy-->
                    <p>&copy; ${.now?string("yyyy")} <a href="${blog_url!}">${user.nickname!}</a> 版权所有</p>
                    <p>Powered by <a href="https://halo.run" target="_blank" rel="nofollow">Halo</a> | Theme by <a href="https://12th.icu/fantasy" target="_blank" rel="nofollow">Fantasy</a></p>
                </div>
            </div>
        </section>
    </div>
</footer>
<script src="https://6.cdn.moea.top/js/pjax@0.2.8/pjax.min.js"></script>
<script src="https://6.cdn.moea.top/js/jquery@3.6.0/jquery.min.js"></script>
<script>
    var rain = {
        "bangumid":"${settings.bangumi_user!}",
        "created":"${settings.created_time!}",
    };
</script>
<script src="${theme_base!}/source/js/kico.js"></script>
<script src="https://6.cdn.moea.top/js/highlight@11.6.0/highlight.min.js"></script>
<#if settings.toc_bool!false>
<script src="https://6.cdn.moea.top/js/tocbot@4.12.0/tocbot.min.js"></script>
</#if>
<script src="${theme_base!}/source/js/rain.js"></script>
<#if settings.hitokoto_bool!false>
<script src="https://v1.hitokoto.cn/?encode=js&select=%23foot-hitokoto" defer></script>
</#if>
<#if settings.aplayer_id?? && settings.aplayer_id != ''>
<script src="${theme_base!}/source/js/APlayer.min.js"></script>
<script src="${theme_base!}/source/js/Meting.min.js"></script>
<meting-js fixed="true" server="netease" type="playlist" id="${settings.aplayer_id!}"></meting-js>
</#if>

</body>
</html>
</#macro>