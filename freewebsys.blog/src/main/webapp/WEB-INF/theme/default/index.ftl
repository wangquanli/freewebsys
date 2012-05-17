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
	
	<!--page tablib-->
	<div id="pageNavId" class="pageNav" style="text-align: right;margin-bottom: 30px;">
		<a href="/blog/index_2.html" class="pageNum">上一页</a>  
		<a href="/blog/index_1.html" class="pageNum">1</a>  
		<a href="/blog/index_2.html" class="pageNum">2</a>  
		<span class="cPageNum">3</span>  
		<a href="/blog/index_4.html" class="pageNum">4</a>  
		<a href="/blog/index_5.html" class="pageNum">5</a>  
		<a href="/blog/index_6.html" class="pageNum">6</a>  
		<a href="/blog/index_7.html" class="pageNum">7</a>  
		<a href="/blog/index_8.html" class="pageNum">8</a>  
		<a href="/blog/index_9.html" class="pageNum">9</a> ... 
		<a href="/blog/index_33.html" class="pageNum">33</a>  
		<a href="/blog/index_4.html" class="pageNum">下一页</a> 
	</div>
			
			</div><!-- #content -->
		</div><!-- #primary -->

		<!-- 右侧展示. -->
		<div id="secondary" class="widget-area">
		</div>

	</div>
	<!-- #main End -->
	
	<div id="pageNavId" class="pageNav">
		<a href="/blog/index_2.html" class="pageNum">上一页</a>  
		<a href="/blog/index_1.html" class="pageNum">1</a>  
		<a href="/blog/index_2.html" class="pageNum">2</a>  
		<span class="cPageNum">3</span>  
		<a href="/blog/index_4.html" class="pageNum">4</a>  
		<a href="/blog/index_5.html" class="pageNum">5</a>  
		<a href="/blog/index_6.html" class="pageNum">6</a>  
		<a href="/blog/index_7.html" class="pageNum">7</a>  
		<a href="/blog/index_8.html" class="pageNum">8</a>  
		<a href="/blog/index_9.html" class="pageNum">9</a> ... 
		<a href="/blog/index_33.html" class="pageNum">33</a>  
		<a href="/blog/index_4.html" class="pageNum">下一页</a> 
	</div>

	<#include "foot.ftl" encoding="UTF-8"> 
	
</div><!-- #page End -->
</body></html>