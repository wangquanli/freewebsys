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
				document.getElementById('link_form_id').submit();
			}
		});

		
		$("#link_url_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#link_name_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#link_target_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#link_description_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#link_visible_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#link_orderId_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		
		//帮定校验事件
		$('#link_form_submit_id').click(function() {
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
					<form:form id="link_form_id" modelAttribute="linkAttribute" method="POST"
						action="${ctx}/admin/saveLink.do">
						<form:hidden path="id" />
						<div class="wrap">
							<h2>
								友情链接表单&nbsp;&nbsp;<a href="${ctx}/admin/listLink.do"
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
													<td class="first"> 链接:</td>
													<td><form:input id="link_url_id"
															path="url" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="link_url_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">名称:</td>
													<td><form:input id="link_name_id"
															path="name" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="link_name_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">打开方式:</td>
													<td><form:input id="link_target_id"
															path="target" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="link_target_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">描述:</td>
													<td><form:input id="link_description_id"
															path="description" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="link_description_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">展示:</td>
													<td><form:input id="link_visible_id"
															path="visible" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="link_visible_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">排序号:</td>
													<td><form:input id="link_orderId_id"
															path="orderId" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="link_orderId_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first"></td>
													<td style="height: 36px;"><a href="#"
														id="link_form_submit_id"
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