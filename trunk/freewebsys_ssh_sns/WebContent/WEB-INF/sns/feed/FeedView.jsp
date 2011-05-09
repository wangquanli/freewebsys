<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/common/sns/commonMeta.jsp">
	<s:param name="index">Feed</s:param>
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
	titles="好友的Feed,我的Feed,大家的Feed,<div class='ico_add'>&nbsp;</div>发表日志"
	actions="listFeed.htm,listFeed.htm,listFeed.htm,addFeed.htm"
	index="4" />

<div class="MenuSub"></div>

<!--add content-->

:<s:property value="feed.id"/>

用户id:<s:property value="feed.userId"/>

用户名:<s:property value="feed.userName"/>

动态类型:<s:property value="feed.feedType"/>

标题数据:<s:property value="feed.titleData"/>

内容数据:<s:property value="feed.contentData"/>

创建时间:<s:property value="feed.createTime"/>

模板Id:<s:property value="feed.feedTemplateId"/>



</div>
<!-- 右侧内容 end  -->
<div class="c"></div>


<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>