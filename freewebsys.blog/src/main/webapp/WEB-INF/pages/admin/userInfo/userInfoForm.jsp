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
<script type="text/javascript">
<!--
	$(document).ready(function() {
		$.formValidator.initConfig({
			onerror : function() {
				return false;
			},
			onsuccess : function() {
				//校验成功准备提交
				if (!confirm('确定保存')) {
					return;
				}
				//按照form进行提交.
				document.getElementById('userInfo_form_id').submit();
			}
		});

		
		$("#userInfo_loginName_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#userInfo_passwd_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#userInfo_displayName_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#userInfo_email_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#userInfo_url_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#userInfo_regTime_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#userInfo_status_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		
		//帮定校验事件
		$('#userInfo_form_submit_id').click(function() {
			jQuery.formValidator.pageIsValid();
		});
	});
//-->
</script>
</head>
<body class="wp-admin admin-bar admin-color-fresh">
	<div id="wpwrap">

		<%@include file="/common/admin/menu.jsp"%>
		<!-- 中部 Mian 开始-->
		<div id="wpcontent">
			<div id="wpbody">
				<div id="wpbody-content">
					<form:form id="userInfo_form_id" modelAttribute="userInfoAttribute" method="POST"
						action="${ctx}/admin/saveUserInfo.do">
						<form:hidden path="id" />
						<div class="wrap">
							<h2>
								UserInfo表单&nbsp;&nbsp;<a href="${ctx}/admin/listUserInfo.do"
									class="button-secondary action">返回</a>
							</h2>
							<div class="metabox-holder" style="width: 600px;">
								<div id="namediv" class="stuffbox">
									<h3>
										<label>&nbsp;</label>
									</h3>
									<div class="inside">
										<table class="form-table editcomment">
											<tbody>
												<tr valign="top">
													<td class="first">登陆名:</td>
													<td><form:input id="userInfo_loginName_id"
															path="loginName" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="userInfo_loginName_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">密码:</td>
													<td><form:input id="userInfo_passwd_id"
															path="passwd" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="userInfo_passwd_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">显示名:</td>
													<td><form:input id="userInfo_displayName_id"
															path="displayName" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="userInfo_displayName_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">email:</td>
													<td><form:input id="userInfo_email_id"
															path="email" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="userInfo_email_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">url:</td>
													<td><form:input id="userInfo_url_id"
															path="url" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="userInfo_url_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">注册时间:</td>
													<td><form:input id="userInfo_regTime_id"
															path="regTime" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="userInfo_regTime_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">状态:</td>
													<td><form:input id="userInfo_status_id"
															path="status" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="userInfo_status_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first"></td>
													<td style="height: 36px;"><a href="#"
														id="userInfo_form_submit_id"
														class="button-secondary action">保存</a></td>
													<td></td>
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