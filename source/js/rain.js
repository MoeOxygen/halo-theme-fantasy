//一言
$.get("https://v1.hitokoto.cn/",function(data,status){
	if (status == 'success'){
		$('.foot-hitokoto').text(data.hitokoto);
	}else{
		$('.foot-hitokoto').text('重要的是无论我们选择哪条路，都要担负起选择的责任。');
	}
});

//搜索
$(".search-btn").click(function () {
	if ($(".side-window").hasClass("active")) {
		$(".side-window").removeClass("active");
	}
	else {
		$(".side-window").addClass("active");
	}
});

//nav
$(".toggle").click(function () {
	if ($("aside").hasClass("active")) {
		$("aside").removeClass("active");
	}
	else {
		$("aside").addClass("active");
	}
});
//Pjax
var pjax = new Pjax({
	elements: "a:not([target=_blank])",
	selectors: [
           "title", "meta[name=keywords]", "meta[name=description]", "#main"
        ],
	cacheBust: false,
	history: true,
    timeout: 3000
});

//Bangumi
window.onload=function(){
	$.ajax({
		type: "GET",
		url: "https://api.bgm.tv/v0/users/"+ rain.bangumid +"/collections",
		dataType: "json",
		success: function(result){
			let json=result.data;
			for(i=0;i<json.length;i++){
			var trTD = "<div class='col-6 col-m-4' id='bangumi-info'><a class='bangumi-item' target='_blank' href='https://bgm.tv/subject/"+json[i].subject_id+"'><div class='bangumi-img' style='background-image: url("+json[i].subject.images.large+")'><div class='bangumi-status'><div class='bangumi-status-bar' style='width: "+json[i].ep_status / json[i].subject.eps * 100+"%'></div><p>进度: "+json[i].ep_status+" / "+json[i].subject.eps+"</p></div></div><h3>"+json[i].subject.name+"</h3></a></div>";
				$("#bangumi-info").append(trTD);
			}
		},
		error: function(){
			var trTD = "<div class='col-12'><p>追番数据获取失败，请检查如下细节：</p><ul><li>用户 ID 是否正确？</li><li>该用户是否在“在看”添加了番剧？</li><li>服务器能否正常连接 <code>api.bgm.tv</code> ？</li></ul></div>";
		}
	});
}();

//Function loadbangumi
function loadbangumi(){
    window.onload=function(){
	$.ajax({
		type: "GET",
		url: "https://api.bgm.tv/v0/users/"+ rain.bangumid +"/collections",
		dataType: "json",
		success: function(result){
			let json=result.data;
			for(i=0;i<json.length;i++){
			var trTD = "<div class='col-6 col-m-4' id='bangumi-info'><a class='bangumi-item' target='_blank' href='https://bgm.tv/subject/"+json[i].subject_id+"'><div class='bangumi-img' style='background-image: url("+json[i].subject.images.large+")'><div class='bangumi-status'><div class='bangumi-status-bar' style='width: "+json[i].ep_status / json[i].subject.eps * 100+"%'></div><p>进度: "+json[i].ep_status+" / "+json[i].subject.eps+"</p></div></div><h3>"+json[i].subject.name+"</h3></a></div>";
				$("#bangumi-info").append(trTD);
			}
		},
		error: function(){
			var trTD = "<div class='col-12'><p>追番数据获取失败，请检查如下细节：</p><ul><li>用户 ID 是否正确？</li><li>该用户是否在“在看”添加了番剧？</li><li>服务器能否正常连接 <code>api.bgm.tv</code> ？</li></ul></div>";
		}
	});
}();
    };

//Pjax:complete
$(document).on('pjax:complete', function() { 
	loadbangumi();
});


//Copyright
if (window.console && window.console.log) {
    console.log("%c Fantasy主题 %c https://12th.icu/fantasy ","color: #fff; margin: 1em 0; padding: 5px 0; background: #ffa9be;","margin: 1em 0; padding: 5px 0; background: #efefef;");
}