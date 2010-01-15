<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/test/commonHead.jsp"%>
</head>
<body>
<style type="text/css">
.web_clip_button {
	border: 1px solid #3399FF;
	background-color: #FFFF99;
	width: 8px;
	height: 8px;
	cursor: pointer;
	font-size: 85%;
	font-weight: bold;
	margin: 1px;
	padding: 0px 3px;
}

.head_main_div {
	margin: 2px;
	width: 100%;
}
.head_top_right_div {
	width: 20%;
	float: right;
}

.web_clip_cls_main {
	border: 1px solid #3399FF;
	width: 80%;
	text-align: left;
	margin: 2px;
	float: left;
}

.web_clip_cls_left {
	float: left;
	width: 90%;
	text-align: left;
	overflow: hidden;
}

.web_clip_cls_right {
	float: right;
	width: 10%;
	text-align: right;
}
</style>
<script type="text/javascript">
Ext.onReady(function(){
	var data = ["111111111111","2222222222222","333333333333","4444444444444","5555555555555"];
	//alert(data.length);
	var i = 0;
	var web_clip_panel = new Ext.Panel({
		title: '面板测试.',
		headerAsText: true, renderTo: 'panel-div',
        width:700, contentEl: 'head_main_div'
    });
	Ext.get('web_clip_prev_id').on('click', function(){
		//alert();
		Ext.fly('web_clip_content').update(data[i]);
		i = Math.abs((i - 1) % data.length + data.length) % data.length ;
	});
	Ext.get('web_clip_next_id').on('click', function(){
		Ext.fly('web_clip_content').update(data[i]);
		i = (i + 1) % data.length;
	});
	var task = {
			run: function(){
				Ext.get('web_clip_content').update(data[i]);
				i = (i + 1) % data.length;
		    },
		    interval: 30000 //30 second
	};
	var runner = new Ext.util.TaskRunner();
	runner.start(task);
});
</script>

<br></br>

<div id="head_main_div" class="web_clip_cls_main">
<div id="'web_clip_id'">
<div id="web_clip_content" class="web_clip_cls_left"></div>
<div class="web_clip_cls_right"><a class="web_clip_button"
	id="web_clip_prev_id"><</a>&nbsp;<a class="web_clip_button"
	id="web_clip_next_id">></a></div>
</div>
</div>

<div id='panel-div'
	style="width: 100%; height: 100%; text-align: center;"></div>
</body>
</html>