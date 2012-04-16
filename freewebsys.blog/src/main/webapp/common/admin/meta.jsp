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
