Ext.onReady(function() {
	/** ************************************登录页面开始.***************************************** */
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = 'side';// 统一指定错误信息提示方式
		var userLoginForm = new Ext.FormPanel( {
			labelSeparator : "：",
			frame : true,
			border : false,
			items : [ {
				xtype : 'textfield',
				width : 200,
				allowBlank : false,
				blankText : '用户名不能为空',
				name : 'loginName',
				fieldLabel : '用户名'
			}, {
				xtype : 'textfield',
				width : 200,
				allowBlank : false,
				blankText : '密码不能为空',
				name : 'passwd',
				fieldLabel : '密码'
			}, {
				xtype : 'hidden',
				name : 'id'
			} ],
			buttons : [ {
				text : '登录',
				handler : function() {
					userLoginForm.form.submit( {
						clientValidation : true,
						url : 'loginUser.action',
						method : 'POST',
						success : function(form, action) {
							win.hide();
							Ext.Msg.alert('提示', '用户登录成功。');
						},
						failure : function(form, action) {
							Ext.Msg.alert('提示', '用户名密码错误,登录失败！');
						}
					});
				}
			}, {
				text : '清空',
				handler : function() {
					userLoginForm.form.reset();
				}
			} ]
		});
		// 创建弹出窗口
		var win = new Ext.Window( {
			title : '用户登录窗口.',
			layout : 'fit',
			width : 380,
			closeAction : 'hide',
			height : 200,
			resizable : false,
			shadow : false,
			modal : true,
			closable : false,
			bodyStyle : 'padding:5 5 5 5',
			animCollapse : true,
			items : [ userLoginForm ]
		});

		win.show();/* 显示登录窗口. */
		/** ************************************登录页面结束.***************************************** */
	});