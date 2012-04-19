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
							UserInfo列表&nbsp;&nbsp;<a href="${ctx}/admin/addUserInfo.do"
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
							
							<table class="widefat" cellspacing="0">
								<thead>
									<tr>
										<th><input type="checkbox" id="root_check_id" onclick="commonCheckAll();"></th>
										<th class="column-title" style=""><span>登陆名&nbsp;</span></th>
										<th class="column-title" style=""><span>密码&nbsp;</span></th>
										<th class="column-title" style=""><span>显示名&nbsp;</span></th>
										<th class="column-title" style=""><span>email&nbsp;</span></th>
										<th class="column-title" style=""><span>url&nbsp;</span></th>
										<th class="column-title" style=""><span>注册时间&nbsp;</span></th>
										<th class="column-title" style=""><span>状态&nbsp;</span></th>
										<th class="column-title" style=""><span>操作</span></th>
									</tr>
								</thead>

								<tbody id="the-list">
									<c:forEach items="${pageConf.data}" var="userInfo">
										<tr valign="top" onmouseover="this.className='dataGrid_tr_bgcolor'" onmouseout="this.className=''">
											<th><input type="checkbox" name="check_id" value="${userInfo.id}"></th>
											<td class="column-title"><strong>${userInfo.loginName}</strong></td>
											<td class="column-title"><strong>${userInfo.passwd}</strong></td>
											<td class="column-title"><strong>${userInfo.displayName}</strong></td>
											<td class="column-title"><strong>${userInfo.email}</strong></td>
											<td class="column-title"><strong>${userInfo.url}</strong></td>
											<td class="column-title"><strong>${userInfo.regTime}</strong></td>
											<td class="column-title"><strong>${userInfo.status}</strong></td>
											<td class="column-title">
												<span class="edit"><a href="${ctx}/admin/addUserInfo.do?id=${userInfo.id}">编辑</a> | </span>
												<span class="edit"><a href="${ctx}/admin/deleteUserInfo.do?id=${userInfo.id}">删除</a></span>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<div class="tablenav bottom">
								<common:page limit="${pageConf.limit}" total="${pageConf.total}"
									action="/admin/listUserInfo.do" start="${pageConf.start}" />

								<br class="clear">
							</div>
							<!--底部 分页结束 -->

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