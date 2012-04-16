<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/common/admin/meta.jsp"%>
<title>UserInfo表单页面</title>
<script type="text/javascript">
<!--
$(document).ready(function(){
    $.formValidator.initConfig({onerror:function(){return false;},onsuccess:function(){
    	//校验成功准备提交
    	if(!confirm('确定保存')){ return; };
 		var myForm = document.getElementById('UserInfoFormId');//按照form进行提交.
 		myForm.action = '${ctx}/saveUserInfo.html';
 		myForm.submit();
    }});
    
    $("#userInfo_loginName_id").formValidator({onshow:" ",onfocus:"请输入1-10个字",oncorrect:"输入正确"})
	.inputValidator({min:1,onerror:"该项不能为空"})
	.inputValidator({max:20,onerror:"最多输入10个字"});
    $("#userInfo_password_id").formValidator({onshow:" ",onfocus:"请输入1-10个字",oncorrect:"输入正确"})
	.inputValidator({min:1,onerror:"该项不能为空"})
	.inputValidator({max:20,onerror:"最多输入10个字"});
    $("#userInfo_displayName_id").formValidator({onshow:" ",onfocus:"请输入1-10个字",oncorrect:"输入正确"})
	.inputValidator({min:1,onerror:"该项不能为空"})
	.inputValidator({max:20,onerror:"最多输入10个字"});
    $("#userInfo_email_id").formValidator({onshow:" ",onfocus:"请输入1-10个字",oncorrect:"输入正确"})
	.inputValidator({min:1,onerror:"该项不能为空"})
	.inputValidator({max:20,onerror:"最多输入10个字"});
    $("#userInfo_url_id").formValidator({onshow:" ",onfocus:"请输入1-10个字",oncorrect:"输入正确"})
	.inputValidator({min:1,onerror:"该项不能为空"})
	.inputValidator({max:20,onerror:"最多输入10个字"});
    $("#userInfo_regTime_id").formValidator({onshow:" ",onfocus:"请输入1-10个字",oncorrect:"输入正确"})
	.inputValidator({min:1,onerror:"该项不能为空"})
	.inputValidator({max:20,onerror:"最多输入10个字"});
    $("#userInfo_status_id").formValidator({onshow:" ",onfocus:"请输入1-10个字",oncorrect:"输入正确"})
	.inputValidator({min:1,onerror:"该项不能为空"})
	.inputValidator({max:20,onerror:"最多输入10个字"});
	
    //帮定校验事件
    $('#formSubmitId').click(function(){jQuery.formValidator.pageIsValid();});
});
//-->
</script>
</head>
<body>
<form:form modelAttribute="userInfoAttribute" method="POST" action="${ctx}/admin/saveUserInfo.do">  
<table width="100%" class="dataGrid_table" style="border: 1px solid #AAD; background: #ffffff;" border="0"
	cellpadding="0" cellspacing="1">
	<tr>
		<th>UserInfo表单页面</th>
	</tr>
	<tr>
		<td>
	    	<input type="submit" class="button" value="提交"/>
		<input type="button" class="button" onclick="window.location.href='${ctx}/admin/listUserInfo.do?start=0'" value="返回"/> 
		</td>
	</tr>
 	<tr>
	<td>
		<table width="100%"  border="0" cellpadding="0" cellspacing="1">
			<form:hidden path="id" />
			
			<tr><th>登录名</th><td>
			<form:input path="loginName"/><span style="color:red;">*</span>
			</td></tr>
			<tr><th>密码</th><td>
			<form:input path="passwd"/><span style="color:red;">*</span>
			</td></tr>
			<tr><th>显示名称</th><td>
			<form:input path="displayName"/><span style="color:red;">*</span>
			</td></tr>
			<tr><th>email</th><td>
			<form:input path="email"/><span style="color:red;">*</span>
			</td></tr>
			<tr><th>url</th><td>
			<form:input path="url"/><span style="color:red;">*</span>
			</td></tr>
			<tr><th>注册时间</th><td>
			<form:input path="regTime"/><span style="color:red;">*</span>
			</td></tr>
			<tr><th>状态</th><td>
			<form:input path="status"/><span style="color:red;">*</span>
			</td></tr>
    		</table>
    	</td>
	</tr>
</table>
</form:form>
</body>
</html>
