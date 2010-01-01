<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/test/commonHead.jsp"%>
</head>
<body>
<script type="text/javascript">
Ext.onReady(function(){
	alert();
	Ext.get('myButton').on('click', 
			function(){ 
		alert("You clicked the button"); 
	});
});
</script>
<button type="button" id="myButton">测试.</button>
</body>
</html>