开源博客 参考 wordpress。样式也是。

使用的技术  Maven+hibernate+spring+freemarker+hibernate-search.

开发测试jetty,mysql,chrome,IE

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