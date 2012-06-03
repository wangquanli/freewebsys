<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>${post.title}</title>
<#include "meta.ftl" encoding="UTF-8"> 
<script>
window.onload = (function(){
	//alert(window.location.href);
	var href = window.location.href;
	var type = "";
	//取到type类型.
	if(href.split("?type=").length == 2){
		type = href.split("?type=")[1];
		href = href.split("?")[0];
	}
	//得到文章id.
	href = href.split("article")[1].replace(".html","");
	var ajax_url = "${blogPath}"+type+"/json/article"+href+".json";
	//ajax get next and prev url.
	var html_a = "<a href='";
	var html_a_prev = "' rel='prev'>← 上一篇</a>";
	var html_a_next = "' rel='next'>下一篇 →</a>";
	$.ajax({
		url: ajax_url,
		success: function(data){
			try{
				var obj = eval('('+data+')');
				//alert(obj.prevUrl);alert(obj.nextUrl);
				//日志
				if(obj.prevUrl){
					try{console.log("prevUrl:"+obj.prevUrl);}catch(err){};
					$("#nav-prev-url-id").html(html_a+obj.prevUrl+html_a_prev);
				}
				if(obj.nextUrl){
					try{console.log("nextUrl:"+obj.nextUrl);}catch(err){}
					$("#nav-next-url-id").html(html_a+obj.nextUrl+html_a_next);
				}
			}catch(e){}
		}
	});
});
</script>
</head>
<body class="" style="background: #E2E2E2;">
<div id="page" class="single single-post singular">

	<#include "head.ftl" encoding="UTF-8"> 

	<!-- #main Begin -->
	<div id="main">
		<div id="primary">
			<div id="content" role="main">
				<nav id="nav-single">
					<h3 class="assistive-text">文章导航</h3>
					<span class="nav-previous" id="nav-prev-url-id"></span>
					<span class="nav-next" id="nav-next-url-id"></span>
				</nav>
				<!-- #nav-single -->
				<article
					class="hentry category-uncategorized">
					<header class="entry-header">
						<h1 class="entry-title">${post.title}</h1>
						<div class="entry-meta">
							<a href="#">
								<#if post.userInfo??><#if post.userInfo.displayName??>${post.userInfo.displayName}</#if></#if>
							</a><span class="sep">发表于</span>
							<a href="#" rel="bookmark">
							<time class="entry-date">${DateParse(post.createDate,'yyyy-MM-dd HH:mm:ss')}</time>
							</a>
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