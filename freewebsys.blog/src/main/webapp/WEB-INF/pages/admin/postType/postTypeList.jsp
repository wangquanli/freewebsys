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
<title>分类列表页面</title>
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
							分类列表&nbsp;&nbsp;<a href="${ctx}/admin/addPostType.do"
								class="button-secondary action">新建</a>
						</h2>

						<ul class="subsubsub"></ul>
						
						<div class="tablenav top">
							<div class="alignleft actions">
								<select name="action">
								<option value="-1" selected="selected">批量操作</option>
									<option value="trash">删除</option>
								</select>
								<input type="submit" name="" id="doaction" class="button-secondary action" value="应用">
							</div>
							<br class="clear">
						</div>

						<form id="posts-filter" action="" method="get">

							<table class="widefat" cellspacing="0">
								<thead>
									<tr>
										<th><input type="checkbox" id="root_check_id" onclick="commonCheckAll();"></th>
										<th class="column-title" style=""><span>分类名&nbsp;</span></th>
										<th class="column-title" style=""><span>父节点&nbsp;</span></th>
										<th class="column-title" style=""><span>操作</span></th>
									</tr>
								</thead>

								<tbody id="the-list">
									<c:forEach items="${postTypeList}" var="postType">
										<tr valign="top" onmouseover="this.className='dataGrid_tr_bgcolor'" onmouseout="this.className=''">
											<th><input type="checkbox" name="check_id" value="${postType.id}"></th>
											<td class="column-title"><strong>${postType.name}</strong></td>
											<td class="column-title"><strong>${postType.parentId}</strong></td>
											<td class="column-title">
												<span class="edit"><a href="${ctx}/admin/addPostType.do?id=${postType.id}">编辑</a> | </span>
												<span class="edit"><a href="${ctx}/admin/deletePostType.do?id=${postType.id}">删除</a></span>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

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