<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title><#if options??><#if options.blogName??>${options.blogName}</#if></#if></title>
<#include "meta.ftl" encoding="UTF-8">
<script>
window.onload = (function(){
	//optional set
	pageNav.pageNavId="pageNavId";
	pageNav.pre="上一页";
	pageNav.next="下一页";
	pageNav.url="${blogPath}${typePath}/index_{index}.html";
	pageNav.fn = function(p,pn){
	};
	pageNav.go(${currentPage},${allPage});
});
</script>
</head>
<body class="" style="background: #E2E2E2;">
<div id="page" class="hfeed">

	<#include "head.ftl" encoding="UTF-8"> 

	<!-- #main Begin -->
	<div id="main">
		<div id="primary">
			<div id="content">
	
	<#list postList as post>
	<!-- #post Begin -->				
	<article id="post-11" class="format-gallery hentry">
		<header class="entry-header">
		<hgroup>
			<h2 class="entry-title">
			
			<!--如果是'',显示首页url不带参数-->
			<#if typePath == ''>
				<a href="${post.url}" rel="bookmark">${post.title}</a></h2>
			</#if>
			<!--显示分类页带参数.-->
			<#if typePath != ''>
				<a href="${post.url}?type=${typePath}" rel="bookmark">${post.title}</a></h2>
			</#if>
			
		</hgroup>

		<div class="entry-meta">
			<span class="author vcard">
				<a href="#">
				<#if post.userInfo??><#if post.userInfo.displayName??>${post.userInfo.displayName}</#if></#if>
				</a>
			</span>
			<span class="sep">发表于 </span>
				<a href="#">
				<time class="entry-date">${DateParse(post.createDate,'yyyy-MM-dd HH:mm:ss')}</time>
				</a>
			</span>
		</div><!-- meta -->
		
		</header><!-- header -->

		<div class="entry-content" style="height: 500px;overflow-y: hidden;margin-bottom: 30px;">
			<p>${post.content}</p>
		</div><!-- content -->
	
		<footer class="entry-meta">
			<span class="cat-links">
			<span class="entry-utility-prep entry-utility-prep-cat-links">发表在</span>
			<a href="${blogPath}/type/${post.postTypeId}/index_1.html"><#if post.postType??><#if post.postType.name??>${post.postType.name}</#if></#if></a>
			</span>
			<span class="sep">|</span>
			<span class="comments-link">
			<a href="#"><b>1</b>条回复</a>
			</span>
		</footer><!-- #entry-meta -->
	</article>
	<!-- #post- End -->
	</#list>
	
	<!--page tablib-->
	<div id="pageNavId" class="pageNav" style="text-align: right;margin-bottom: 30px;"></div>
			
			</div><!-- #content -->
		</div><!-- #primary -->

		<!-- 右侧展示. -->
		<div id="secondary" class="widget-area">
		</div>

	</div>
	<!-- #main End -->
	<#include "foot.ftl" encoding="UTF-8"> 
	
</div><!-- #page End -->
</body></html>