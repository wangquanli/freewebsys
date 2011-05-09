<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>


<%
String topTitleNames = "";
String topTitleActions = "";
int topTabBarMenuLeft = 0;
int topShowTitleIndex = 0;
int leftIndex = 0;
%>
<s:if test="${param.leftIndex == 'blog'}">
<!-- 显示日志菜单 -->
<%
topTitleNames = "好友的日志,我的日志,大家的日志,发表日志";
topTitleActions = "listBlog.htm?type=friend,listBlog.htm?type=my,listBlog.htm?type=all,addBlog.htm?type=add";
topTabBarMenuLeft = 160;
topShowTitleIndex = 0;
leftIndex = 2;
%>
</s:if>
<s:elseif test="${param.leftIndex == 'photo'}">
<!-- 显示日志菜单 -->
<%
topTitleNames = "好友的照片,我的照片,大家的照片,上传照片";
topTitleActions = "listPhoto.htm?type=friend,listPhoto.htm?type=my,listPhoto.htm?type=all,addPhoto.htm?type=add";
topTabBarMenuLeft = 160;
topShowTitleIndex = 0;
leftIndex = 3;
%>
</s:elseif>
<%
request.setAttribute("leftIndex",leftIndex);
request.setAttribute("topTitleNames",topTitleNames);
request.setAttribute("topTitleActions",topTitleActions);
request.setAttribute("topTabBarMenuLeft",topTabBarMenuLeft);
request.setAttribute("topShowTitleIndex",topShowTitleIndex);
%>
<!-- 头部 begin -->
<table width="100%">

<tr>
<td align="center">
	<table style="border: 0px;">
		<tr valign="top" height="30">
			<td width="100">
				<div style="border: 2px solid #92C1F0;height: 40px;">FreeWebSys</div>
			</td>
			<td width="614" align="right">
				<div>
				<a href="#">用户信息</a>
				|<a href="#">设置</a>
				|<a href="#">退出</a>
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
titleActions="${ctx}/mainIndex.action,${ctx}/listBlog.htm?type=friend,${ctx}/listPhoto.htm?type=friend,#,#,${ctx}/listMini.htm?type=friend," 
							titleNames="首页,日志,相册,分享,投票,心情,群组,礼物" titleWidth="80" 
							showPanelBorder="false" tabBarMenuLeft="20" showVertical="true">
						</fws:gsTabPanel>
					</td></tr>
				</table>
			</td>
			<td width="600" valign="top" align="left">
				<!-- 顶部菜单 -->
				<fws:gsTabPanel id="8888" width="600" height="27" 
					showTitleIndex="${topShowTitleIndex}"
					titleActions="${topTitleActions}"
					titleNames="${topTitleNames}" titleWidth="80"
					showTitleIndexValue="type:friend,type:my,type:all,type:add"
					showPanelBorder="false" tabBarMenuLeft="${topTabBarMenuLeft}">
				</fws:gsTabPanel>
			</td>
		</tr>
		<tr>
				<td width="600" align="center" style="vertical-align: top;" height="800">
				<div class="gwt-TabPanelBottom" style="border-top: 0px;height: 100%;">
				<!-- 中间内容开始 -->
				 