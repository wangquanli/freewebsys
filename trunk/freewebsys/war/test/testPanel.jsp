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
	var p = new Ext.Panel({
        title: '面板测试.',
        collapsible:true,
        renderTo: 'panel-div',
        width:400,
        html: 'this is a test panel'
    });
});
</script>
<br></br>
<div id='panel-div' style="width:100%; height:100%;text-align: center;"></div>
</body>
</html>