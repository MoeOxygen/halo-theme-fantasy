var that = this;
var element = {
  footer: { action: ks.select(".foot-action"),
  top: ks.select(".to-top") },
};

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
    "title",
    "meta[name=keywords]",
    "meta[name=description]",
    "main",
  ],
  cacheBust: false,
  history: true,
  timeout: 3000,
  scrollTo: 0,
});

document.addEventListener("pjax:send", function () {
  $(".nyancat").removeClass("nyancat-load");
});

$(document).on("pjax:complete", function () {
  $(".nyancat").addClass("nyancat-load");
  $("aside").removeClass("active");
  ks.image(".post-content:not(.exclude-image) img");
});

//Back to top
this.to_top = function () {
  element.footer.top.onclick = function () {
    window.scrollTo(0, 0);
  };
  window.addEventListener("scroll", function () {
    var scroll =
      window.pageYOffset ||
      document.documentElement.scrollTop ||
      document.body.scrollTop;
    scroll >= window.innerHeight
      ? element.footer.top.classList.add("active")
      : element.footer.top.classList.remove("active");
  });
};
this.to_top();

//Kico
ks.image(".post-content:not(.exclude-image) img");

if (window.console && window.console.log) {
  console.log(
    "%c Fantasy主题 %c https://12th.icu/fantasy ",
    "color: #fff; margin: 1em 0; padding: 5px 0; background: #ffa9be;",
    "margin: 1em 0; padding: 5px 0; background: #efefef;"
  );
}
