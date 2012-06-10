<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title><#if options??><#if options.blogName??>${options.blogName}</#if></#if>－${post.title}</title>
<#include "meta.ftl" encoding="UTF-8"> 
<script>
window.onload = (function(){
	//alert(window.location.href);
	var href = window.location.href;
	//判断是否是开发环境
	var isLocal = href.indexOf("localhost") > 0;
	var type = "";
	//取到type类型.
	if(href.split("?type=").length == 2){
		type = href.split("?type=")[1];
		href = href.split("?")[0];
		try{console.log("type:"+type);}catch(err){};
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
			try{//jetty和tomcat不同.
				try{console.log("data:"+data);}catch(err){};
				var obj = isLocal?eval('('+data+')'):data;
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
			}catch(e){try{console.log("catchError:"+e);}catch(err){};}
		}
	});
});
</script>
<!--评论校验.formValidator 校验..-->
<script src="/common/js/formValidator/formValidator_min.js" type="text/javascript"></script>
<script src="/common/js/formValidator/formValidatorRegex.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="/common/css/formValidator/validator.css"></link>
<script type="text/javascript">
<!--
$(document).ready(function() {
	$.formValidator.initConfig({
		onerror : function() {
			return false;
		},
		onsuccess : function() {
			//按照form进行提交.
			$.ajax({//提交表单.
				  url: "/web/saveComment.do",
				  type:"POST",
				  data: ({
					  	authorName : $("#comment_authorName_id").val(),
					  	authorEmail : $("#comment_authorEmail_id").val(),
					  	authorUrl : $("#comment_authorUrl_id").val(),
					  	postId : $("#comment_postId_id").val(),
					  	content:$("#comment_content_id").val()
					  }),
				  success: function(text){
				    	if(text == 'ok'){
				    		//重新发布内容.
				    		$("#comment_content_id").val('');
				    		alert("评论成功。");
				    		//更新分页.
				    		updateCommentPage("last");
				    	}
				  }
			});
		}
	});
	$("#comment_authorName_id").formValidator({onshow:" ",onfocus:"请输入1-20个字符",oncorrect:"输入正确"})
	.inputValidator({min:1,onerror:"该项不能为空"})
	.inputValidator({max:20,onerror:"最多输入20个字符"});
	$("#comment_content_id").formValidator({onshow:" ",onfocus:"请输入1-300个字符",oncorrect:"输入正确"})
	.inputValidator({min:1,onerror:"该项不能为空"})
	.inputValidator({max:300,onerror:"最多输入300个字符"});
	//帮定校验事件
	$('#comment_form_submit_id').click(function() {
		jQuery.formValidator.pageIsValid();
	});
	
	
	//ajax get next and prev url.
	pageNav.pageNavId="article_comment_page";
	pageNav.pre="上一页";
	pageNav.next="下一页";
	//更新评论div。
	pageNav.fn = updateCommentDiv;
	//更新分页.
	updateCommentPage("first");
	
});
//更新分页.
function updateCommentPage(type){
	var ajax_url = "article_${post.id}/comment_count.json";
	$.ajax({
		url: ajax_url,
		success: function(data){
			try{//获得评论数量.
				var num = new Number(data);
				//设置评论数量.
				$("#comment_count").html(data);
				if(type == "last"){
					pageNav.go(Math.ceil(num/20),Math.ceil(num/20));
				}else{
					pageNav.go(1,Math.ceil(num/20));
				}
			}catch(e){try{console.log("catchError:"+e);}catch(err){};}
		}
	});
}
//更新用户评论div。显示评论html碎片。
function updateCommentDiv(page){
	var ajax_url = "article_${post.id}/comment_list_"+page+".html";
	$.ajax({
		url: ajax_url,
		success: function(data){
			try{//jetty和tomcat不同.
				//optional set alert(data);
				$("#commentlist").html(data);
			}catch(e){try{console.log("catchError:"+e);}catch(err){};}
		}
	});
}
//-->
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

<!-- 分享代码开始... -->
<div style="margin-bottom: 30px;margin-top: 30px;">
<!-- JiaThis Button BEGIN -->
<div id="jiathis_style_32x32">
<a class="jiathis_button_qzone"></a>
<a class="jiathis_button_tsina"></a>
<a class="jiathis_button_tqq"></a>
<a class="jiathis_button_renren"></a>
<a class="jiathis_button_kaixin001"></a>
<a class="jiathis_button_tsohu"></a>
<a class="jiathis_button_t163"></a>
<a class="jiathis_button_douban"></a>
<a class="jiathis_button_fav"></a>
<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank"></a>
<a class="jiathis_counter_style"></a>
</div>
<script type="text/javascript" >
var jiathis_config={
	summary:"",
	hideMore:false
}
</script>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
</div>
<!-- 分享代码结束... -->

<div style="margin-bottom: 30px;margin-top: 30px;">
	<h3 id="reply-title">&nbsp;</h3>
	<h3 id="reply-title" style="margin-bottom: 20px;">用户评论(<span id="comment_count">0</span>条)</h3>
	<ol  id="commentlist" class="commentlist" style="width: 100%;">
	</ol>
	<div id="article_comment_page"></div>
</div>

<!--评论表单-->
<div style="margin-bottom: 50px;">
	<div>
		<h3 id="reply-title">发表评论</h3>
		<form id="comment_form_id" action="#" method="post">
			<div>用户昵称：<span style="color: red;">*必须填写</span></div>
			<div>
				<input id="comment_authorName_id" style="width:300px;" type="text" value="">
				<div id="comment_authorName_idTip"></div>
			</div>
			<div>用户Email(不会在系统中显示)：</div>
			<div>
				<input id="comment_authorEmail_id" style="width:300px;" type="text" value="">
			</div>
			<div>用户Url：</div>
			<div>
				<input id="comment_authorUrl_id" style="width:300px;" type="text" value="">
			</div>
			<div>
			内容：<span style="color: red;">*必须填写</span>
			</div>
			<div>
				<textarea id="comment_content_id" style="width: 550px; height: 200px;"></textarea>
				<div id="comment_content_idTip"></div>
			</div>
			<div>
				<input id="comment_form_submit_id" type="button" value="发表评论">
				<input id="comment_postId_id" type="hidden" value="${post.id}">
			</div>
		</form>
	</div>
</div>

			</div>
			<!-- #content -->
		</div>
		<!-- #primary -->

	</div>
	<!-- #main End -->

	<#include "foot.ftl" encoding="UTF-8"> 
	
</div><!-- #page End -->
</body></html>