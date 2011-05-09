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
<s:include value="/common/sns/include/header.jsp" />



<!-- 右侧内容 begin  -->
<div class="main">

<div class="page_title"><!-- page_title begin -->
<h2><img src="${img_ctx}/blog/ico_app01.gif" />发表新日志</h2>
<div class="c"></div>
</div>

<fsns:tabMenuUrl
	titles="好友的日志,我的日志,大家的日志,<div class='ico_add'>&nbsp;</div>发表日志"
	actions="listBlog.htm,listBlog.htm,listBlog.htm,addBlog.htm"
	index="4" />

<div class="MenuSub"></div>

<!--add content-->
</div>
<!-- 右侧内容 end  -->
<div class="c"></div>


<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>