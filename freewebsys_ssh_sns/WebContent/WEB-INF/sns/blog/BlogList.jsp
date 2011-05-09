<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/common/sns/commonMeta.jsp">
	<s:param name="index">Blog</s:param>
</s:include>
<script type="text/javascript">
<!--
function showReplay(objId){//{status.index}
	$('#replaySubComment_'+objId+'_id').toggle();
	$('#replayTextarea_'+objId+'_id').focus();
}
function hideReplay(objId){//{status.index}
	$('#replaySubComment_'+objId+'_id').hide();
}
//-->
</script>
</head>
<body>
<!-- 引入头部 -->
<s:include value="/common/sns/include/header.jsp">
<s:param name="topIndex">4</s:param>
<s:param name="leftIndex">blog</s:param>
</s:include>

	

<table width="100%">
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
			<s:if test="type ==  'my'"><a href="${ctx}/addBlog.htm?type=add&id=<s:property value="id"/>">编辑</a> | 
			<a href="javascript:commonConfirm('${ctx}/deleteBlog.htm?ids=<s:property value="id"/>','确定删除该日志？')">删除</a>&nbsp;&nbsp;</s:if>
			<s:else>
			作者：<a href=""><s:property value="userInfo.name"/></a></s:else>
			<span class="cGray2"><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></span>
		</td>
	</tr>
	<!-- 内容 -->
	<tr><td>
		<s:property value="content" escapeHtml="false"/>
	</td></tr>
	<tr><td>
	<p class="cGray2 alR">分类:
           <a href="">未分类</a>
           &nbsp;&nbsp;|&nbsp;&nbsp;
           <a href="">阅读</a>(0)
           &nbsp;&nbsp;|&nbsp;&nbsp;
           <a href="">评论</a>(0)
          </p>
	</td></tr>
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