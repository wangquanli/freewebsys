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
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = 'side';// 统一指定错误信息提示方式
	var bookTypeForm = new Ext.FormPanel( {
		labelSeparator : "：",
		frame : true,
		border : false,
		items : [ {
			xtype : 'textfield',
			width : 200,
			allowBlank : false,
			blankText : '类型名称不能为空',
			name : 'title',
			fieldLabel : '类型名称'
		}, {
			xtype : 'textarea',
			width : 200,
			name : 'detail',
			fieldLabel : '类型说明'
		}, {
			xtype : 'hidden',
			name : 'id'
		} ],
		buttons : [ {
			text : '关闭',
			handler : function() {
				win.hide();
			}
		}, {
			text : '提交',
			handler : function(){bookTypeForm.form.submit({
				clientValidation : true,
				url : 'testForm_do.jsp',
				method : 'POST',
				success : function(form, action) {
					win.hide();
					Ext.Msg.alert('提示', '保存书籍类型成功');
				},
				failure : function(form, action) {
					Ext.Msg.alert('提示', '保存书籍类型失败');
				}
			});}
		} ]
	});
	// 创建弹出窗口
	var win = new Ext.Window( {
		layout : 'fit',
		width : 380,
		closeAction : 'hide',
		height : 200,
		resizable : false,
		shadow : true,
		modal : true,
		closable : true,
		bodyStyle : 'padding:5 5 5 5',
		animCollapse : true,
		items : [ bookTypeForm ]
	});
	
	Ext.get('myButton').on('click', 
			function(){
		alert("You clicked the button"); 
		win.setTitle("新增书籍类型信息");
		win.show();
	});
});
</script>
<button type="button" id="myButton">测试.</button>
</body>
</html>