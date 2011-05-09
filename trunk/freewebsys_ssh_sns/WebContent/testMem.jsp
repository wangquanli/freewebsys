<%@ page contentType="text/html;charset=GBK"%>

<%
out.print("当前的最大内存为:"+Runtime.getRuntime().maxMemory()/1000/1000+"MB</br>");
out.print("当前的使用内存为:"+Runtime.getRuntime().totalMemory()/1000/1000+"MB</br>");
out.print("当前的剩余内存为:"+Runtime.getRuntime().freeMemory()/1000/1000+"MB</br>");

%>