开源博客 参考 wordpress。样式也是。

使用的技术  Maven+hibernate+spring+freemarker+hibernate-search.

开发测试jetty,mysql,chrome,IE

表单教研插件
http://www.yhuan.com/formvalidator/index.html

打包:

war:war -Dmaven.test.skip=true

启动jetty:

jetty:run -Dmaven.test.skip=true

设置 静态目录。



<div class='tablenav-pages'>
<span class='displaying-num'>168 条记录,共  9页</span>
<span class='pagination-links'>
<a class='prev-page disabled' href=''>?</a>
<a class='prev-page disabled' href=''>?</a>
<a class='prev-page ' href=''>1</a>
<a class='prev-page disabled' href=''>3</a>
<span class='paging-input'><input class='current-page' type='text' name='page_num' size='1' onchange="window.location.href=''+this.value;"></span>
<a class='prev-page ' href=''>6</a>
<a class='prev-page ' href=''>7</a>
<a class='prev-page' href=''>?</a>
<a class='prev-page' href=''>?</a></span>
</div>

分页增加跳转到某个页数的位置。


1,使用freemarker 生成静态的html文件。
分页按照多个文件表示
blog/index.html
blog/index_2.html
blog/index_3.html

文章和文章评论
blog/2012/05/01/article.html
blog/2012/05/01/article_1.html
blog/2012/05/01/article_2.html

按照 wordpress 的其他分类生成静态页面.
blog/author/index.html

网站可以设置静态化或动态查询。（用来调试样式的，一旦调试好了就可以生成页面了。）

hibernate search 负责进行搜索。

