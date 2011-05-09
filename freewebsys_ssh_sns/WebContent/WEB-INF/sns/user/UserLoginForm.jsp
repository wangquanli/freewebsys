<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/common/sns/commonMeta.jsp">
	<s:param name="index">Login</s:param>
</s:include>
</head>
<body>
<!-- 引入头部 -->
<s:include value="/common/sns/include/header.jsp" />

<div style="margin-top: 100px;">&nbsp;</div>
<fws:gsWindowPanel height="180" width="380" title="用户登录" id="user_login">
<script type="text/javascript">
<!--
$(document).ready(function(){
    $.formValidator.initConfig({validatorgroup:"login",onerror:function(){return false;},onsuccess:function(){
    	//校验成功准备提交
 		var myForm = document.getElementById('saveUserLoginFormId');//按照form进行提交.
 		myForm.action = '${ctx}/saveUserLogin.action';
 		myForm.submit();
    }});
    
    $("#login_email_id").formValidator({validatorgroup:"login",onshow:" ",onfocus:"该项不能为空",oncorrect:"输入正确"})
    .inputValidator({min:1,onerror:"邮箱不能为空"})
    .regexValidator({regexp:"email",datatype:"enum",onerror:"邮箱格式不正确"});
    
    $("#login_passwd_id").formValidator({validatorgroup:"login",onshow:" ",onfocus:"该项不能为空",oncorrect:"输入正确"})
    .inputValidator({min:6,max:20,onerror:"密码不能为空"});
    
    $("#login_verifyImg_id").formValidator({validatorgroup:"login",onshow:" ",onfocus:"该项不能为空",oncorrect:"输入正确"})
    .inputValidator({min:1,onerror:"验证码不能为空"})
    .ajaxValidator({
	    type : "post",
		url : "${ctx}/chekcUserImgCode.action",
		success : function(data){
			//alert(data);
			if(!(data == "true")){
				return false;
			}else{
				return true;
			}
		},
		buttons: $("#saveUserLoginFormSubmitId"),
		error: function(){alert("服务器忙，请重试");},
		onerror : "该验证码输入错误",
		onwait : "请稍候..."
	});
    
    //帮定校验事件
    $('#saveUserLoginFormSubmitId').click(function(){jQuery.formValidator.pageIsValid("login");});
});
//-->
</script>
<form id="saveUserLoginFormId" action="saveUserLogin.action" method="post">
<table>
		<tr>
			<td width="90">Email：</td>
			<td width="170"><s:textfield name="email" id="login_email_id" theme="simple" cssStyle="width: 100%;"/></td>
			<td width="100"><div id="login_email_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><s:password name="passwd" id="login_passwd_id" theme="simple" cssStyle="width: 100%;"/></td>
			<td><div id="login_passwd_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td>验证码：</td>
			<td valign="middle" align="left">
				<table>
					<tr>
					<td valign="middle"><s:textfield name="login_verifyImg_id" id="login_verifyImg_id" theme="simple" cssStyle="width: 40px;"/></td>
					<td valign="middle"><img id="verifyImg_id" width="52" height="22" onclick="this.src='${ctx}/ImageCodeNew.servlet?'+new Date().getTime();" src="${ctx}/ImageCode.servlet" title="换一张"" style="cursor: pointer;"/></td>
					<td valign="middle"><a href="#" onclick="document.getElementById('verifyImg_id').src='${ctx}/ImageCodeNew.servlet?'+new Date().getTime();" title="换一张">换一张</a></td>
					</tr>
				</table>
			</td>
			<td><div id="login_verifyImg_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td></td>
			<td>
			<input name="button" class="gwt-Button" id="saveUserLoginFormSubmitId" value="登 录" type="button"/>
			<input name="button" class="gwt-Button" onclick="window.location.href='${ctx}/userRegister.action'" value="注 册" type="button"/>
			</td>
			<td></td>
		</tr>
</table>
</form>
</fws:gsWindowPanel>

<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>