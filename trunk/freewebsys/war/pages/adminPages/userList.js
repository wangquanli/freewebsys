Ext.onReady(function() {
	/** ************************************ListPanel分页面板开始.***************************************** */
		// 定义数据集对象
		var typeStore = new Ext.data.Store( {// 配置分组数据集
					autoLoad : {
						params : {
							start : 0,
							limit : 6
						}
					},
					// 默认加载参数：start=0，limit=6
					reader : new Ext.data.JsonReader( {
						root : 'items',
						totalProperty : 'results',
						id : 'id',
						fields: ['id','email', 'name']
					} ),
					proxy : new Ext.data.HttpProxy( {
						url : 'listUser.action'
					})
				});
		var cb = new Ext.grid.CheckboxSelectionModel();
		var gridColumns = [// 配置表格列
		cb, {
			header : "类型编号",
			width : 120,
			dataIndex : 'id',
			sortable : true
		}, {
			header : "email",
			width : 120,
			dataIndex : 'email',
			sortable : true
		}, {
			header : "姓名",
			width : 120,
			dataIndex : 'name',
			sortable : true
		} ];

		// 创建工具栏组件
		var toolbar = new Ext.Toolbar( [ {
			text : '新增',
			iconCls : 'add',
			handler : addBookType
		}, {
			text : '修改',
			iconCls : 'option',
			handler : modifyBookType
		}, {
			text : '删除',
			iconCls : 'remove',
			handler : deleteBookType
		} ]);
		// 创建Grid表格组件
		var bookTypeGrid = new Ext.grid.GridPanel( {
			/** 定义一个绑定div的ID. */
			applyTo : 'grid-div',
			tbar : toolbar,
			frame : true,
			store : typeStore,
			viewConfig : {
				autoFill : false
			},
			// width : '100%',
			// height: 200,
			/** 设置全选组件. */
			sm : cb,
			columns : gridColumns,
			bbar : new Ext.PagingToolbar( {// 分页工具栏
						store : typeStore,
						pageSize : 6,// 每页显示的条数。用于系统自动计算它的start值
						displayInfo : true,
						displayMsg : '当前  {0}- {1} 共 {2}条记录',
						emptyMsg : "没有记录"
					})

		});
		/** ************************************ListPanel分页面板结束.***************************************** */

		/** ************************************FormPanel面板开始.***************************************** */
		Ext.QuickTips.init();
		Ext.form.Field.prototype.msgTarget = 'side';// 统一指定错误信息提示方式
		var bookTypeForm = new Ext.FormPanel( {
			labelSeparator : "：",
			frame : true,
			border : false,
			items : [ 
			{
				xtype : 'textfield',
				width : 200,
				allowBlank : false,
				blankText : '姓名不能为空',
				name : 'name',
				fieldLabel : '姓名'
			},{
				xtype : 'textfield',
				width : 200,
				allowBlank : false,
				blankText : 'email不能为空',
				name : 'email',
				fieldLabel : 'email'
			}, {
				xtype : 'hidden',
				name : 'id'
			} ],
			buttons : [ {
				text : '保存',
				handler : function() {
					bookTypeForm.form.submit( {
						clientValidation : true,
						url : 'saveUser.action',
						method : 'POST',
						success : function(form, action) {
							typeStore.reload();/*重新刷新数据.*/
							win.hide();
							Ext.Msg.alert('提示', '保存数据成功。');
						},
						failure : function(form, action) {
							Ext.Msg.alert('提示', '保存数据失败！');
						}
					});
				}
			}, {
				text : '关闭',
				handler : function() {
					win.hide();
				}
			} ]
		});
		// 创建弹出窗口
		var win = new Ext.Window( {
			title : '测试信息CRUD',
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

		// 新建操作.
		function addBookType() {
			bookTypeForm.form.reset();/* 清空数据. */
			win.show();
		}
		// 修改操作.
		function modifyBookType() {
			var recs = bookTypeGrid.getSelectionModel().getSelections();
			if (recs.length != 1) {/* 判断只能选择一条数据. */
				Ext.Msg.alert('提示', '请选择一条数据');
				return;
			}
			bookTypeForm.form.reset();
			bookTypeForm.form.load( {
				url : 'getUser.action',/* 请求的url地址 */
				params : {
					id : recs[0].get('id')
				},
				method : 'POST',
				failure : function(form, action) {/* 取得数据失败. */
					Ext.Msg.alert('提示', '读取数据失败！');
					return;
				}
			});
			win.show();/* 只有在成功的时候才弹出页面. */

		}
		// 删除操作.
		function deleteBookType() {
			Ext.MessageBox.confirm("提示", "您确定要删除所选书籍类型吗？", function(btnId) {
				if (btnId == 'yes') {
					var selection = bookTypeGrid.getSelectionModel()
							.getSelections();
					var selectIds = '';
					for ( var i = 0; i < selection.length; i++) {
						selectIds += selection[i].get('id') + ',';
					}
					Ext.Ajax.request( {
						url : 'deleteUser.action',
						params : {
							ids : selectIds
						},
						method : 'POST',
						success : function(response, options) {
							typeStore.reload();/*重新刷新数据.*/
							Ext.Msg.alert('提示', '删除数据成功。');
						},
						failure : function(response, options) {
							Ext.Msg.alert('提示', '删除数据失败！');
						}
					});
				}
			})
		}
		/** ************************************FormPanel面板结束.***************************************** */
	});