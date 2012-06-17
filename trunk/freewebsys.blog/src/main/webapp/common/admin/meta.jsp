<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<meta http-equiv="cache-control" content="no-store">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<%
     response.setContentType("text/html");
     response.setHeader("Cache-Control","no-cache");
     response.setHeader("Cache-Control","no-store");
     response.setDateHeader("Expires", 0);
     response.setHeader("Pragma","no-cache");
     ///(request.getSession(false)).invalidate();
     request.setAttribute("ctx",request.getContextPath());//设置缩写.
%>
<link type="text/css" rel="stylesheet" href="${ctx}/common/css/admin.css"></link>
<link type="text/css" rel="stylesheet" href="${ctx}/common/css/fresh.css"></link>
<script src="${ctx}/common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<!--formValidator 校验..-->
<script src="${ctx}/common/js/formValidator/formValidator_min.js" type="text/javascript"></script>
<script src="${ctx}/common/js/formValidator/formValidatorRegex.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/common/css/formValidator/validator.css"></link>
<script src="${ctx}/common/js/xhEditor/xheditor-1.1.13-zh-cn.min.js" type="text/javascript"></script>

<!-- 代码高亮. -->
<link href="${ctx}/common/js/prettify/prettify.css" type="text/css" rel="stylesheet" />
<script src="${ctx}/common/js/prettify/prettify.js" type="text/javascript"></script>
    
<style>
<!--
.dataGrid_tr_bgcolor{
	background-color: #EAF2FA;
}
-->
</style>
<script type="text/javascript">
//<!--
function commonCheckAll(){
	var obj = document.getElementsByName("check_id");var len = obj.length ;
	for(var i=0;i<len;i++){obj[i].checked = document.getElementById("root_check_id").checked;}
}
//commonGetCheckAll
function commonGetCheckAll(){
	var objCheck = document.getElementsByName("check_id") ;
	var len = objCheck.length ;
	var ids = "";
	for( var i = 0; i < len; i ++){
		if(objCheck[i].checked){
			ids= ids +"&ids=" + objCheck[i].value;
		}
	}
	return ids;
}
//-->
</script>
