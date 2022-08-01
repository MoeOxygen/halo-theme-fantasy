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

var pjax = new Pjax({
	elements: "a:not([target=_blank])",
	selectors: [
           "title", "meta[name=keywords]", "meta[name=description]", "main"
        ],
	cacheBust: false,
	history: true,
    timeout: 3000
});

//
if (window.console && window.console.log) {
    console.log("%c Fantasy主题 %c https://12th.icu/fantasy ","color: #fff; margin: 1em 0; padding: 5px 0; background: #ffa9be;","margin: 1em 0; padding: 5px 0; background: #efefef;");
}