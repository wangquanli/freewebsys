<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html>
<head>
<fws:gsHead></fws:gsHead>
</head>
<body>
<fws:gsTabPanel id="8888" width="500" height="400" titleActions="#,TabPanel_2.jsp,#" showTitleIndex="1"
	titleNames="首页,测试,论坛" titleWidth="100" showPanelBorder="false" tabBarMenuLeft="100">
</fws:gsTabPanel>

<br/>

<fws:gsTabPanel id="88881" width="500" height="400" titleActions="#,TabPanel_2.jsp,#" showTitleIndex="1"
	titleNames="<font color='red'>首页</font>,测试,论坛" titleWidth="100" showPanelBorder="false" tabBarMenuLeft="100" showVertical="true">
</fws:gsTabPanel>

<br/>

</body>
</html>