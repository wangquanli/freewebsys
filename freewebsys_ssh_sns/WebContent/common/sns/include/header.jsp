<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>


<%
String topTitleNames = "";
String topTitleActions = "";
int topTabBarMenuLeft = 0;
int topShowTitleIndex = 0;
String topTitleIndexValue = "";
int leftIndex = 0;
%>
<s:if test="${param.leftIndex == 'blog'}">
<!-- 显示日志菜单 -->
<%
topTitleNames = "好友的日志,我的日志,大家的日志,发表日志";
topTitleActions = "listBlog.htm?type=friend,listBlog.htm?type=my,listBlog.htm?type=all,addBlog.htm?type=add";
topTabBarMenuLeft = 210;
topShowTitleIndex = 0;
topTitleIndexValue = "type:friend,type:my,type:all,type:add";
leftIndex = 2;
%>
</s:if>
<s:elseif test="${param.leftIndex == 'photo'}">
<!-- 显示日志菜单 -->
<%
topTitleNames = "好友的照片,我的照片,大家的照片,上传照片";
topTitleActions = "listPhoto.htm?type=friend,listPhoto.htm?type=my,listPhoto.htm?type=all,addPhoto.htm?type=add";
topTabBarMenuLeft = 210;
topShowTitleIndex = 0;
topTitleIndexValue = "type:friend,type:my,type:all,type:add";
leftIndex = 3;
%>
</s:elseif>
<s:elseif test="${param.leftIndex == 'mini'}">
<!-- 显示心情菜单 -->
<%
topTitleNames = "好友的心情,我的心情,大家的心情";
topTitleActions = "listMini.htm?type=friend,listMini.htm?type=my,listMini.htm?type=all";
topTabBarMenuLeft = 315;
topShowTitleIndex = 0;
topTitleIndexValue = "type:friend,type:my,type:all,type:add";
leftIndex = 4;
%>
</s:elseif>
<s:elseif test="${param.leftIndex == 'friend'}">
<!-- 显示心情菜单 -->
<%
topTitleNames = "我的好友,查找好友";
topTitleActions = "listFriend.htm,addFriend.htm";
topTabBarMenuLeft = 420;
topShowTitleIndex = 0;
try{
	topShowTitleIndex = Integer.parseInt(request.getParameter("topIndex"));
}catch(Exception e){}
topTitleIndexValue = "type:no,type:no";//标记一个空
leftIndex = 5;
%>
</s:elseif>
<s:elseif test="${param.leftIndex == 'message'}">
<!-- 显示心情菜单 -->
<%
topTitleNames = "收件箱,发件箱,通知,发送消息";
topTitleActions = "listMessage.htm?type=3,listMessage.htm?type=2,listMessage.htm?type=4,addMessage.htm?type=add";
topTabBarMenuLeft = 210;
topShowTitleIndex = 0;
topTitleIndexValue = "type:3,type:2,type:4,type:add";
leftIndex = 6;
%>
</s:elseif>
<s:else>
<!-- 其他情况 -->
<%
topTitleNames = "随便看看,登录,注册";
topTitleActions = "#,userLogout.htm,userRegister.htm";
topTabBarMenuLeft = 310;
try{
	topShowTitleIndex = Integer.parseInt(request.getParameter("topIndex"));
}catch(Exception e){}
leftIndex = 0;
%>
</s:else>
<%
request.setAttribute("leftIndex",leftIndex);
request.setAttribute("topTitleNames",topTitleNames);
request.setAttribute("topTitleActions",topTitleActions);
request.setAttribute("topTabBarMenuLeft",topTabBarMenuLeft);
request.setAttribute("topShowTitleIndex",topShowTitleIndex);
request.setAttribute("topTitleIndexValue",topTitleIndexValue);
%>
<!-- 头部 begin -->
<table width="100%">

<tr>
<td align="center">
	<table style="border: 0px;">
		<tr valign="top" height="30">
			<td width="150">
				<div style="border: 2px solid #92C1F0;height: 55px;font-size: 20px;font-weight: bold;">
				<span style="color:green;">Free</span>
				<span style="color:red;">Web</span>
				<span style="color:blue;">Sys</span>
				<div style="text-align: right;font-size: 12px;">
				<span style="color:green;">全速前进的</span>
				<span style="color:red;">无畏的</span>
				<span style="color:blue;">犀牛！</span></div>
				<div style="text-align: right;font-size: 12px;">version 0.11.5 Beta</div>
				</div>
				
			</td>
			<td width="714" align="right">
				<div>
<s:if test="#session.userInfoSession != null">
				<a href="#">用户信息</a>
				|<a href="#">设置</a>
				|<a href="${ctx}/userLogout.htm">退出</a>
</s:if>
<s:else>
				<a href="${ctx}/userLogout.htm">登录</a>
				|<a href="${ctx}/userRegister.htm">注册</a>
</s:else>
				</div>
			</td>
		</tr>
	</table>
</td></tr>

<tr><td align="center">
	<table cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td width="100" rowspan="2" valign="top">
				<table cellspacing="0" cellpadding="0" border="0">
					<tr valign="top"><td height="23"></td></tr>
					<tr valign="top"><td>
						<!-- 左侧菜单 -->
						<fws:gsTabPanel id="88881" width="500" height="600" showTitleIndex="${leftIndex}"
titleActions="#,${ctx}/listBlog.htm?type=friend,${ctx}/listPhoto.htm?type=friend,${ctx}/listMini.htm?type=friend,${ctx}/listFriend.htm,${ctx}/listMessage.htm?type=3" 
							titleNames="首页,日志,相册,心情,好友,消息,投票,群组" titleWidth="80" 
							showPanelBorder="false" tabBarMenuLeft="20" showVertical="true">
						</fws:gsTabPanel>
					</td></tr>
				</table>
			</td>
			<td width="660" valign="top" align="left">
				<!-- 顶部菜单 -->
				<fws:gsTabPanel id="8888" width="660" height="27" 
					showTitleIndex="${topShowTitleIndex}"
					titleActions="${topTitleActions}"
					titleNames="${topTitleNames}" titleWidth="80"
					showTitleIndexValue="${topTitleIndexValue}"
					showPanelBorder="false" tabBarMenuLeft="${topTabBarMenuLeft}">
				</fws:gsTabPanel>
			</td>
		</tr>
		<tr>
				<td width="660" align="center" style="vertical-align: top;" height="800">
				<div class="gwt-TabPanelBottom" style="border-top: 0px;height: 100%;">
				<!-- 中间内容开始 -->
				 