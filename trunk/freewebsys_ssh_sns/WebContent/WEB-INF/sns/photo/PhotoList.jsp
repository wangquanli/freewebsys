<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/common/sns/commonMeta.jsp">
	<s:param name="index">Photo</s:param>
</s:include>
</head>
<body>
<!-- 引入头部 -->
<s:include value="/common/sns/include/header.jsp">
<s:param name="topIndex">4</s:param>
<s:param name="leftIndex">photo</s:param>
</s:include>

<table width="100%">
<s:iterator value="page.data" status="status">
	<!-- 标题 -->
	<tr>
		<td>
			<div style="font-weight: bold;font-size: 14px;">
			<a href="${ctx}/viewPhoto.htm?type=${type}&id=<s:property value="id"/>">
			<strong>
			<img src="<s:property value="imagePath"/>" alt="" width="100" height="100"/>
			</strong></a>
			</div>
		</td>
	</tr>
	<!-- 分割线 -->
	<tr><td>
		<div style="border-bottom: 2px solid #92C1F0;height: 2px;"></div>
	</td></tr>
</s:iterator>
	<!-- 分页 -->
	<tr><td>
		<div>
			<fws:gsPage  action="listBlog.htm" otherValue="type" start="${page.start}" limit="${page.limit}" total="${page.total}"/>
		</div>
	</td></tr>
</table>

<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>