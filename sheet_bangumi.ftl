<#include "header.ftl">
<@layout title="${sheet.title!} - ${blog_title!}">
<main>
    <div class="wrap min">
        <section class="board">
            <div class="post-title">
            <h2>${sheet.title!}</h2>
    </div>
    <article class="post-content exclude-img">
    <div class="row" id="bangumi-info">
    </div>
    </article>
    </section>
    </div>

<script>
var rain = {
    "bangumid":"${settings.bangumi_user!}",
  };
window.onload = (function () {
    $.ajax({
      type: "GET",
      url: "https://api.bgm.tv/v0/users/" + rain.bangumid + "/collections",
      dataType: "json",
      success: function (result) {
        let json = result.data;
        for (i = 0; i < json.length; i++) {
          var bgminfoo =
            "<div class='col-6 col-m-4' id='bangumi-info'><a class='bangumi-item' target='_blank' href='https://bgm.tv/subject/" +
            json[i].subject_id +
            "'><div class='bangumi-img' style='background-image: url(" +
            json[i].subject.images.large +
            ")'><div class='bangumi-status'><div class='bangumi-status-bar' style='width: " +
            (json[i].ep_status / json[i].subject.eps) * 100 +
            "%'></div><p>进度: " +
            json[i].ep_status +
            " / " +
            json[i].subject.eps +
            "</p></div></div><h3>" +
            json[i].subject.name +
            "</h3></a></div>";
          $("#bangumi-info").append(bgminfoo);
        }
      },
      error: function () {
        var bgminfoo =
          "<div class='col-12'><p>追番数据获取失败，请检查如下细节：</p><ul><li>用户 ID 是否正确？</li><li>该用户是否在“在看”添加了番剧？</li><li>服务器能否正常连接 <code>api.bgm.tv</code> ？</li></ul></div>";
        $("#bangumi-info").append(bgminfoo);
      },
    });
  })();
</script>

</main>
</@layout>
<#include "footer.ftl">
<@footer />

