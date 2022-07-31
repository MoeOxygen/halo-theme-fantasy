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
</main>

<script>
        window.onload=function(){
            $.ajax({
                type: "GET",
                url: "https://api.bgm.tv/v0/users/${settings.bangumi_user!}/collections",
                dataType: "json",
                success: function(result){
                    let json=result.data;
                    console.log(json);
                    for(i=0;i<json.length;i++){
                    var trTD = "<div class='col-6 col-m-4' id='bangumi-info'><a class='bangumi-item' target='_blank' href='https://bgm.tv/subject/"+json[i].subject_id+"'><div class='bangumi-img' style='background-image: url("+json[i].subject.images.large+")'><div class='bangumi-status'><div class='bangumi-status-bar' style='width: "+json[i].ep_status+"%'></div><p>进度: "+json[i].ep_status+" / "+json[i].subject.eps+"</p></div></div><h3>"+json[i].subject.name+"</h3></a></div>";
                        $("#bangumi-info").append(trTD);
                    }
                },
                error: function(){
                    var trTD = "加载失败";
                }
            });
        }();
    </script>
    <#include "module/comment.ftl">
    <@comment post=sheet type="sheet" />
</@layout>

<#include "footer.ftl">
<@footer />

