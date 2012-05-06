<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>test</title>
<link type="text/css" rel="stylesheet" href="/blog/css/style.css"></link>
<body class="" style="background: #E2E2E2;">
<div id="page" class="single single-post singular">

	<#include "head.ftl" encoding="UTF-8"> 

	<!-- #main Begin -->
	<div id="main">
		<div id="primary">
			<div id="content" role="main">
				<nav id="nav-single">
					<h3 class="assistive-text">文章导航</h3>
					<#if prevUrl?exists>
						<span class="nav-previous"><a href="${prevUrl}" rel="prev">← 上一篇</a></span>
					</#if>
					<#if nextUrl?exists>
					<span class="nav-next"><a href="${nextUrl}" rel="next">下一篇 →</a></span>
					</#if>
				</nav>
				<!-- #nav-single -->
				<article
					class="hentry category-uncategorized">
					<header class="entry-header">
						<h1 class="entry-title">${post.title}</h1>

						<div class="entry-meta">
							<a href="?author=1">admin</a><span class="sep">发表于 </span><a
								href="./test   test_files/test   test.html" title="11:53 下午"
								rel="bookmark"><time class="entry-date"
									datetime="2011-03-08T23:53:59+00:00" pubdate="">三月 8,
									2011</time></a><span class="by-author"> <span class="sep">
									由 </span> <span class="author vcard"><a class="url fn n"
									href="?author=1" title="查看所有由 admin 发布的文章" rel="author">admin</a></span></span>
						</div>
						<!-- .entry-meta -->
					</header>
					<!-- .entry-header -->

					<div class="entry-content">
						<p>${post.content}</p>
					</div>
					<!-- .entry-content -->
					<!-- .entry-meta -->
				</article>


			</div>
			<!-- #content -->
		</div>
		<!-- #primary -->

	</div>
	<!-- #main End -->

	<#include "foot.ftl" encoding="UTF-8"> 
	
</div><!-- #page End -->
</body></html>