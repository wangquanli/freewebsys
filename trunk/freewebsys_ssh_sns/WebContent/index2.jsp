<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
	<%
		Enumeration<String> headerNames = request.getHeaderNames();
		while (headerNames.hasMoreElements()) {
			String headName = headerNames.nextElement();
			System.out.print(headName);
			System.out.println(":\t" + request.getHeader(headName));
		}
		System.out.println("getLocalAddr" + request.getLocalAddr());
		System.out.println("getMaxInactiveInterval"
				+ request.getSession().getMaxInactiveInterval());
	%>
	finish
</body>
</html>