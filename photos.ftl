<#include "header.ftl">
<@layout title="图库 - ${blog_title!}">
<main>
<section class="card-pho post-content">

<@photoTag method="list">
<#list photos as photo>
<figure>
    <img src="${photo.url}" alt="${photo.description}">
    <figcaption>
        <h2>${photo.name!}</h2>
        <p>
            <a href="${photo.url}"><i class="fa fa-download"></i></a>
        </p>
    </figcaption>
</figure>
</#list>
</@photoTag>
</section>
</main>
</@layout>
<#include "footer.ftl">
<@footer />

