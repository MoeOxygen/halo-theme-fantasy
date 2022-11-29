var that = this;
var element = {
  footer: { action: ks.select(".foot-action"), top: ks.select(".to-top") },
  date: ks.select(".foot-date"),
};
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

function loadstart() {
  var loadrain = document.querySelector("main");
  loadrain.classList.add("loading");
}

function loadend() {
  var loadrain = document.querySelector("main");
  loadrain.classList.remove("loading");
}

document.addEventListener("pjax:send", function () {
  loadstart();
});

$(document).on("pjax:complete", function () {
  loadend();
  loadbangumi();
  ks.image(".post-content:not(.exclude-image) img");
});

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

ks.image(".post-content:not(.exclude-image) img");

if (window.console && window.console.log) {
  console.log(
    "%c Fantasy主题 %c https://12th.icu/fantasy ",
    "color: #fff; margin: 1em 0; padding: 5px 0; background: #ffa9be;",
    "margin: 1em 0; padding: 5px 0; background: #efefef;"
  );
}
