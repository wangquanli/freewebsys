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
    var toolbar = new Ext.Toolbar( [ {
		text : '新增',
		iconCls : 'add'
	}, {
		text : '修改',
		iconCls : 'option'
	}, {
		text : '删除',
		iconCls : 'remove'
	},
		'11111111111111'
	]);
    toolbar.render('toolBar-div');
    toolbar.add("<span style='text-align:center;'>&nbsp;&nbsp;姓名</span><input type=text width=60px;>");
    toolbar.add({
		text : '查询',
		iconCls : 'remove'
	});
});
</script>
<div id='toolBar-div' style="width:100%; height:100%;text-align: center;"></div>
</body>
</html>