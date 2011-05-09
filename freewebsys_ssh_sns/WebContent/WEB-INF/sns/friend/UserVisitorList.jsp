<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/common/sns/commonMeta.jsp">
	<s:param name="index">Friend</s:param>
</s:include>
</head>
<body>
<!-- 引入头部 -->
<s:include value="/common/sns/include/header.jsp" />



<!-- 右侧内容 begin  -->
<div class="main">

<div class="page_title"><!-- page_title begin -->
<h2><img src="${img_ctx}/friend/ico_Friend.gif" />好友</h2>
<div class="c"></div>
</div>

<fsns:tabMenuUrl
	titles="我的好友,好友屏蔽,访问脚印,查找朋友,<div class='ico_add'>&nbsp;</div>邀请好友"
	actions="listFriend.htm,listFriendBlack.htm,listUserVisitor.htm,findFriend.htm,addFriend.htm"
	index="3" />

<div class="MenuSub"></div>

<!--add content-->
	<input id="checkall" type="checkbox" onclick="javaScript:commonCheckAll();"/>
	
	创建时间
	用户id
	访问Id
	访问用户名
	
	操作

<s:iterator value="page.data" status="status" step="10">
	
	<input type="checkbox" name="checkid" value="<s:property value="id"/>"/>
	<s:property value="id"/>
	<s:property value="createTime"/>
	<s:property value="userId"/>
	<s:property value="visitorId"/>
	<s:property value="visitorName"/>
	
	<a href="${ctx}/viewUserVisitor.htm?id=<s:property value="id"/>">查看</a>
	<a href="${ctx}/addUserVisitor.htm?id=<s:property value="id"/>">修改</a>
	<a href="javaScript:commonConfirm('${ctx}/deleteUserVisitor.htm?ids=<s:property value="id"/>','确定删除？');">删除</a>
	
</s:iterator>

</div>
<!-- 右侧内容 end  -->
<div class="c"></div>


<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>