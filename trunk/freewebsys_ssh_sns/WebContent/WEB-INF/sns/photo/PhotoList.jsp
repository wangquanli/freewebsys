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

	<s:if test="#status.count % 2 == 1"><tr><td></s:if>
	<s:if test="#status.count % 2 == 0"><td></s:if>
			<table>
				<tr>
				<td>
					<a href="${ctx}/viewPhoto.htm?type=${type}&id=<s:property value="id"/>">
					<img src="<s:property value="smallImagePath"/>" alt="" width="150" height="120"/>
					</a>
				</td>
				<td valign="middle" align="left">
					
					<s:if test="type ==  'my'">
					<div><a href="javascript:commonConfirm('${ctx}/deletePhoto.htm?ids=<s:property value="id"/>','确定删除该照片？')">删除</a></div>
					</s:if>
					<s:else>作者：<a href=""><s:property value="userInfo.name"/></a></s:else>
					<div>时间：<s:date name="createTime" format="yyyy-MM-dd HH:mm"/></div>
					<div>
						<a href="">浏览</a>(0)
						&nbsp;|&nbsp;
						<a href="">评论</a>(0)
           			</div>
				</td>
				</tr>
			</table>
	<s:if test="#status.count % 2 == 1"></td></s:if>
	<s:if test="#status.count % 2 == 0 || #status.last ">
		</td>
		</tr>
		<!-- 分割线 -->
		<tr><td colspan="2">
			<div style="border-bottom: 1px solid #92C1F0;height: 2px;"></div>
		</td></tr>
	</s:if>
	
</s:iterator>
	<!-- 分页 -->
	<tr><td colspan="2">
		<div>
			<fws:gsPage  action="listPhoto.htm" otherValue="type" start="${page.start}" limit="${page.limit}" total="${page.total}"/>
		</div>
	</td></tr>
</table>

<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>