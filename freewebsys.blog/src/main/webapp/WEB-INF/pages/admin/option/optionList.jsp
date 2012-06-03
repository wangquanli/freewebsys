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
<title>Option表单页面</title>
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
							配置管理&nbsp;&nbsp;
							<!-- <a href="${ctx}/admin/addOption.do"
								class="button-secondary action">新建</a> -->
						</h2>
						<ul class="subsubsub"></ul>
						<!-- <div class="tablenav top">
							<div class="alignleft actions">
								<select name="action">
								<option value="-1" selected="selected">批量操作</option>
									<option value="trash">删除</option>
								</select>
								<input type="submit" name="" id="doaction" class="button-secondary action" value="应用">
							</div>
							<br class="clear">
						</div> -->

						<form id="posts-filter" action="${ctx}/admin/saveOption.do" method="POST">

							<table class="widefat" cellspacing="0">
								<thead>
									<tr>
										<th class="column-title" style="width: 20%;"><span>配置名称&nbsp;</span></th>
										<th class="column-title" style="width: 80%;"><span>配置值&nbsp;</span></th>
									</tr>
								</thead>

								<tbody id="the-list">
									<c:forEach items="${optionList}" var="option">
										<tr valign="top" onmouseover="this.className='dataGrid_tr_bgcolor'" onmouseout="this.className=''">
											<td class="column-title"><strong>${option.cnName}</strong></td>
											<td class="column-title">${option.html}</td>
										</tr>
									</c:forEach>
									<tr valign="top">
										<td class="first"></td>
										<td>
											<div class="alignleft actions">
												<input type="submit" name="" id="doaction" 
												class="button-secondary action" value="保存">
											</div>
										</td>
									</tr>
								</tbody>
							</table>

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