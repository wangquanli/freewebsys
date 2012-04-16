<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/common/admin/meta.jsp"%>
<title>UserInfo表单页面</title>
<script type="text/javascript">
</script>
</head>
<body class="login">
<div id="login"><h1><a href="" title="">freewebsys</a></h1>

	<!-- <p class="message">	您已登出。<br /></p> -->
	<c:if test="${infoMsg != null}">
	<p class="message">${infoMsg}<br/></p>
	</c:if>
	<c:if test="${errorMsg != null}">
	<div id="login_error"><strong>错误</strong>：${errorMsg}</div>
	</c:if>
	
	<form:form modelAttribute="userInfoAttribute" method="POST" action="${ctx}/admin/userLogin.do">  
		<p>
			<label for="user_login">用户名<br />
			<form:input path="loginName" id="user_login" cssClass="input"/></label>
		</p>
		<p>
			<label for="user_pass">密码<br />
			<form:password path="passwd" id="user_pass" cssClass="input"/></label>
		</p>
		<p class="forgetmenot"><label for="rememberme">
			<input name="rememberme" type="checkbox" id="rememberme" value="forever" tabindex="90" /> 
			记住我的登录信息</label></p>
		<p class="submit">
			<input type="submit" name="wp-submit" id="wp-submit" class="button-primary" value="登录" tabindex="100" />
			<input type="hidden" name="redirect_to" value="" />
			<input type="hidden" name="testcookie" value="1" />
		</p>
	</form:form>

	<p id="backtoblog"><a href="http://127.0.0.1/" title="不知道自己在哪？">&larr; 回到 freewebsys</a></p>
</div>


<div class="clear"></div>
</body>


</html>
