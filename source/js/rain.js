var that = this;
var element = {
  footer: { action: ks.select(".foot-action"),
  top: ks.select(".to-top") },
  date: ks.select(".foot-date"),
};

$(".search-btn").click(function () {
  if ($(".side-window").hasClass("active")) {
    $(".side-window").removeClass("active");
  } else {
    $(".side-window").addClass("active");
  }
});

$(".toggle").click(function () {
  if ($("aside").hasClass("active")) {
    $("aside").removeClass("active");
  } else {
    $("aside").addClass("active");
  }
});

var pjax = new Pjax({
  elements: "a:not([target=_blank])",
  selectors: [
    "title",
    "meta[name=keywords]",
    "meta[name=description]",
    "meta[name=toc]",
    "main",
    "script[data-pjax]",
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

this.foot_date = function (date) {
  function run_date(date) {
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
    return (
      "站点已萌萌哒存活了 <a>" +
      day_c +
      "</a> 天 <a>" +
      hour_c +
      "</a> 小时 <a>" +
      min_c +
      "</a> 分 <a>" +
      sec +
      "</a> 秒"
    );
  }
  setInterval(function () {
    element.date.innerHTML = run_date(date);
  }, 800);
};
if (element.date && rain.created) {
  this.foot_date(rain.created);
}

if (window.console && window.console.log) {
  console.log(
    "%c Fantasy主题 %c https://12th.icu/fantasy ",
    "color: #fff; margin: 1em 0; padding: 5px 0; background: #ffa9be;",
    "margin: 1em 0; padding: 5px 0; background: #efefef;"
  );
}
