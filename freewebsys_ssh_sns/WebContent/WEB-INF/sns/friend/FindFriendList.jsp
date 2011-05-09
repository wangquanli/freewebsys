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
function saveFriendCall(id,name,note){
	$.ajax({
 		type:"POST",
 		url:'saveFriend.htm',
 		data:{'friend.friend.id':id,'friend.friendUserName':name,'friend.note':note},
 		success:function(data){
 			//alert(data);
 			if(data == 2){
 				alert("好友他添加成功.");
 				window.location.reload();
 			}else if(data == 1){
 				alert("等待好友同意.");
 			}else if(data == 0){
 				alert("已经成为好友.");
 			}
 		}
 	});
}
//添加好友
function saveFriend(id,name){
	var note = prompt("清输入");
	saveFriendCall(id,name,note);
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
	index="4" />

<div class="friendBox">
            <div class="MenuSub"><!--
            <a href="#"><strong>查找朋友</strong></a> | <a href="#">好友的好友</a> | <a href="#">我可能认识的人</a>
            --></div>

<form method="post" action="${ctx}/findFriend.htm">
<ul>
<li style="padding: 0px;" class="f14px lh25">
	<strong><img width="24" height="23" class="left" src="${img_ctx}/ico_search.gif"/>&nbsp;查找朋友</strong>
    <ul>
        <li class="li">
            <div style="width: 20%;" class="left alR">姓名：</div>
            <div style="width: 80%;" class="left cGray2">
                <input name="userInfo.name" type="text" size="30" onblur="this.className='TextH20'" onfocus="this.className='Text2'" class="TextH20"/>
            </div>
			<div class="c"></div>
        </li>
        <li class="li">
            <div style="width: 20%;" class="left alR">&nbsp;</div>
            <div style="width: 80%;" class="left cGray2">
                <input type="submit" value="查 找" id="button" class="btn_b" name="button"/>
            </div>
			<div class="c"></div>
        </li>
</ul>
</li>
</ul>
</form>

<div class="friend_search" style="margin-top: 10px;margin-left: 25px;"><!-- 查找列表 begin  -->
	<!--<div class="topline lh30">找到2位相关用户  <a href="#">重新查找</a></div>-->
	<ul>
<s:iterator value="page.data" status="status">	
		<li>
			<div class="c1"><span class="headpic50"><a rel="" class="f14px fB tips" href="/thinksns/index.php?s=/space/7">
			<img src=""></a></span></div>
		        <div class="c2">
		            <p><span class="cGray2">姓名：</span><a class="f14px fB" href=""><s:property value="name"/></a></p>
		            <p><span class="cGray2">性别：</span><s:property value="sex"/></p>
		            <p><span class="cGray2">城市：</span><s:property value="currentCity"/>/<s:property value="myFriendState"/></p>
		        </div>
		        <div class="c3">
		            <a title="加为好友" 
 					<s:if test="myFriendState == null">
		            href="javaScript:saveFriend('<s:property value="id"/>','<s:property value="name"/>');"
		            </s:if>
		            <s:elseif test="myFriendState == 0">
		            href="javaScript:alert('等待好友同意.');"
		            </s:elseif>
		            <s:elseif test="myFriendState == 1">
		            href="javaScript:alert('已经成为好友.');"
		            </s:elseif>
		            >加为好友</a>
		            <a href="">发送短消息</a>
		            <a href="">查看他的首页</a>
		        </div>
		</li>
</s:iterator>
	</ul>
	<div class="page">
		<s:set name="page" value="page"/><!-- 重新给page赋值,urlwrite的问题 -->
		<fsns:page action="findFriend" otherValue="userInfo.name" theme="post" start="${page.start}" limit="${page.limit}" total="${page.total}"/>
	</div>
	</div><!-- end  -->
</div>

</div>
<!-- 右侧内容 end  -->
<div class="c"></div>


<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>