<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<meta http-equiv="X-UA-Compatible" content="IE=7.0000"/>
<meta http-equiv="X-UA-Compatible" content="IE=8"/>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<meta http-equiv="cache-control" content="no-store">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<%
     response.setContentType("text/html");
     response.setHeader("Cache-Control","no-cache");
     response.setHeader("Cache-Control","no-store");
     response.setDateHeader("Expires", 0);
     response.setHeader("Pragma","no-cache");
%>
<%request.setAttribute("ctx",request.getContextPath());//重新设置缩写. %>
<%request.setAttribute("img_ctx",request.getContextPath()+"/common/css/sns/images");//重新设置缩写. %>
<!-- ###############################in /common/commonMeta.jsp end ########################### -->
<script type="text/javascript">
<!--
//sys confirm for globel javascript.
function commonConfirm(url,confirmText) {
 	if(!confirm(confirmText)){ return; };window.location.href=url;
}
function commonSubmit(formId,url) { 
 		if(!confirm('确定保存')){ return; };
 		var myForm = document.getElementById(formId);//按照form进行提交.
 		myForm.action = url;myForm.submit();
}
function commonCheckAll(){
	var obj = document.getElementsByName("checkid");var len = obj.length ;
	for(var i=0;i<len;i++){obj[i].checked = document.getElementById("checkall").checked;}
}
//批处理方法
function commonBachDo(url,confirmText){
	var objCheck = document.getElementsByName("checkid") ;
	var len = objCheck.length ;var canDeleteAll = false;var url = url;
	for( var i = 0; i < len; i ++){if(objCheck[i].checked){
		canDeleteAll = true;url= url +"&ids=" + objCheck[i].value;}}
	if(canDeleteAll){
		if(!confirm(confirmText)){ return false;}
		window.location.href=url;
	}else{alert('没有选择的数据。');return null;}
}
/*通用提示方法
function commonAlert(str){
	alert(str);
}
function commonPrompt(callBack){
	var promptValue = prompt();
	callBack.call(promptValue);
}
function commonConfirm(str,callBack){
	if(confirm(str)){ callBack.call();}
}*/

//-->
</script>
<fws:gsHead></fws:gsHead>
<script src="${ctx}/common/js/formValidator/formValidator_min.js" type="text/javascript"></script>
<script src="${ctx}/common/js/formValidator/formValidatorRegex.js" type="text/javascript"></script>
<script src="${ctx}/common/js/kindeditor/kindeditor-min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/common/css/formValidator/validator.css"></link>
