<#macro comment post,type>
    <#if !post.disallowComment!false>
        <script src="//cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.min.js"></script>
        <script src="${options.comment_internal_plugin_js!'//cdn.jsdelivr.net/gh/halo-dev/halo-comment@latest/dist/halo-comment.min.js'}"></script>
        <main>
        <div class="wrap min">
        <section class="board">
        <halo-comment id="${post.id?c}" type="${type}"/>
        </section>
        </div>
        </main>
    <#--
        <section class="board">
        <h3>参与讨论</h3>
        <div id="${post.id?c}">
        <form class="comment-form" id="${post.id?c}" action="#" id="comment-form" role="form">
        <figure class="comment-avatar">
        <img src="${user.avatar!}"/>
        <img src="${theme_base!}/source/images/avatar.jpg"/>
        </figure>
                    <fieldset>
                    <textarea rows="2" name="text" placeholder="说下感想吧！" required></textarea>
                        <input type="text" name="author" placeholder="昵称 *：" value="" required="">
                        <input type="email" name="mail" placeholder="电邮 *：" value="" required="">
                        <input type="url" name="url" placeholder="https://" value="" required="">
                        <button class="btn submit" type="submit"></button>
                    </fieldset>
                    </form>
                    </div>
                    </section> 
        -->
    </#if>
</#macro>