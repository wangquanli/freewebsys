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


				<div id="wpbody">

					<div id="wpbody-content">
						<div id="screen-meta" class="metabox-prefs">

							<div id="contextual-help-wrap" class="hidden">
								<div id="contextual-help-back"></div>
								<div id="contextual-help-columns">
									<div class="contextual-help-tabs">
										<ul>

											<li id="tab-link-overview" class="active"><a
												href="#tab-panel-overview"> 概述 </a></li>
										</ul>
									</div>

									<div class="contextual-help-sidebar">
										<p>
											<strong>更多信息：</strong>
										</p>
										<p>
											<a
												href="http://codex.wordpress.org/zh-cn:%E7%AE%A1%E7%90%86%E9%A1%B5%E9%9D%A2#.E8.AF.84.E8.AE.BA"
												target="_blank">关于评论的中文文档</a>
										</p>
										<p>
											<a href="http://cn.forums.wordpress.org" target="_blank">中文支持论坛</a>
										</p>
									</div>

									<div class="contextual-help-tabs-wrap">

										<div id="tab-panel-overview" class="active help-tab-content">
											<p>若有需要，您可以编辑一条评论中的任何内容，特别是当评论者打错字的时候，这一功能十分有用。</p>
											<p>您也可以使用状态栏来审核评论、修改发布时间。</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="screen-meta-links">
							<div id="contextual-help-link-wrap"
								class="hide-if-no-js screen-meta-toggle">
								<a href="#contextual-help-wrap" id="contextual-help-link"
									class="show-settings">帮助</a>
							</div>
						</div>

						<form name="post" action="comment.php" method="post" id="post">
							<input type="hidden" id="_wpnonce" name="_wpnonce"
								value="ef7eaa429e"><input type="hidden"
								name="_wp_http_referer"
								value="/wp-admin/comment.php?action=editcomment&amp;c=1">
							<div class="wrap">
								<div id="icon-edit-comments" class="icon32">
									<br>
								</div>
								<h2>编辑评论</h2>

								<div id="poststuff" class="metabox-holder has-right-sidebar">
									<input type="hidden" name="user_ID" value="1"> <input
										type="hidden" name="action" value="editedcomment"> <input
										type="hidden" name="comment_ID" value="1"> <input
										type="hidden" name="comment_post_ID" value="1">

									<div id="side-info-column" class="inner-sidebar">
										<div id="submitdiv" class="stuffbox">
											<h3>
												<span class="hndle">状态</span>
											</h3>
											<div class="inside">
												<div class="submitbox" id="submitcomment">



													<div id="major-publishing-actions">
														<div id="delete-action">
															<a class="submitdelete deletion"
																href="comment.php?action=trashcomment&amp;c=1&amp;_wp_original_http_referer=http%3A%2F%2F127.0.0.1%2Fwp-admin%2Fedit-comments.php&amp;_wpnonce=6a41146e5d">移至回收站</a>
														</div>

														<div class="clear"></div>


													</div>
												</div>
											</div>
										</div>
									</div>

									<div id="post-body">
										<div id="post-body-content">
											<div id="namediv" class="stuffbox">
												<h3>
													<label for="name">作者</label>
												</h3>
												<div class="inside">
													<table class="form-table editcomment">
														<tbody>
															<tr valign="top">
																<td class="first">名称：</td>
																<td><input type="text" name="newcomment_author"
																	size="30" value="WordPress 先生" tabindex="1" id="name"></td>
															</tr>
															<tr valign="top">
																<td class="first">电子邮件：</td>
																<td><input type="text"
																	name="newcomment_author_email" size="30" value=""
																	tabindex="2" id="email"></td>
															</tr>
															<tr valign="top">
																<td class="first">URL（<a
																	href="http://wordpress.org/" rel="external nofollow"
																	target="_blank">访问站点</a>）：
																</td>
																<td><input type="text" id="newcomment_author_url"
																	name="newcomment_author_url" size="30" class="code"
																	value="http://wordpress.org/" tabindex="3"></td>
															</tr>
															<tr valign="top">
																<td class="first"></td>
																<td><input type="submit" name="save" id="save" style="width:100px"
																	class="button-primary" value="更新" tabindex="4">
																</td>
															</tr>
														</tbody>
													</table>
													<br>
												</div>
											</div>


											<div id="normal-sortables" class="meta-box-sortables"></div>
											<input type="hidden" name="c" value="1"> <input
												type="hidden" name="p" value="1"> <input
												name="referredby" type="hidden" id="referredby"
												value="http://127.0.0.1/wp-admin/edit-comments.php">
											<input type="hidden" name="_wp_original_http_referer"
												value="http://127.0.0.1/wp-admin/edit-comments.php"><input
												type="hidden" name="noredir" value="1">

										</div>
									</div>
								</div>
							</div>
						</form>

						<div class="clear"></div>
					</div>
					<!-- wpbody-content -->
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