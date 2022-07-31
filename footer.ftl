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
                                <li>${archive.year?c}-${archive.month?c}</li>   
                            </#list>
                        </@postTag>
                    </ul>
                </div>
                <div class="col-m-3">
                  <h3>最近评论：</h3>
                    <@commentTag method="latest" top="5">
                        <ul class="clear">
                            <#list comments.content as comment>
                                <li>${comment.author!}：${comment.content!}</li>
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
                    <#if settings.icp_info??  && settings.icp_info != ""><#--ICP备案号-->
                        <p><a href="https://beian.miit.gov.cn" rel="nofollow" target="_blank">${settings.icp_info}</a></p>
                    </#if>
                    <#if settings.ga_info??  && settings.ga_info != ""><#--公安备案号-->
                        <p>
				            <a href="https://www.beian.gov.cn/portal/registerSystemInfo?recordcode=${settings.ga_info!}" rel="nofollow" target="_blank">
					        <img src="${theme_base!}/source/images/beian.png">${settings.ga_info}
				            </a>
                        </p>
				    </#if>
                    <#--随机一言,to do-->
                    <p class="foot-hitokoto">重要的是无论我们选择哪条路，都要担负起选择的责任。</p>
                </div>
                <div class="col-m-6 right bottom to-center"><!--请保留版权, 该主题移植自奇趣保罗的 Typecho 主题: Fantasy-->
                    <p>&copy; ${.now?string("yyyy")} <a href="${blog_url!}">${blog_title!}</a> 版权所有</p>
                    <p>Powered by <a href="https://halo.run" target="_blank" rel="nofollow">Halo</a> | Theme by <a href="https://12th.icu/fantasy" target="_blank" rel="nofollow">Fantasy</a></p>
                </div>
            </div>
        </section>
    </div>
</footer>
<script src="https://6.cdn.moea.top/js/jquery@3.6.0/jquery.min.js"></script>
<#if is_index??>
<script>
    window.onload=function(){
	$.ajax({
		type: "GET",
		url: "https://api.bgm.tv/v0/users/${settings.bangumi_user!}/collections",
		dataType: "json",
		success: function(result){
			let json=result.data;
			for(i=0;i<json.length;i++){
			var trTD = "<div class='col-6 col-m-4' id='bangumi-info'><a class='bangumi-item' target='_blank' href='https://bgm.tv/subject/"+json[i].subject_id+"'><div class='bangumi-img' style='background-image: url("+json[i].subject.images.large+")'><div class='bangumi-status'><div class='bangumi-status-bar' style='width: "+json[i].ep_status+"%'></div><p>进度: "+json[i].ep_status+" / "+json[i].subject.eps+"</p></div></div><h3>"+json[i].subject.name+"</h3></a></div>";
				$("#bangumi-info").append(trTD);
			}
		},
		error: function(){
			var trTD = "<div class='col-12'><p>追番数据获取失败，请检查如下细节：</p><ul><li>用户 ID 是否正确？</li><li>该用户是否在“在看”添加了番剧？</li><li>服务器能否正常连接 <code>api.bgm.tv</code> ？</li></ul></div>";
		}
	});
}();
</script>
</#if>
<script src="${theme_base!}/source/js/rain.js"></script>
<script src="${theme_base!}/source/js/kico.js"></script>

</body>
</html>
</#macro>