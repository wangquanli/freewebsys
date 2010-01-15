<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/test/commonHead.jsp"%>
</head>
<body>
<style type="text/css">
/* 顶部小夹子开始.*/
#head_main_div {
	margin: 2px;
	width: 100%;
}
.web_clip_cls_main {/* 顶部小夹子main .是左侧面板.*/
	border: 1px solid #3399FF;
	width: 40%;
	text-align: left;
	margin: 2px;
	float: left;
}

.web_clip_cls_left {/* 顶部小夹子左面面板..*/
	float: right;
	width: 87%;
	text-align: left;
	overflow: hidden;
	font-size: x-small;
	
}
.web_clip_cls_right {/* 顶部小夹子右侧面板.*/
	float: right;
	width: 13%;
	text-align: left;
}
.web_clip_button {/* 顶部小夹子button样式..*/
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
/* 顶部小夹子结束.*/
/* 顶部button 样式开始.*/
#head_top_right_div {/* 顶部button.右侧面板.*/
	width: 18%;
	float: right;text-align: right;
	height: 22px;margin-top: 2px;
}
#head_logout_button {
	border: 1px solid #3399FF;
	float: right;margin-left: 2px;width: 58px;height:22px;
}
#head_report_bug_button {
	border: 1px solid #3399FF;
	float: right;margin-left: 2px;width: 58px;height:22px;
}
/* 顶部button 样式结束..*/
</style>
<script type="text/javascript">
Ext.onReady(function(){
	var web_clip_panel = new Ext.Panel({/*顶部主面板*/
		title : '测试系统.',
		height : 79,
		margins : '4 4 0 4',
		title: '面板测试.',
		headerAsText: true, renderTo: 'panel-div',
        width:900, contentEl: 'head_main_div' /*绑定 div id .*/
    });

	//logoutButton.addListener('on',function(){alert('');});
});

/*测试是否可以放到两个单独的js里面..*/

Ext.onReady(function(){
	/*测试数据.*/
	var data = ["111111111111111111111111111111111111111111111111111111111111777777777777777777777777777771111111","2222222222222","333333333333","4444444444444","5555555555555"];
	//alert(data.length);
	var i = 0;
	Ext.get('web_clip_prev_id').on('click', function(){/*前一页 button.*/
		Ext.fly('web_clip_content').update(data[i]);
		i = Math.abs((i - 1) % data.length + data.length) % data.length ;
	});
	Ext.get('web_clip_next_id').on('click', function(){/*下一页 button.*/
		Ext.fly('web_clip_content').update(data[i]);
		i = (i + 1) % data.length;
	});
	var task = {/*定时器.用于自动循环数据.默认启动 是 1.下一页.*/
			run: function(){
				Ext.get('web_clip_content').update(data[i]);
				i = (i + 1) % data.length;
		    },
		    interval: 30000/*30秒循环一次..*/
	};
	var runner = new Ext.util.TaskRunner();
	runner.start(task);
	

	new Ext.Panel({/*退出 按钮.*/
		border : false,
		items : [{ xtype : 'button',text : '退出' , 
			handler : function() { alert('Click You clicked on "Action 1".'); }
		}],
		applyTo : 'head_logout_button'/*将面板放入div中.*/
	});
	
	new Ext.Panel({/*提交bug 按钮..*/
		border : false,
		items : [{ xtype : 'button',text : '  Bug  ' , 
			handler : function() { alert('Click You clicked on "Action 1".'); }
		}],
		applyTo : 'head_report_bug_button'/*将面板放入div中.*/
	});
});
</script>

<br></br>

<!-- 顶部divmain 开始. -->
<div id="head_main_div">
<!-- 顶部 小 夹子 开始. -->
<div id="'web_clip_id'" class="web_clip_cls_main">
<div id="web_clip_content" class="web_clip_cls_left"></div>
<div class="web_clip_cls_right"><a class="web_clip_button"
	id="web_clip_prev_id"><</a>&nbsp;<a class="web_clip_button"
	id="web_clip_next_id">></a></div>
</div>
<!-- 顶部 小 夹子结束. -->
<!-- 右侧 button 开始. -->
<div id="head_top_right_div">
<div id="head_report_bug_button"></div>
<div id="head_logout_button"></div>
</div>
<!-- 右侧 button 结束. -->
</div>
<!-- 顶部divmain 结束. -->

<div id='panel-div'
	style="width: 100%; height: 100%; text-align: center;"></div>
</body>
</html>