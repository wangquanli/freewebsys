<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/common/sns/commonMeta.jsp" >
	<s:param name="index">Mini</s:param>
</s:include>
<script type="text/javascript">
<!--
function commonConfirmMini(id){
	commonConfirm("确定删除么？",commonConfirmCallBack(id));
}
function commonConfirmCallBack(id){
	window.location.href="${ctx}/deleteMini.htm?ids="+id;
}
//-->
</script>
</head>
<body>
<!-- 引入头部 -->
<s:include value="/common/sns/include/header.jsp">
<s:param name="topIndex">4</s:param>
<s:param name="leftIndex">mini</s:param>
</s:include>


<s:form theme="simple" id="MiniFormId" action="saveMini">
<table width="100%">
	<tr><td colspan="3" height="30"></td></tr>
	<tr><td valign="top" align="center">
			我现在的心情：
			<fws:gsSmellTextArea name="mini.content" id="mini" cssStyle="width: 350px;height: 60px;"/>
			<span id="minismell_show_count_id" style="width:10px;"></span><br/>
			<input name="button" class="gwt-Button" id="registerFormSubmitId" value="发表心情" type="submit"/>
	</td></tr>
<s:iterator value="page.data" status="status">
	<!-- 标题 -->
	<tr>
		<td>
			<div style="font-weight: bold;font-size: 14px;">
			<a href="${ctx}/viewBlog.htm?type=${type}&id=<s:property value="id"/>"><strong><s:property value="title"/></strong></a>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<s:if test="type ==  'my'"> 
			<a href="javascript:commonConfirm('${ctx}/deleteMini.htm?ids=<s:property value="id"/>','确定删除该心情？')">删除</a>&nbsp;&nbsp;</s:if>
			<s:else>
			作者：<a href=""><s:property value="userInfo.name"/></a></s:else>
			<span><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></span>
		</td>
	</tr>
	<!-- 内容 -->
	<tr><td>
		<s:property value="content" escapeHtml="false"/>
	</td></tr>
	<!-- 分割线 -->
	<tr><td>
		<div style="border-bottom: 1px solid #92C1F0;height: 2px;"></div>
	</td></tr>
</s:iterator>
	<!-- 分页 -->
	<tr><td>
		<div>
			<fws:gsPage  action="listMini.htm" otherValue="type" start="${page.start}" limit="${page.limit}" total="${page.total}"/>
		</div>
	</td></tr>
</table>
</s:form>

<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>