<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String title = (null == request.getParameter("title") ? ""
			: request.getParameter("title"));
	String strLimit = (null == request.getParameter("limit") ? ""
			: request.getParameter("limit"));
	System.out.println("title:["+title);
	//System.out.println(strLimit);
	out.print("{success:true}");
%>