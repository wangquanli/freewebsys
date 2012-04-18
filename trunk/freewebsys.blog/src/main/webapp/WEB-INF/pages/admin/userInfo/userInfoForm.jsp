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
					<form:form modelAttribute="userInfoAttribute" method="POST"
						action="${ctx}/admin/saveUserInfo.do">
						<form:hidden path="id" />
						<form:hidden path="passwd" />
						<form:hidden path="regTime" />
						<form:hidden path="status" />
						<div class="wrap">
							<h2>
								用户表单&nbsp;&nbsp;<a href="${ctx}/admin/listUserInfo.do"
									class="button-secondary action">返回</a>
							</h2>
							<div class="metabox-holder">
								<div id="namediv" class="stuffbox">
									<h3>
										<label>&nbsp;</label>
									</h3>
									<div class="inside">
										<table class="form-table editcomment">
											<tbody>
												<tr valign="top">
													<td class="first">登录名：</td>
													<td><form:input path="loginName" style="width:300px;" /><span
														style="color: red;">*</span></td>
												</tr>
												<tr valign="top">
													<td class="first">显示名称：</td>
													<td><form:input path="displayName"
															style="width:300px;" /><span style="color: red;">*</span></td>
												</tr>
												<tr valign="top">
													<td class="first">email：</td>
													<td><form:input path="email" style="width:300px;" /><span
														style="color: red;">*</span></td>
												</tr>
												<tr valign="top">
													<td class="first">url：</td>
													<td><form:input path="url" style="width:300px;" /><span
														style="color: red;">*</span></td>
												</tr>
												<tr valign="top">
													<td class="first"></td>
													<td><input type="submit" name="save" id="save"
														style="width: 100px" class="button-primary" value="更新"
														tabindex="4"></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</form:form>

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