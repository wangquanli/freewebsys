<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/test/commonHead.jsp"%>
<script type="text/javascript"
	src="../extjs2.0/CommonJS_src.js"></script>
<style type="text/css">
.msg .x-box-mc {
    font-size:14px;
}
#msg-div {
    position:absolute;
    top:10px;
    width:250px;
    z-index:20000;
    color:#F1E1D3;
    display:block;
	right:1px!important;
	right:18px;
}
</style>
</head>
<body>
<script type="text/javascript">
Ext.onReady(function(){
    var toolbar = new Ext.Toolbar( [ 
    {
		text : '测试信息提示',
		handler : addBookType
	}, {
		text : '修改',
		iconCls : 'option'
	}, {
		text : '删除',
		iconCls : 'remove'
	}
	]);
    toolbar.render('toolBar-div');
	function addBookType(){
		Ext.CommonJS.msg('信息提示','测试信息显示00001abcdefg.');
	}
});
</script>
<div id='toolBar-div' style="width:100%; height:100%;"></div>
</body>
</html>