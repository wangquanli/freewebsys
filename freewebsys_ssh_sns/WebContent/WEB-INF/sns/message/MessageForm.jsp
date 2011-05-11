<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/common/sns/commonMeta.jsp">
	<s:param name="index">Blog</s:param>
</s:include>
</head>
<body>
<!-- 引入头部 -->
<s:include value="/common/sns/include/header.jsp">
<s:param name="topIndex">4</s:param>
<s:param name="leftIndex">message</s:param>
</s:include>

<s:form theme="simple" id="MessageFormId" action="saveMessage">
<s:hidden name="message.id"/>
<table>
		<tr>
			<td colspan="3" height="30"></td>
		</tr>
		<tr>
			<td width="80">测试Ids：</td>
			<td width="380"><s:textfield name="message.toUserIds" id="blog_title_id" theme="simple" cssStyle="width: 100%;"/></td>
			<td width="200"><div id="blog_title_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td width="80">收件人：</td>
			<td width="380"><s:textfield name="message.toUserNames" id="blog_title_id" theme="simple" cssStyle="width: 100%;"/></td>
			<td width="200"><div id="blog_title_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td>标题：</td>
			<td><s:textfield name="message.subject" id="blog_title_id" theme="simple" cssStyle="width: 100%;"/></td>
			<td><div id="blog_title_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td valign="top">内容：</td>
			<td>
			<s:textarea style="width: 380px;height: 250px;" theme="simple" name="message.content" id="content"/>
			</td>
			<td><div id="blog_title_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2">
			<input name="button" class="gwt-Button" id="registerFormSubmitId" value="保存" type="submit"/>
			<input name="button" class="gwt-Button" onclick="window.location.href='${ctx}/listMessage.htm?type=3'" value="返回收件箱" type="button"/>
			</td>
		</tr>
</table>
</s:form>


<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>