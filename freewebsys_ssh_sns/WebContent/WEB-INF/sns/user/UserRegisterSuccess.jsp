<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/common/sns/commonMeta.jsp">
	<s:param name="index">Login</s:param>
</s:include>
</head>
<body>
<!-- 引入头部 -->
<s:include value="/common/sns/include/header.jsp">
	<s:param name="topIndex">3</s:param>
	<s:param name="leftIndex">login</s:param>
</s:include>

<div style="margin-top: 100px;">&nbsp;</div>
<fws:gsWindowPanel height="180" width="380" title="注册成功，请查收邮件，激活帐号。" id="user_login">
<table>
		<tr>
			<td align="center" height="50">
				<div style="margin-top: 40px;font-size: 16px;color: green;text-align: center;">
				${email}恭喜您：注册成功，请查收邮件，激活帐号。</div>
			</td>
		</tr>
		<tr>
			<td align="center" valign="bottom" height="40">
				<input name="button" class="gwt-Button" 
				onclick="window.location.href='${ctx}/userLogout.htm?email=${email}'" value="登 录" type="button"/>
			</td>
		</tr>
</table>
</fws:gsWindowPanel>

<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>