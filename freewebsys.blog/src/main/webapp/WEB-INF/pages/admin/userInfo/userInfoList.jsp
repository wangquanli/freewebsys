<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

				<div id="wpbody-content">
					<div class="wrap">
						<h2>
							文章 <a href="" class="button-secondary action">写文章</a>
						</h2>


						<ul class="subsubsub">
							<li class="all"><a
								href="http://127.0.0.1/wp-admin/edit.php?post_type=post"
								class="current">全部 <span class="count">(1)</span></a> |</li>
							<li class="publish"><a
								href="http://127.0.0.1/wp-admin/edit.php?post_status=publish&post_type=post">已发布
									<span class="count">(1)</span>
							</a></li>
						</ul>
						<form id="posts-filter" action="" method="get">

							<p class="search-box">
								<label class="screen-reader-text" for="post-search-input">搜索文章:</label>
								<input type="text" id="post-search-input" name="s" value=""><input
									type="submit" name="" id="search-submit" class="button"
									value="搜索文章">
							</p>

							<table class="wp-list-table widefat fixed posts" cellspacing="0">
								<thead>
									<tr>
										<th id="cb"
											class="manage-column column-cb check-column" style=""><input
											type="checkbox"></th>
										<th class="manage-column column-title sortable desc" style=""><a
											href="http://127.0.0.1/wp-admin/edit.php?orderby=title&order=asc"><span>标题</span><span
												class="sorting-indicator"></span></a></th>
										<th id="author"
											class="manage-column column-author sortable desc" style=""><a
											href="http://127.0.0.1/wp-admin/edit.php?orderby=author&order=asc"><span>作者</span><span
												class="sorting-indicator"></span></a></th>
										<th id="categories"
											class="manage-column column-categories" style="">分类目录</th>
										<th id="tags" class="manage-column column-tags"
											style="">标签</th>
										<th id="comments"
											class="manage-column column-comments num sortable desc"
											style=""><a
											href="http://127.0.0.1/wp-admin/edit.php?orderby=comment_count&order=asc"><span><span
													class="vers"><img alt="评论"
														src="./文章 ‹ freewebsys — WordPress_files/comment-grey-bubble.png"></span></span><span
												class="sorting-indicator"></span></a></th>
										<th id="date"
											class="manage-column column-date sortable asc" style=""><a
											href="http://127.0.0.1/wp-admin/edit.php?orderby=date&order=desc"><span>日期</span><span
												class="sorting-indicator"></span></a></th>
									</tr>
								</thead>


								<tbody id="the-list">
									<tr id="post-1"
										class="post-1 post type-post status-publish format-gallery hentry category-aa category-test category-uncategorized alternate iedit author-self"
										valign="top">
										<th scope="row" class="check-column"><input
											type="checkbox" name="post[]" value="1"></th>
										<td class="post-title page-title column-title"><strong><a
												class="row-title"
												href="http://127.0.0.1/wp-admin/post.php?post=1&action=edit"
												title="编辑“世界，你好！”">世界，你好！</a> - <span
												class="post-state-format">相册</span></strong>
											<div class="row-actions">
												<span class="edit"><a
													href="http://127.0.0.1/wp-admin/post.php?post=1&action=edit"
													title="编辑此项目">编辑</a> | </span><span class="inline hide-if-no-js"><a
													href="http://127.0.0.1/wp-admin/edit.php#"
													class="editinline" title="实时编辑此项目">快速编辑</a> | </span><span
													class="trash"><a class="submitdelete"
													title="移动此项目到回收站"
													href="http://127.0.0.1/wp-admin/post.php?post=1&action=trash&_wpnonce=a451252f23">移至回收站</a>
													| </span><span class="view"><a href="http://127.0.0.1/?p=1"
													title="查看“世界，你好！”" rel="permalink">查看</a></span>
											</div>
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
												<div class="post_password"></div>
												<div class="post_category" id="category_1">4,3,1</div>
												<div class="tags_input" id="post_tag_1"></div>
												<div class="sticky"></div>
												<div class="post_format">gallery</div>
											</div></td>
										<td class="author column-author"><a
											href="http://127.0.0.1/wp-admin/edit.php?post_type=post&author=1">admin</a></td>
										<td class="categories column-categories"><a
											href="http://127.0.0.1/wp-admin/edit.php?post_type=post&category_name=aa">aa</a>,
											<a
											href="http://127.0.0.1/wp-admin/edit.php?post_type=post&category_name=test">test</a>,
											<a
											href="http://127.0.0.1/wp-admin/edit.php?post_type=post&category_name=uncategorized">未分类</a></td>
										<td class="tags column-tags">无标签</td>
										<td class="comments column-comments"><div
												class="post-com-count-wrapper">
												<a href="http://127.0.0.1/wp-admin/edit-comments.php?p=1"
													title="0 待审中" class="post-com-count"><span
													class="comment-count">1</span></a>
											</div></td>
										<td class="date column-date"><abbr
											title="2012 年 4 月 14 日上午 2:20:25">2012-04-14</abbr><br>已发布</td>
									</tr>
								</tbody>
							</table>


							<div class="tablenav bottom">
								<common:page limit="${pageConf.limit}" total="${pageConf.total}"
									action="" start="${pageConf.start}" />

								<br class="clear">
							</div>
							<!--底部 分页结束 -->

						</form>

						<br class="clear">
					</div>

					<!-- 中部 Mian 结束-->

					<div class="clear"></div>
				</div>
				<!-- wpbody-content -->
				<div class="clear"></div>
			</div>
			<!-- wpbody -->
			<div class="clear"></div>
		</div>
		<!-- wpcontent -->


		<%@include file="/common/admin/footer.jsp"%>


		<div class="clear"></div>
	</div>
	<!-- wpwrap -->
</body>
</html>