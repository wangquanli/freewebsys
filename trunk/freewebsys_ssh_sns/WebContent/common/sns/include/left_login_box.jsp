<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- 左侧登录窗口 begin -->

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
<div class="left_login_box">
		<h2>登录站点</h2>
		<form id="saveUserLoginFormId" action="saveUserLogin.action" method="post">

		<div style="width: 55px;">Email：</div><div style="width: 120px; margin-bottom: 5px;">
		<s:textfield name="email" id="login_email_id" theme="simple" cssClass="TextH20" cssStyle="width: 100%;" onfocus="this.className='Text2'" onblur="this.className='TextH20'"/>
		</div>
		<div id="login_email_idTip" style="width: 100px;"></div>
		
		<div style="width: 55px;">密码：</div><div style="width: 120px; margin-bottom: 5px;">
		<s:password name="passwd" id="login_passwd_id" theme="simple" cssClass="TextH20" cssStyle="width: 100%;" onfocus="this.className='Text2'" onblur="this.className='TextH20'"/>
		</div>
		<div id="login_passwd_idTip" style="width: 100px;"></div>
		<div style="width: 55px;">验证码：</div>
        <div style="width: 130px; margin-bottom: 5px;">
	        <div class="left">
	        <s:textfield name="login_verifyImg_id" id="login_verifyImg_id" theme="simple" cssClass="TextH20" cssStyle="width: 50px;" onfocus="this.className='Text2'" onblur="this.className='TextH20'"/>
	        </div>
			<a href="javaScript:void(0);"><img width="52" height="22" onclick="this.src='${ctx}/ImageCodeNew.servlet?'+new Date().getTime();" src="${ctx}/ImageCode.servlet" title="换一张"/></a>
		</div>
		<div id="login_verifyImg_idTip" style="width: 100px;"></div>
		<div style="width: 130px; margin-bottom: 5px;"><input name="remembor" value="1" type="checkbox"/>下次自动登录</div>
		<div style="width: 130px; margin-bottom: 5px;"><input name="button" class="btn_b left_do" id="saveUserLoginFormSubmitId" value="登 录" type="button"/></div>
		</form>
</div>
	
<!-- 左侧登录窗口 end -->