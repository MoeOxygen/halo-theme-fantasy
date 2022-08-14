var that = this;
var element = {
    footer: {
        action: ks.select(".foot-action"),
        top: ks.select(".to-top"),
    },
    date: ks.select(".foot-date"),
};
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
			var bgminfoo = "<div class='col-6 col-m-4' id='bangumi-info'><a class='bangumi-item' target='_blank' href='https://bgm.tv/subject/"+json[i].subject_id+"'><div class='bangumi-img' style='background-image: url("+json[i].subject.images.large+")'><div class='bangumi-status'><div class='bangumi-status-bar' style='width: "+json[i].ep_status / json[i].subject.eps * 100+"%'></div><p>进度: "+json[i].ep_status+" / "+json[i].subject.eps+"</p></div></div><h3>"+json[i].subject.name+"</h3></a></div>";
				$("#bangumi-info").append(bgminfoo);
			}
		},
		error: function(){
			var bgminfoo = "<div class='col-12'><p>追番数据获取失败，请检查如下细节：</p><ul><li>用户 ID 是否正确？</li><li>该用户是否在“在看”添加了番剧？</li><li>服务器能否正常连接 <code>api.bgm.tv</code> ？</li></ul></div>";
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
			var bgminfoo = "<div class='col-6 col-m-4' id='bangumi-info'><a class='bangumi-item' target='_blank' href='https://bgm.tv/subject/"+json[i].subject_id+"'><div class='bangumi-img' style='background-image: url("+json[i].subject.images.large+")'><div class='bangumi-status'><div class='bangumi-status-bar' style='width: "+json[i].ep_status / json[i].subject.eps * 100+"%'></div><p>进度: "+json[i].ep_status+" / "+json[i].subject.eps+"</p></div></div><h3>"+json[i].subject.name+"</h3></a></div>";
				$("#bangumi-info").append(bgminfoo);
			}
		},
		error: function(){
			var bgminfoo = "<div class='col-12'><p>追番数据获取失败，请检查如下细节：</p><ul><li>用户 ID 是否正确？</li><li>该用户是否在“在看”添加了番剧？</li><li>服务器能否正常连接 <code>api.bgm.tv</code> ？</li></ul></div>";
		}
	});
}();
    };

function loadstart(){
    var loadrain = document.querySelector("#main");
    loadrain.classList.add("loading");
};

function loadend(){
    var loadrain = document.querySelector("#main");
    loadrain.classList.remove("loading");
};

//Pjax:send
document.addEventListener("pjax:send", function () {
    loadstart();
});

//Pjax:complete
$(document).on('pjax:complete', function() { 
    loadend();
	loadbangumi();
	ks.image(".post-content:not(.exclude-image) img");
});

this.to_top = function () {
    element.footer.top.onclick = function () {
        window.scrollTo(0, 0);
    };

    window.addEventListener("scroll", function () {
        var scroll = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
        scroll >= window.innerHeight ? element.footer.top.classList.add("active") : element.footer.top.classList.remove("active");
    });
};
this.to_top();

//Picture
ks.image(".post-content:not(.exclude-image) img");

//time
this.foot_date = function (date) {
    function run_date(date){
        var created = Date.parse(date);
        var now = new Date().getTime();
        var ran = now - created;

        var day = ran / 86400000;
        var day_c = Math.floor(day);

        var hour = 24 * (day - day_c);
        var hour_c = Math.floor(hour);

        var min = 60 * (hour - hour_c);
        var min_c = Math.floor(min);

        var sec = Math.floor(60 * (min - min_c));

        return "站点已萌萌哒存活了 <a>" + day_c + "</a> 天 <a>" + hour_c + "</a> 小时 <a>" + min_c + "</a> 分 <a>" + sec + "</a> 秒";
    }

    setInterval(function () {
        element.date.innerHTML = run_date(date);
    }, 1000);
};

if(element.date && rain.created){
    this.foot_date(rain.created);
}

//Copyright
if (window.console && window.console.log) {
    console.log("%c Fantasy主题 %c https://12th.icu/fantasy ","color: #fff; margin: 1em 0; padding: 5px 0; background: #ffa9be;","margin: 1em 0; padding: 5px 0; background: #efefef;");
}