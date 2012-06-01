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
				document.getElementById('post_form_id').submit();
			}
		});

		$("#post_title_id").formValidator({onshow:" ",onfocus:"请输入1-100个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:200,onerror:"最多输入15个字"});
		$("#post_content_id").formValidator({onshow:" ",onfocus:"请输入1-3000个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:6000,onerror:"最多输入2000个字"});
		$("#post_status_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#post_commentStatus_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		/* $("#post_postType_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"});
		$("#post_postMimeType_id").formValidator({onshow:" ",onfocus:"请输入1-15个字",oncorrect:"输入正确"})
		.inputValidator({min:1,onerror:"该项不能为空"})
		.inputValidator({max:30,onerror:"最多输入15个字"}); */
		
		//帮定校验事件
		$('#post_form_submit_id').click(function() {
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
					<form:form id="post_form_id" modelAttribute="postAttribute" method="POST"
						action="${ctx}/admin/savePost.do">
						<form:hidden path="id" />
						<form:hidden path="url" />
						<form:hidden path="authorId" />
						<form:hidden path="createDate" />
						<form:hidden path="modifiedDate" />
						<form:hidden path="commentCount" />
						<div class="wrap">
							<h2>
								文章表单&nbsp;&nbsp;<a href="${ctx}/admin/listPost.do"
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
													<td class="first">标题:</td>
													<td><form:input id="post_title_id"
															path="title" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="post_title_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td colspan="3">
														<form:textarea id="post_content_id" path="content" 
														cssClass="xheditor-mfull {html5Upload:false,upImgUrl:'/admin/uploadFile.do',upFlashUrl:'/admin/uploadFile.do',upMediaUrl:'/admin/uploadFile.do'}"
														cssStyle="width:700px;height:400px;" />
														<span style="color: red;">*</span>
													</td>
												</tr>
												<tr valign="top">
													<td colspan="3">
														<div id="post_content_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">状态:</td>
													<td>
														<form:select id="post_status_id"
															path="status" style="width:300px;">
															<form:option value="">请选择</form:option>
															<form:option value="1">发布</form:option>
															<form:option value="0">不发布</form:option>
														</form:select>
														<span style="color: red;">*</span></td>
													<td>
														<div id="post_status_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">分类:</td>
													<td>
														<form:select id="post_postTypeId_id"
															path="postTypeId" style="width:300px;"
															items="${postTypeList}"
															itemLabel="name"
															itemValue="id"
															>
														</form:select>
														<span style="color: red;">*</span></td>
													<td>
														<div id="post_commentStatus_idTip"></div>
													</td>
												</tr>
												<tr valign="top">
													<td class="first">评论状态:</td>
													<td>
														<form:select id="post_commentStatus_id"
															path="commentStatus" style="width:300px;">
															<form:option value="">请选择</form:option>
															<form:option value="1">评论</form:option>
															<form:option value="0">不评论</form:option>
														</form:select>
														<span style="color: red;">*</span></td>
													<td>
														<div id="post_commentStatus_idTip"></div>
													</td>
												</tr>
												<%-- <tr valign="top">
													<td class="first">类型:</td>
													<td>
														<form:select id="post_postType_id"
															path="postType" style="width:300px;">
															<form:option value="">请选择</form:option>
															<form:option value="1">发布</form:option>
															<form:option value="0">不发布</form:option>
														</form:select>
														<span style="color: red;">*</span></td>
													<td>
														<div id="post_postType_idTip"></div>
													</td>
												</tr> --%>
												<%-- <tr valign="top">
													<td class="first">小类型:</td>
													<td>
													<form:input id="post_postMimeType_id"
															path="postMimeType" style="width:300px;" /><span
														style="color: red;">*</span></td>
													<td>
														<div id="post_postMimeType_idTip"></div>
													</td>
												</tr> --%>
												<tr valign="top">
													<td class="first"></td>
													<td style="height: 36px;"><a href="#"
														id="post_form_submit_id"
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