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
				document.getElementById('template_form_id').submit();
			}
		});

		
		$("#template_content_id").formValidator({onshow:" ",onfocus:"请输入",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"});
		
		//帮定校验事件
		$('#template_form_submit_id').click(function() {
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
					<form:form id="template_form_id" modelAttribute="templateAttribute" method="POST"
						action="${ctx}/admin/saveTemplate.do">
						<div class="wrap">
							<h2>
								模板表单&nbsp;&nbsp;<a href="${ctx}/admin/listTemplate.do"
									class="button-secondary action">返回</a>
							</h2>
							<div class="metabox-holder" style="width: 750px;">
								<div id="namediv" class="stuffbox">
									<h3>
										<label>&nbsp;</label>
									</h3>
									<div class="inside">
										<table class="form-table editcomment">
											<tbody>
												<tr valign="top">
													<td class="first">文件:</td>
													<td>
														<form:input path="name" style="width:300px;" readonly="readonly"/></td>
													<td>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">主题分类:</td>
													<td>
														<form:input path="path" style="width:300px;" readonly="readonly"/></td>
													<td>
													</td>
												</tr>
												<tr valign="top">
													<td colspan="3">
														<form:textarea id="template_content_id" path="content" 
														cssStyle="width:700px;height:500px;" />	
													</td>
												</tr>
												<tr valign="top">
													<td colspan="3">
														<div id="template_content_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first"></td>
													<td style="height: 36px;"><a href="#"
														id="template_form_submit_id"
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