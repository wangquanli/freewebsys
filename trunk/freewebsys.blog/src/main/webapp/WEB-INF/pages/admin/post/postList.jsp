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
<title>文章表单页面</title>
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
							文章列表&nbsp;&nbsp;<a href="${ctx}/admin/addPost.do"
								class="button-secondary action">新建</a>
						</h2>

						<ul class="subsubsub"></ul>
						
						<!--<div class="tablenav top">
							<div class="alignleft actions">
								<select name="action">
								<option value="-1" selected="selected">批量操作</option>
									<option value="trash">删除</option>
								</select>
								<input type="submit" name="" id="doaction" class="button-secondary action" value="应用">
							</div>
							<br class="clear">
						</div> -->

						<form id="posts-filter" action="" method="get">

							<table class="widefat" cellspacing="0">
								<thead>
									<tr>
										<th><input type="checkbox" id="root_check_id" onclick="commonCheckAll();"></th>
										<th class="column-title" style=""><span>标题&nbsp;</span></th>
										<th class="column-title" style=""><span>创建时间&nbsp;</span></th>
										<th class="column-title" style=""><span>修改时间&nbsp;</span></th>
										<th class="column-title" style=""><span>发布&nbsp;</span></th>
										<th class="column-title" style=""><span>评论&nbsp;</span></th>
										<!-- <th class="column-title" style=""><span>类型&nbsp;</span></th>
										<th class="column-title" style=""><span>小类型&nbsp;</span></th>
										<th class="column-title" style=""><span>评论数量&nbsp;</span></th> -->
										<th class="column-title" style=""><span>操作</span></th>
									</tr>
								</thead>

								<tbody id="the-list">
									<c:forEach items="${pageConf.data}" var="post">
										<tr valign="top" onmouseover="this.className='dataGrid_tr_bgcolor'" onmouseout="this.className=''">
											<th style="width: 5%;"><input type="checkbox" name="check_id" value="${post.id}"></th>
											<td class="column-title" style="width: 35%;"><a target="_blank" href="${post.url}"><strong>${post.title}</strong></a></td>
											<td class="column-title" style="width: 15%;"><strong><common:dateParse date="${post.createDate}"/></strong></td>
											<td class="column-title" style="width: 15%;"><strong><common:dateParse date="${post.modifiedDate}"/></strong></td>
											<td class="column-title" style="width: 10%;"><strong>${post.status}</strong></td>
											<td class="column-title" style="width: 10%;"><strong>${post.commentStatus}</strong></td>
											<%-- <td class="column-title"><strong>${post.postType}</strong></td>
											<td class="column-title"><strong>${post.postMimeType}</strong></td>
											<td class="column-title"><strong>${post.commentCount}</strong></td> --%>
											<td class="column-title" style="width: 10%;">
												<span class="edit"><a href="${ctx}/admin/addPost.do?id=${post.id}">编辑</a> | </span>
												<span class="edit"><a href="${ctx}/admin/deletePost.do?id=${post.id}">删除</a></span>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<div class="tablenav bottom">
								<common:page limit="${pageConf.limit}" total="${pageConf.total}"
									action="/admin/listPost.do" start="${pageConf.start}" />

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