<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/common/meta.jsp"%>
<title>UserInfo列表页面</title>
</head>
<body>
<table width="100%" class="dataGrid_table" style="border: 1px solid #AAD;background: #ffffff;" border="0" 
	cellpadding="0" cellspacing="1">
	<tr>
		<th>UserInfo列表页面 <div style="color:red;">${errorMsg}</div><div style="color:green;">${successMsg}</div></th>
	</tr>
	<tr><td>
		<table width="100%"  border="0" cellpadding="0" cellspacing="1">
			<tr>
				<td><div style="width: 200px;">
					<input name="Submit" type="button"
						class="button"
						onclick="javaScript:location.href='${ctx}/admin/addUserInfo.do';"
						value="增加"/>
				&nbsp;</div></td>
			</tr>
		</table>
	</td></tr>
	<tr><td>
		<table width="100%"  border="0" cellpadding="0" cellspacing="1">
			<tr>
				
				<th style="width: 80px;">登录名&nbsp;</th>
				<th style="width: 80px;">密码&nbsp;</th>
				<th style="width: 80px;">显示名称&nbsp;</th>
				<th style="width: 80px;">email&nbsp;</th>
				<th style="width: 80px;">url&nbsp;</th>
				<th style="width: 80px;">注册时间&nbsp;</th>
				<th style="width: 80px;">状态&nbsp;</th>
				<th style="width: 80px;">操作&nbsp;</th>
			</tr>
			<c:forEach items="${pageConf.data}" var="userInfo">
				<tr onmouseover="this.className='dataGrid_bgcolor'"
					onmouseout="this.className='dataGrid_bgcolor1'">
				
				<td>${userInfo.loginName}&nbsp;</td>
				<td>${userInfo.password}&nbsp;</td>
				<td>${userInfo.displayName}&nbsp;</td>
				<td>${userInfo.email}&nbsp;</td>
				<td>${userInfo.url}&nbsp;</td>
				<td>${userInfo.regTime}&nbsp;</td>
				<td>${userInfo.status}&nbsp;</td>
				<td>
					<a href="${ctx}/admin/addUserInfo.do?id=${userInfo.id}">
						修改</a>
				   	│<a href="javaScript:commonDeleteConfirm('${ctx}/admin/deleteUserInfo.do?id=${userInfo.id}');">
				    	删除</a>
				</td>
				</tr>
			</c:forEach>
		</table>
	</td></tr>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr class="font">
				<td align="left">
				[当前<span class="page_info">${pageConf.total == 0 ? 0 : pageConf.start + 1 }-${pageConf.end}</span>条/共<span class="page_info">${pageConf.total}</span>条记录]
				</td>
				<td align="right">
				<sns:pager url="/admin/listUserInfo.do?" curPage="${start}" totalCount="${pageConf.total}" itemPerPage="${pageConf.limit}"/>
				</td>
			</tr>
		</table>
	</td></tr>
</table>
</body>
</html>
