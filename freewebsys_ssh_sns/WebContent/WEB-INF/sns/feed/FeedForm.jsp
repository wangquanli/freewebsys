<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/common/sns/commonMeta.jsp">
	<s:param name="index">Feed</s:param>
</s:include>
<script type="text/javascript">
<!--
$(document).ready(function(){
    $.formValidator.initConfig({onerror:function(){return false;},onsuccess:function(){
    	//校验成功准备提交
    	if(!confirm('确定保存')){ return; };
 		var myForm = document.getElementById('FeedFormId');//按照form进行提交.
 		myForm.action = '${ctx}/saveFeed.htm';
 		myForm.submit();
    }});
    
    $("#feed_id_id").formValidator({onshow:" ",onfocus:"该项不能为空",oncorrect:" "}).inputValidator({min:1});
    $("#feed_userId_id").formValidator({onshow:" ",onfocus:"该项不能为空",oncorrect:" "}).inputValidator({min:1});
    $("#feed_userName_id").formValidator({onshow:" ",onfocus:"该项不能为空",oncorrect:" "}).inputValidator({min:1});
    $("#feed_feedType_id").formValidator({onshow:" ",onfocus:"该项不能为空",oncorrect:" "}).inputValidator({min:1});
    $("#feed_titleData_id").formValidator({onshow:" ",onfocus:"该项不能为空",oncorrect:" "}).inputValidator({min:1});
    $("#feed_contentData_id").formValidator({onshow:" ",onfocus:"该项不能为空",oncorrect:" "}).inputValidator({min:1});
    $("#feed_createTime_id").formValidator({onshow:" ",onfocus:"该项不能为空",oncorrect:" "}).inputValidator({min:1});
    $("#feed_feedTemplateId_id").formValidator({onshow:" ",onfocus:"该项不能为空",oncorrect:" "}).inputValidator({min:1});
	
    //帮定校验事件
    $('#formSubmitId').click(function(){jQuery.formValidator.pageIsValid();});
});
//-->
</script>
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



<s:textfield name="feed.id" id="feed_id_id" theme="simple" cssClass=""/>
<div id="feed_id_idTip" style="width: 100px;"></div>


用户id
<s:textfield name="feed.userId" id="feed_userId_id" theme="simple" cssClass=""/>
<div id="feed_userId_idTip" style="width: 100px;"></div>


用户名
<s:textfield name="feed.userName" id="feed_userName_id" theme="simple" cssClass=""/>
<div id="feed_userName_idTip" style="width: 100px;"></div>


动态类型
<s:textfield name="feed.feedType" id="feed_feedType_id" theme="simple" cssClass=""/>
<div id="feed_feedType_idTip" style="width: 100px;"></div>


标题数据
<s:textfield name="feed.titleData" id="feed_titleData_id" theme="simple" cssClass=""/>
<div id="feed_titleData_idTip" style="width: 100px;"></div>


内容数据
<s:textfield name="feed.contentData" id="feed_contentData_id" theme="simple" cssClass=""/>
<div id="feed_contentData_idTip" style="width: 100px;"></div>


创建时间
<s:textfield name="feed.createTime" id="feed_createTime_id" theme="simple" cssClass=""/>
<div id="feed_createTime_idTip" style="width: 100px;"></div>


模板Id
<s:textfield name="feed.feedTemplateId" id="feed_feedTemplateId_id" theme="simple" cssClass=""/>
<div id="feed_feedTemplateId_idTip" style="width: 100px;"></div>



<!--add content-->
</div>
<!-- 右侧内容 end  -->
<div class="c"></div>


<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>