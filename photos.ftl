<#include "header.ftl">
<@layout title="图库 - ${blog_title!}">
<main>
<div class="wrap-photos">
<section class="card-grid">
    <@photoTag method="list">
    <#list photos as photo>
    <div class="photos-card">
    <div class="card-img" style="background-image: url(${photo.url})">
    </div>
    <div class="photos-info">
    <h3>${photo.name!}</h3>
    </div>
    </div>
    </#list>
</@photoTag>
</section>
</div>
</main>
</@layout>
<#include "footer.ftl">
<@footer />

