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
				document.getElementById('comment_form_id').submit();
			}
		});

		
		$("#comment_postId_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#comment_authorEmail_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#comment_authorUrl_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#comment_authorIp_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#comment_createDate_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#comment_parentId_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#comment_userId_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		
		//帮定校验事件
		$('#comment_form_submit_id').click(function() {
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
					<form:form id="comment_form_id" modelAttribute="commentAttribute" method="POST"
						action="${ctx}/admin/saveComment.do">
						<form:hidden path="id" />
						<div class="wrap">
							<h2>
								Comment表单&nbsp;&nbsp;<a href="${ctx}/admin/listComment.do"
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
													<td class="first">文章Id:</td>
													<td><form:input id="comment_postId_id"
															path="postId" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="comment_postId_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">作者邮箱:</td>
													<td><form:input id="comment_authorEmail_id"
															path="authorEmail" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="comment_authorEmail_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">作者url:</td>
													<td><form:input id="comment_authorUrl_id"
															path="authorUrl" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="comment_authorUrl_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">作者ip:</td>
													<td><form:input id="comment_authorIp_id"
															path="authorIp" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="comment_authorIp_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">创建时间:</td>
													<td><form:input id="comment_createDate_id"
															path="createDate" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="comment_createDate_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">父节点:</td>
													<td><form:input id="comment_parentId_id"
															path="parentId" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="comment_parentId_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">用户Id:</td>
													<td><form:input id="comment_userId_id"
															path="userId" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="comment_userId_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first"></td>
													<td style="height: 36px;"><a href="#"
														id="comment_form_submit_id"
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