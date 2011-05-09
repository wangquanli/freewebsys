<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SWFUpload Demos - Simple Demo</title>
<jsp:include page="/common/commonMeta.jsp" />
<script type="text/javascript">
	function user_uploadSuccess_swf(file, serverData){
		alert('ddd');
		var data = eval('('+serverData+')');
		alert(data.status);
		alert(data.fileName);
	}
</script>
</head>
<body>
<fws:swfUpload fileSize="2000" fileType="*.jpg" filePath="user" buttonText="上传图片" id="user"></fws:swfUpload>
</body>
</html>
