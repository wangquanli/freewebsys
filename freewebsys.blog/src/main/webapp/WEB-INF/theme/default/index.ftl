<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>test</title>
<link type="text/css" rel="stylesheet" href="/blog/css/style.css"></link>
<#include "meta.ftl" encoding="UTF-8">
</head>
<body class="" style="background: #E2E2E2;">
<div id="page" class="hfeed">

	<#include "head.ftl" encoding="UTF-8"> 

	<!-- #main Begin -->
	<div id="main">
		<div id="primary">
			<div id="content">
	
	<@PostList limit=20 >
	<!-- #post-${status.index} Begin -->				
	<article id="post-11" class="format-gallery hentry">
		<header class="entry-header">
		<hgroup>
			<h2 class="entry-title">
			<a href="${post.url}" rel="bookmark">${post.title}</a></h2>
		</hgroup>

		<div class="entry-meta">
			<span class="sep">发表于 </span>
			<time class="entry-date" datetime="${DateParse(post.createDate,'yyyy-MM-dd HH:mm:ss')}">${DateParse(post.createDate)}</time>
			<span class="by-author"><span class="sep">由</span>
			<span class="author vcard">admin</span></span>
		</div><!-- meta -->
		
		</header><!-- header -->

		<div class="entry-content">
			<p>${post.title}</p>
		</div><!-- content -->
	
		<footer class="entry-meta">
			<span class="cat-links">
			<span class="entry-utility-prep entry-utility-prep-cat-links">发表在</span>
			<a href="#">未定义</a>
			</span>
			<span class="sep">|</span>
			<span class="comments-link">
			<a href="#"><b>1</b>条回复</a>
			</span>
		</footer><!-- #entry-meta -->
	</article>
	<!-- #post-${status.index} End -->
	</@PostList>

			
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