Ext.onReady(function(){
	/*测试数据.*/
	var data = ["欢迎登录测试系统.目前系统正在测试.功能还没有完成.请耐心等待.1111111111111111111111111 ",
	            "测试信息.这个是一个小夹子.可以自动更新.4444444444444444444",
	            "内容 又 更新了.你看了么?333333333333333333333333333",
	            "这个只是个测试.没有其他意义.2222222222222222222222222222",
	            "1111111111111111111111111111111这个是测试."];
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
			handler : function() { window.open('test/index.html', '_blank'); }
		}],
		applyTo : 'head_report_bug_button'/*将面板放入div中.*/
	});
});