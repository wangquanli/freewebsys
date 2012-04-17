<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://com.freewebsys" prefix="common"%>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="zh-CN">
<head>
<%@include file="/common/admin/meta.jsp"%>
<title>UserInfo表单页面</title>
</head>
<body class="wp-admin admin-bar admin-color-fresh">
<div id="wpwrap">


<%@include file="/common/admin/menu.jsp"%>
<!-- 中部 Mian 开始-->
<div id="wpcontent">
	<div id="wpbody">
	<div id="wpbody-content" style="overflow-x: hidden; overflow-y: hidden; ">
	<div class="wrap">
	<h2>首页</h2>

	<div id="welcome-panel" class="welcome-panel">
	<div class="welcome-panel-content">
	<h3>欢迎访使用Freewebsys博客系统！</h3>
	<p class="about-description"></p>
	<div class="welcome-panel-column-container">
	<div class="welcome-panel-column">
		<h4><span class="icon16 icon-settings"></span>常用功能</h4>
		<ul>
		<li><a href="options-privacy">发布博客</a></li>
		</ul>
	</div>
	<!-- <div class="welcome-panel-column">
		<h4><span class="icon16 icon-page"></span> 码些字</h4>
		<p>看看示例页面和示例文章是怎么样的，然后删除它们，添上您自己的内容！</p>
		<ul>
		<li>查看<a href="?page_id=2">示例页面</a>和<a href="?p=1">示例文章</a></li>
		<li>删除<a href="edit?post_type=page">示例页面</a>和<a href="edit">示例文章</a></li>
		<li><a href="edit?post_type=page">创建一个“关于我”页面</a></li>
		<li><a href="post-new">撰写您的第一篇文章</a></li>
		</ul>
	</div>
	<div class="welcome-panel-column welcome-panel-last">
	<h4><span class="icon16 icon-appearance"></span> 自定义您的站点</h4>
	<p>使用当前的主题（Twenty Eleven）或<a href="themes">选个别的</a>。如果您就愿意使用 Twenty Eleven，您依然可以通过下面方法令您的站点与众不同。</p>			<ul>
						<li><a href="themes?page=theme_options">选择深/浅色系</a></li>
						<li><a href="themes?page=custom-background">设置背景颜色</a></li>
						<li><a href="themes?page=custom-header">挑选顶部图像</a></li>
						<li><a href="widgets">添加几个边栏小工具</a></li>
						</ul>
	</div> -->
	</div>
	</div>
	</div>
	
</div><!-- wrap -->


<div class="clear"></div></div><!-- wpbody-content -->
<div class="clear"></div></div>

<div class="clear"></div></div><!-- wpcontent -->


<%@include file="/common/admin/footer.jsp"%>

 
<div class="clear"></div></div><!-- wpwrap -->
</body></html>