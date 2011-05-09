<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- 用户组件列表 begin -->
<div class="user_app">

	<div class="user_app_top"></div>
	<div class="user_app_list">
		<ul>
		<li>
<a href="${ctx}/listBlog-type~friend.htm" class="a14">日志</a>
	<span><a href="${ctx}/addBlog.htm">发表</a></span>
		</li>
		<li>
<a href="${ctx}/listPhoto-type~friend.htm" class="a14">相册</a>
	<span><a href="${ctx}/addPhoto.htm">上传</a></span>
		</li>
		<li>
<a href="${ctx}/test/share.jsp" class="a14">分享</a>
		</li>
		<li>
<a href="${ctx}/test/vote.jsp" class="a14">投票</a>
		<span><a href="${ctx}">发起</a></span>
		</li>
		<li>
<a href="${ctx}/listMini-type~friend.htm" class="a14">心情</a>
		</li>
		<li>
<a href="${ctx}/test/group.jsp" class="a14">群组</a>
		</li>
		<li>
<a href="${ctx}/test/gift.jsp" class="a14">礼物</a>
		</li>
		<li>
<a href="${ctx}/test/event.jsp" class="a14">活动</a>
		<span><a href="${ctx}/test/">发起</a></span>
		</li>
		</ul>
	</div>
	<div class="app_add"><a href="/index.php?s=/App/">添加或删除组件</a></div>
		<div class="user_app_btm"></div>
	</div>
<!-- 用户组件列表 end -->