<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<div id="wpbody-content">
		


		<div class="wrap">
<div id="icon-edit" class="icon32 icon32-posts-post"><br></div><h2>文章 <a href="http://127.0.0.1/wp-admin/post-new.php" class="add-new-h2">写文章</a> </h2>


<ul class="subsubsub">
	<li class="all"><a href="http://127.0.0.1/wp-admin/edit.php?post_type=post" class="current">全部 <span class="count">(1)</span></a> |</li>
	<li class="publish"><a href="http://127.0.0.1/wp-admin/edit.php?post_status=publish&post_type=post">已发布 <span class="count">(1)</span></a></li>
</ul>
<form id="posts-filter" action="" method="get">

<p class="search-box">
	<label class="screen-reader-text" for="post-search-input">搜索文章:</label>
	<input type="text" id="post-search-input" name="s" value="">
	<input type="submit" name="" id="search-submit" class="button" value="搜索文章"></p>

<input type="hidden" name="post_status" class="post_status_page" value="all">
<input type="hidden" name="post_type" class="post_type_page" value="post">

<input type="hidden" id="_wpnonce" name="_wpnonce" value="a6e4ab79a6"><input type="hidden" name="_wp_http_referer" value="/wp-admin/edit.php">	<div class="tablenav top">

		<div class="alignleft actions">
			<select name="action">
<option value="-1" selected="selected">批量操作</option>
	<option value="edit" class="hide-if-no-js">编辑</option>
	<option value="trash">移至回收站</option>
</select>
<input type="submit" name="" id="doaction" class="button-secondary action" value="应用">
		</div>
		<div class="alignleft actions">
		<select name="m">
			<option selected="selected" value="0">显示所有日期</option>
<option value="201204">四月 2012</option>
		</select>
<select name="cat" id="cat" class="postform">
	<option value="0">查看所有分类目录</option>
	<option class="level-0" value="4">aa</option>
	<option class="level-0" value="3">test</option>
	<option class="level-0" value="1">未分类</option>
</select>
<input type="submit" name="" id="post-query-submit" class="button-secondary" value="筛选">		</div>
<div class="tablenav-pages one-page"><span class="displaying-num">1 个项目</span>
<span class="pagination-links"><a class="first-page disabled" title="前往第一页" href="./文章 ‹ freewebsys — WordPress_files/文章 ‹ freewebsys — WordPress.htm">«</a>
<a class="prev-page disabled" title="前往上一页" href="http://127.0.0.1/wp-admin/edit.php?paged=1">‹</a>
<span class="paging-input">第 <input class="current-page" title="当前页面" type="text" name="paged" value="1" size="1"> 页，共 <span class="total-pages">1</span> 页</span>
<a class="next-page disabled" title="前往下一页" href="http://127.0.0.1/wp-admin/edit.php?paged=1">›</a>
<a class="last-page disabled" title="前往最后一页" href="http://127.0.0.1/wp-admin/edit.php?paged=1">»</a></span></div>		<input type="hidden" name="mode" value="list">
		<div class="view-switch">
<a href="http://127.0.0.1/wp-admin/edit.php?mode=list" class="current"><img id="view-switch-list" src="./文章 ‹ freewebsys — WordPress_files/blank.gif" width="20" height="20" title="列表视图" alt="列表视图"></a>
<a href="http://127.0.0.1/wp-admin/edit.php?mode=excerpt"><img id="view-switch-excerpt" src="./文章 ‹ freewebsys — WordPress_files/blank.gif" width="20" height="20" title="摘要视图" alt="摘要视图"></a>
		</div>

		<br class="clear">
	</div>
<table class="wp-list-table widefat fixed posts" cellspacing="0">
	<thead>
	<tr>
		<th scope="col" id="cb" class="manage-column column-cb check-column" style=""><input type="checkbox"></th><th scope="col" id="title" class="manage-column column-title sortable desc" style=""><a href="http://127.0.0.1/wp-admin/edit.php?orderby=title&order=asc"><span>标题</span><span class="sorting-indicator"></span></a></th><th scope="col" id="author" class="manage-column column-author sortable desc" style=""><a href="http://127.0.0.1/wp-admin/edit.php?orderby=author&order=asc"><span>作者</span><span class="sorting-indicator"></span></a></th><th scope="col" id="categories" class="manage-column column-categories" style="">分类目录</th><th scope="col" id="tags" class="manage-column column-tags" style="">标签</th><th scope="col" id="comments" class="manage-column column-comments num sortable desc" style=""><a href="http://127.0.0.1/wp-admin/edit.php?orderby=comment_count&order=asc"><span><span class="vers"><img alt="评论" src="./文章 ‹ freewebsys — WordPress_files/comment-grey-bubble.png"></span></span><span class="sorting-indicator"></span></a></th><th scope="col" id="date" class="manage-column column-date sortable asc" style=""><a href="http://127.0.0.1/wp-admin/edit.php?orderby=date&order=desc"><span>日期</span><span class="sorting-indicator"></span></a></th>	</tr>
	</thead>

	<tfoot>
	<tr>
		<th scope="col" class="manage-column column-cb check-column" style=""><input type="checkbox"></th><th scope="col" class="manage-column column-title sortable desc" style=""><a href="http://127.0.0.1/wp-admin/edit.php?orderby=title&order=asc"><span>标题</span><span class="sorting-indicator"></span></a></th><th scope="col" class="manage-column column-author sortable desc" style=""><a href="http://127.0.0.1/wp-admin/edit.php?orderby=author&order=asc"><span>作者</span><span class="sorting-indicator"></span></a></th><th scope="col" class="manage-column column-categories" style="">分类目录</th><th scope="col" class="manage-column column-tags" style="">标签</th><th scope="col" class="manage-column column-comments num sortable desc" style=""><a href="http://127.0.0.1/wp-admin/edit.php?orderby=comment_count&order=asc"><span><span class="vers"><img alt="评论" src="./文章 ‹ freewebsys — WordPress_files/comment-grey-bubble.png"></span></span><span class="sorting-indicator"></span></a></th><th scope="col" class="manage-column column-date sortable asc" style=""><a href="http://127.0.0.1/wp-admin/edit.php?orderby=date&order=desc"><span>日期</span><span class="sorting-indicator"></span></a></th>	</tr>
	</tfoot>

	<tbody id="the-list">
				<tr id="post-1" class="post-1 post type-post status-publish format-gallery hentry category-aa category-test category-uncategorized alternate iedit author-self" valign="top">
				<th scope="row" class="check-column"><input type="checkbox" name="post[]" value="1"></th>
						<td class="post-title page-title column-title"><strong><a class="row-title" href="http://127.0.0.1/wp-admin/post.php?post=1&action=edit" title="编辑“世界，你好！”">世界，你好！</a> - <span class="post-state-format">相册</span></strong>
<div class="row-actions"><span class="edit"><a href="http://127.0.0.1/wp-admin/post.php?post=1&action=edit" title="编辑此项目">编辑</a> | </span><span class="inline hide-if-no-js"><a href="http://127.0.0.1/wp-admin/edit.php#" class="editinline" title="实时编辑此项目">快速编辑</a> | </span><span class="trash"><a class="submitdelete" title="移动此项目到回收站" href="http://127.0.0.1/wp-admin/post.php?post=1&action=trash&_wpnonce=a451252f23">移至回收站</a> | </span><span class="view"><a href="http://127.0.0.1/?p=1" title="查看“世界，你好！”" rel="permalink">查看</a></span></div>
<div class="hidden" id="inline_1">
	<div class="post_title">世界，你好！</div>
	<div class="post_name">hello-world</div>
	<div class="post_author">1</div>
	<div class="comment_status">open</div>
	<div class="ping_status">open</div>
	<div class="_status">publish</div>
	<div class="jj">14</div>
	<div class="mm">04</div>
	<div class="aa">2012</div>
	<div class="hh">02</div>
	<div class="mn">20</div>
	<div class="ss">25</div>
	<div class="post_password"></div><div class="post_category" id="category_1">4,3,1</div><div class="tags_input" id="post_tag_1"></div><div class="sticky"></div><div class="post_format">gallery</div></div></td>			<td class="author column-author"><a href="http://127.0.0.1/wp-admin/edit.php?post_type=post&author=1">admin</a></td>
						<td class="categories column-categories"><a href="http://127.0.0.1/wp-admin/edit.php?post_type=post&category_name=aa">aa</a>, <a href="http://127.0.0.1/wp-admin/edit.php?post_type=post&category_name=test">test</a>, <a href="http://127.0.0.1/wp-admin/edit.php?post_type=post&category_name=uncategorized">未分类</a></td>
						<td class="tags column-tags">无标签</td>
						<td class="comments column-comments"><div class="post-com-count-wrapper">
			<a href="http://127.0.0.1/wp-admin/edit-comments.php?p=1" title="0 待审中" class="post-com-count"><span class="comment-count">1</span></a>			</div></td>
			<td class="date column-date"><abbr title="2012 年 4 月 14 日上午 2:20:25">2012-04-14</abbr><br>已发布</td>		</tr>
		</tbody>
</table>


<div class="tablenav bottom">
	
	
<div class="tablenav-pages one-page"><span class="displaying-num">1 个项目</span>
<span class="pagination-links"><a class="first-page disabled" title="前往第一页" href="./文章 ‹ freewebsys — WordPress_files/文章 ‹ freewebsys — WordPress.htm">«</a>
<a class="prev-page disabled" title="前往上一页" href="http://127.0.0.1/wp-admin/edit.php?paged=1">‹</a>
<span class="paging-input">第 1 页，共 <span class="total-pages">1</span> 页</span>
<a class="next-page disabled" title="前往下一页" href="http://127.0.0.1/wp-admin/edit.php?paged=1">›</a>
<a class="last-page disabled" title="前往最后一页" href="http://127.0.0.1/wp-admin/edit.php?paged=1">»</a></span></div>
		<br class="clear">
	</div>
<!--底部 分页结束 -->

</form>

<br class="clear">
</div>

<!-- 中部 Mian 结束-->

<div class="clear"></div></div><!-- wpbody-content -->
<div class="clear"></div></div><!-- wpbody -->
<div class="clear"></div></div><!-- wpcontent -->


<%@include file="/common/admin/footer.jsp"%>

 
<div class="clear"></div></div><!-- wpwrap -->
</body></html>