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
<s:param name="leftIndex">blog</s:param>
</s:include>
    
<table width="100%">
		<tr>
			<td colspan="3" height="30"></td>
		</tr>
		
		<s:iterator value="page.data">
		<tr>
			<td colspan="3" >
				<div style="font-size: 16px;font-weight: bold;"><s:property value="title"/></div>
			</td>
		</tr>
		<tr><td colspan="3">
			<div style="border-bottom: 1px solid #92C1F0;height: 2px;"></div>
		</td></tr>
		<s:if test="#session.userInfoSession == null">
				<fws:nextPrevPage start="${page.start}" limit="${page.limit}" 
				total="${page.total}" action="viewIndexBlog.htm"/>
			</s:if>
			<s:else>
				<fws:nextPrevPage start="${page.start}" otherValue="type" limit="${page.limit}" 
				total="${page.total}" action="viewBlog.htm"/>
		</s:else>
		<tr>
			<td width="100">
				<s:if test="${hasPrev}">
					<a href="${prevUrl}">前一篇</a>
				</s:if><s:else>
						无上一篇
				</s:else>
			</td>
			<td>&nbsp;</td>
			<td width="100" align="right">
				<s:if test="${hasNext}">
					<a href="${nextUrl}">下一篇</a>
					</s:if>
				<s:else>
					无下一篇
				</s:else>
			</td>
		</tr>
		<tr><td height="10" colspan="3">&nbsp;</td></tr>
		<tr>
			<td colspan="3" valign="top"><s:property value="content"/></td>
		</tr>
		</s:iterator>
</table>

 


<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>