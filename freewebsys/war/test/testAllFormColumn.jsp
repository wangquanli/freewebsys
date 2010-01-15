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
	var html_editor =new Ext.form.HtmlEditor({  
        name: 'content', 
        enableFont: false,  enableLinks: false ,enableSourceEdit: false, //字体.//设置链接.//源文件编辑.  
        width:350
    });  
	var bookTypeForm = new Ext.FormPanel( {
		labelSeparator: ":",
		//labelAlign: 'top',//这个设定主要是为富文本编辑器的.
		frame : true,
		border : false,
		items: [
			{xtype:'textfield',fieldLabel: 'First Name',name: 'first',width: 200}, 
	    	{xtype:'textfield',fieldLabel: 'Company',name: 'company',width: 200},
	    	{xtype:'hidden',fieldLabel: '内容',name: 'company',width: 200},
	    	//{xtype:'label', html: 'Label 1'},
	    	{columnWidth:.5, layout: 'column', border:false , items: [html_editor] },
	    	{xtype:'checkbox',fieldLabel: 'checkbox测试',name: 'company',width: 200},
	    	{xtype:'combo',fieldLabel: 'combo测试',name: 'company',width: 200},
	    	{xtype:'datefield',fieldLabel: 'datefield测试',name: 'company',width: 200},
	    	{xtype:'field',fieldLabel: 'field测试',name: 'company',width: 200},
	    	{xtype:'hidden',fieldLabel: 'hidden测试.',name: 'company',width: 200},
	    	{xtype:'numberfield',fieldLabel: 'numberfield测试',name: 'company',width: 200},
	    	{xtype: 'panel', layout: 'table', fieldLabel: '性别', defaultType: 'radio', isFormField: true,width: 200,
			    items: [
			    	{boxLabel: '1测试',name: 'company11',value: '1'},
			    	{boxLabel: '<span style="font-size: x-small;">2测试</span>',name: 'company11',value: '2'},
			    	{boxLabel: '<span style="font-size: x-small;">3测试</span>',name: 'company11',value: '3'}
		    	]
		    },
	    	{xtype:'textfield',fieldLabel: 'textfield测试',name: 'company',width: 200},
	    	{xtype:'timefield',fieldLabel: 'timefield测试',name: 'company',width: 200},
	    	{xtype:'trigger',fieldLabel: 'trigger测试',name: 'company',width: 200}
        ],
		buttons : [ 
		   	{text : '关闭',handler : function() {win.hide();}}, 
		   	{text : '提交',handler : function(){} }
		]
	});
	// 创建弹出窗口
	var win = new Ext.Window( {
		layout : 'fit',width : 400 ,closeAction : 'hide', animCollapse : true,
		height : 600,resizable : false, shadow : true,
		modal : false, closable : true, bodyStyle : 'padding:5 5 5 5',
		items : [ bookTypeForm ]
	});
	Ext.get('myButton').on('click', 
			function(){
		alert("You clicked the button"); 
		win.setTitle("测试信息.");
		win.show();
	});


});
</script>
<button type="button" id="myButton">测试.</button>
其中items下面的xtype 类型为:<br></br>
textfield,checkbox,radio,htmlEditor ,textField,textarea,hidden 	<br></br>

表单及字段组件包含：									<br></br>
---------------------------------------				<br></br>
form             Ext.FormPanel　Form面板　			<br></br>
checkbox         Ext.form.Checkbox　checkbox录入框	<br></br>
combo            Ext.form.ComboBox　combo选择项		<br></br>
datefield        Ext.form.DateField　日期选择项		<br></br>
field            Ext.form.Field　表单字段			<br></br>
fieldset         Ext.form.FieldSet　表单字段组		<br></br>
hidden           Ext.form.Hidden 表单隐藏域			<br></br>
htmleditor       Ext.form.HtmlEditor　html编辑器		<br></br>
numberfield      Ext.form.NumberField　数字编辑器	<br></br>
radio            Ext.form.Radio　单选按钮			<br></br>
textarea         Ext.form.TextArea　区域文本框		<br></br>
textfield        Ext.form.TextField　表单文本框		<br></br>
timefield        Ext.form.TimeField　时间录入项		<br></br>
trigger          Ext.form.TriggerField　触发录入项	<br></br>

组件基类Component中的配置属性简单介绍
<style type="text/css">
body
{
 margin:0;
 padding:0;
 text-align:left;
 font-size: x-small;
}
html {
 scrollbar-face-color:#d5e1f7;
 scrollbar-highlight-color:#FFFFFF;
 scrollbar-shadow-color:#DEEBF7;
 scrollbar-3dlight-color:#89b3e3;
 scrollbar-arrow-color: #121f54;
 scrollbar-track-color:#F4F0EB;
 scrollbar-darkshadow-color:#89b3e3;
}
</style>

<span style="font-size: x-small;"></span>
<div id="showLabel"></div>
</body>
</html>