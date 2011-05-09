<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/common/sns/commonMeta.jsp">
	<s:param name="index">Friend</s:param>
</s:include>
<script type="text/javascript">
//添加好友
function deleteFriend(id){
	commonConfirm("确定解除好友关系么？",function(){window.location.href='${ctx}/deleteFriend.htm?id='+id;});
}
</script>
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
	index="1" />

<div class="MenuSub"></div>

<div class="friendBox">

<div class="sidebar pt10">

<div class="FSort">
	<div class="tit"><a href="javascript:addGroup()" class="f12px fn right mr5">添加分组</a>好友分组</div>
	<ul id="f_group">
		<li class="on"><a href="http://localhost/thinksns/index.php?s=/Friend/index">所有好友(2)</a></li>
		<li id="fli_1"><a href="http://localhost/thinksns/index.php?s=/Friend/index/gid/1">未分组(0)</a></li>
		<li id="fli_2"><a href="http://localhost/thinksns/index.php?s=/Friend/index/gid/2">通过本站认识(2)</a></li>
		<li id="fli_3"><a href="http://localhost/thinksns/index.php?s=/Friend/index/gid/3">通过活动认识(0)</a></li>
		<li id="fli_4"><a href="http://localhost/thinksns/index.php?s=/Friend/index/gid/4">通过朋友认识(0)</a></li>
		<li id="fli_5"><a href="http://localhost/thinksns/index.php?s=/Friend/index/gid/5">亲人(0)</a></li>
		<li id="fli_6"><a href="http://localhost/thinksns/index.php?s=/Friend/index/gid/6">同事(0)</a></li>
		<li id="fli_7"><a href="http://localhost/thinksns/index.php?s=/Friend/index/gid/7">同学(0)</a></li>
		<li id="fli_8"><a href="http://localhost/thinksns/index.php?s=/Friend/index/gid/8">不认识(0)</a></li>
		<li id="fli_9"><a href="http://localhost/thinksns/index.php?s=/Friend/index/gid/9">其他(0)</a></li>
		<li id="fli_11"><a href="http://localhost/thinksns/index.php?s=/Friend/index/gid/11">dddddddddddd(0)</a>
		<a href="javascript:del_group(11)">删除</a></li>	
	</ul>
	<div class="btm"></div>
</div></div>

<div class="FList"><!-- 我的好友 begin  -->
	<ul style="padding: 0px;margin: 10px auto 0px auto;">
	<s:iterator value="page.data" status="status">	
	    <li class="btmlineD li pb10 pt5">
	            <div class="left" style="width:70px;"><span class="headpic50">
	                    <a href="" class="tips" rel="" title=""><img src=""/></a></span></div>
	            <div class="left" style="width:450px; margin-right:50px;">
	                <p class="lh20"><a href="" id="fname_4"><s:property value="friend.name"/></a></p>
					<p class="cGray2 lh20">分组：<a href="javascript:set_group(4)"></a></p>
					<p class="cGray2 lh20"><span class="wn">心情：</span>什么都没做</p>
	            </div>
	            <div class="left" style="width:60px;">
					<p class="lh20"><a href="/thinksns/index.php?s=/space/4">查看空间</a></p>
	                <p class="lh20"><a href="/thinksns/index.php?s=/Notify/write/uid/4">发送短信</a></p>
	                <p class="lh20"><a href="javascript:deleteFriend('<s:property value="friend.id"/>')">解除关系</a></p>
	            </div>
	            <div class="c"></div>
		</li>
	</s:iterator>
	</ul>
</div><!-- 我的好友 end  -->
</div>
	

<!--add content-->
</div>
<!-- 右侧内容 end  -->
<div class="c"></div>


<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>