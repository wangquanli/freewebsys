<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/common/sns/commonMeta.jsp">
	<s:param name="index">Login</s:param>
</s:include>
<script type="text/javascript">
<!--
$(document).ready(function(){
    $.formValidator.initConfig({validatorgroup:"register",onerror:function(){return false;},onsuccess:function(){
    	//校验成功准备提交
 		var myForm = document.getElementById('saveUserRegisterFormId');//按照form进行提交.
 		myForm.action = '${ctx}/saveUserRegister.htm';
 		myForm.submit();
    }});
    
    $("#userInfo_email_id").formValidator({validatorgroup:"register",onshow:" ",onfocus:"请输入邮箱",oncorrect:"输入正确"})
    .inputValidator({min:1,onerror:"邮箱不能为空"})
    .regexValidator({regexp:"email",datatype:"enum",onerror:"邮箱格式不正确"})
    .ajaxValidator({
	    type : "post",
		url : "${ctx}/checkUserEmail.htm",
		success : function(data){
			//alert(data);
			if(!(data == "true")){
				return false;
			}else{
				return true;
			}
		},
		buttons: $("#registerFormSubmitId"),
		error: function(){alert("服务器忙，请重试");},
		onerror : "该邮箱已被占用",
		onwait : "请稍候..."
	});
    
    $("#userInfo_passwd_id").formValidator({validatorgroup:"register",onshow:" ",onfocus:"请输入密码",oncorrect:"输入正确"})
    .inputValidator({min:1,onerror:"密码不能为空"})
	.inputValidator({max:20,onerror:"最多输入20个字符"});
    $("#userInfo_passwd2_id").formValidator({validatorgroup:"register",onshow:" ",onfocus:"请输入密码",oncorrect:"输入正确"})
        .inputValidator({min:1,onerror:"密码不能为空"})
	.inputValidator({max:20,onerror:"最多输入20个字符"})
    .compareValidator({desid:"userInfo_passwd_id",operateor:"=",onerror:"两次输入的密码不一致"});
    
    $("#userInfo_name_id").formValidator({validatorgroup:"register",onshow:" ",onfocus:"请输入用户名",oncorrect:"输入正确"})
    .inputValidator({min:1,onerror:"用户名不能为空"})
    .inputValidator({max:20,onerror:"最多输入20个字符"});
    $("#userInfo_sex_id").formValidator({validatorgroup:"register",onshow:" ",onfocus:"请选择性别",oncorrect:"输入正确"})
    .inputValidator({min:1,onerror:"性别不能为空"});
    $("#userInfo_birthday_id").formValidator({validatorgroup:"register",onshow:" ",onfocus:"请选择出生日期",oncorrect:"输入正确"})
    .inputValidator({min:1,onerror:"出生日期不能为空"});
    //$("#userInfo_bloodType_id").formValidator({validatorgroup:"register",onshow:" ",onfocus:"该项不能为空",oncorrect:"输入正确"}).inputValidator({min:1});
    $("#userInfo_currentArea_id").formValidator({validatorgroup:"register",onshow:" ",onfocus:"请选择所在地",oncorrect:"输入正确"})
    .inputValidator({min:1,onerror:"所在地不能为空"})
    .inputValidator({max:20,onerror:"最多输入20个字符"});
    $("#userInfo_verifyImg_id").formValidator({validatorgroup:"register",onshow:" ",onfocus:"请输入验证码",oncorrect:"输入正确"})
    .inputValidator({min:1,onerror:"验证码不能为空"})
    .ajaxValidator({
	    type : "post",
		url : "${ctx}/chekcUserImgCode.htm",
		success : function(data){
			//alert(data);
			if(!(data == "true")){
				return false;
			}else{
				return true;
			}
		},
		buttons: $("#registerFormSubmitId"),
		error: function(){alert("服务器忙，请重试");},
		onerror : "该验证码输入错误",
		onwait : "请稍候..."
	});
	
    //帮定校验事件
    $('#registerFormSubmitId').click(function(){jQuery.formValidator.pageIsValid("register");});
});
//-->
</script>
</head>

<body>
<!-- 引入头部 -->
<s:include value="/common/sns/include/header.jsp">
	<s:param name="topIndex">3</s:param>
	<s:param name="leftIndex">register</s:param>
</s:include>


<div style="margin-top: 50px;">&nbsp;</div>
<fws:gsWindowPanel height="320" width="420" title="用户注册" id="user_Register">


<form id="saveUserRegisterFormId" action="saveUserLogin.action" method="post">
<table>
		<tr>
			<td width="120">您的Email：</td>
			<td width="180"><s:textfield name="userInfo.email" id="userInfo_email_id" theme="simple" cssStyle="width: 100%;"/></td>
			<td width="100"><div id="userInfo_email_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td>设置登录密码：</td>
			<td><s:password name="userInfo.passwd" id="userInfo_passwd_id" theme="simple" cssStyle="width: 100%;"/></td>
			<td><div id="userInfo_passwd_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td>再输入一遍密码：</td>
			<td><s:password name="userInfo_passwd2" id="userInfo_passwd2_id" theme="simple" cssStyle="width: 100%;"/></td>
			<td><div id="userInfo_passwd2_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td>你的姓名：</td>
			<td><s:textfield name="userInfo.name" id="userInfo_name_id" theme="simple" cssStyle="width: 100%;"/></td>
			<td><div id="userInfo_name_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td>性别：</td>
			<td><input name="userInfo.sex" type="radio" value="1"/> 男
				<input name="userInfo.sex" type="radio" value="0"/> 女</td>
			<td><div id="userInfo_sex_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td>出生日期：</td>
			<td>
				<select name="birthday_year" style="width:55px;">
                        	<s:iterator begin="1930" end="2009" var="year">
                        		<option value="<s:property/>" <s:if test="#year == 1980">selected="selected"</s:if>><s:property/></option>
                        	</s:iterator>
                        </select>年 
                        <select name="birthday_month" id="birthday_month" style="width:30px;">
                        	 <s:iterator begin="1" end="12">
                        	 <option value="<s:property/>"><s:property/></option>
                        	 </s:iterator>
                        </select>月 
                        <select name="birthday_day" id="birthday_day" style="width:30px;">
                        	<s:iterator begin="1" end="31">
                        	<option value="<s:property/>"><s:property/></option>
                        	</s:iterator>
                        </select>日
             </td>
			<td><div id="userInfo_name_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td>居住城市：</td>
			<td><s:textfield name="userInfo.currentArea" id="userInfo_currentArea_id" theme="simple" cssStyle="width: 100%;"/></td>
			<td><div id="userInfo_currentArea_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td>隐私设置：</td>
			<td>
				<select name="baseinfoprivacy" style="width:100%;">
                            <option value="0">任何人能看见我的资料和内容</option>
                            <option value="1" selected="selected">仅好友能看见我的资料和内容</option>
                            <option value="2">隐藏我的资料和内容</option>
                </select>
			</td>
			<td><div id="userInfo_currentArea_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td>验证码：</td>
			<td valign="middle">
			<table>
				<tr>
				<td valign="middle"><s:textfield name="userInfo_verifyImg" id="userInfo_verifyImg_id" theme="simple" cssStyle="width: 40px;"/></td>
				<td valign="middle"><img id="verifyImg_id" width="52" height="22" onclick="this.src='${ctx}/ImageCodeNew.servlet?'+new Date().getTime();" src="${ctx}/ImageCode.servlet" title="换一张"" style="cursor: pointer;"/></td>
				<td valign="middle"><a href="#" onclick="document.getElementById('verifyImg_id').src='${ctx}/ImageCodeNew.servlet?'+new Date().getTime();" title="换一张">换一张</a></td>
				</tr>
			</table>
			</td>
			<td><div id="userInfo_verifyImg_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2">
			<input name="button" class="gwt-Button" id="registerFormSubmitId" value="同意条款 立即注册" type="button"/>
			<input name="button" class="gwt-Button" onclick="window.location.href='${ctx}/userLogout.htm'" value="返回登录" type="button"/>
			</td>
		</tr>
</table>
</form>
</fws:gsWindowPanel>

<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>