<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SystemUser列表</title>
</head>
<body>
<script type="text/javascript">
Ext.onReady(function() {
	/** ************************************ListPanel分页面板开始.***************************************** */
		// 定义数据集对象
		var maxPageSize = 10;
		var pageStore = new Ext.data.Store( {// 配置分组数据集
			autoLoad: {params: {start: 0,limit: maxPageSize}},
			// 默认加载参数：start=0，limit=6
			reader: new Ext.data.JsonReader( {
				root: 'items',id: 'id',//设置ID为主键.
				totalProperty: 'results',
				fields: ['id','loginName','name','phone','email','createDate','islock','loginTimes','lastLogin']//json返回数据配置.
			} ),
			proxy: new Ext.data.HttpProxy( {url: 'listSystemUser.action'}),
			remoteSort: true//服务端排序.
		});
		var cb = new Ext.grid.CheckboxSelectionModel();//单选按钮.
		var gridColumns = [//Grid列表显示数据.
			cb, 
			{header: "登录名", width: 120, dataIndex: 'loginName', sortable: true},
			{header: "姓名", width: 120, dataIndex: 'name', sortable: true},
			{header: "电话", width: 120, dataIndex: 'phone', sortable: true},
			{header: "email", width: 120, dataIndex: 'email', sortable: true},
			{header: "创建时间", width: 120, dataIndex: 'createDate', sortable: true},
			{header: "是否锁定", width: 120, dataIndex: 'islock', sortable: true},
			{header: "登录次数", width: 120, dataIndex: 'loginTimes', sortable: true},
			{header: "最后登录时间", width: 120, dataIndex: 'lastLogin', sortable: true}
		];

		// 创建工具栏组件
		var toolbar = new Ext.Toolbar([//设置不同权限可以隐藏下面按钮.样式/common/css/style.css
			{text: '新增',iconCls: 'addCls',handler: addSystemUser},
			'-',{text: '修改',iconCls: 'editCls',handler: modifySystemUser},
			'-',{text: '删除',iconCls: 'removeCls',handler: deleteSystemUser},
			'-','登录名: ', {xtype: 'textfield',id: 'loginName_search', width : 80}, 
			'-','姓名: ', {xtype: 'textfield',id: 'name_search', width : 80}, 
			'-',{text: '查询',iconCls: 'searchCls',handler: searchSystemUser}
		]);
		function searchSystemUser(){
			var loginName_search = Ext.get('loginName_search').getValue();
			var name_search = Ext.get('name_search').getValue();
			pageStore.load({params: {
				start: 0 ,limit: maxPageSize,
				loginName: loginName_search,
				name: name_search
			}});//这样写解决 分页到 到其他页,然后查询.分页参数设置首页问题.
		}
		
		// 创建Grid表格组件
		var systemUserGrid = new Ext.grid.GridPanel( {
			tbar: toolbar ,layout: 'fit' ,loadMask: false,border:false,// 载入遮罩动画,
			applyTo: 'grid-div',//定义一个绑定div的ID.
			store: pageStore,frame: false,//frame这里指的是加了一个边框.IE会有点错位.
			viewConfig: { autoFill: true },
			sm: cb,//单选按钮.在列表最前面的.
			columns: gridColumns, stripeRows: true,//显示不同颜色.
			bbar: new Ext.PagingToolbar( {// 分页工具栏
				store: pageStore,displayInfo: true,
				pageSize: maxPageSize,//每页显示的条数,用于系统自动计算它的start值
				displayMsg: '当前  {0}- {1} 共 {2}条记录', emptyMsg: "没有记录"
			})
		});
		/** ************************************ListPanel分页面板结束.***************************************** */

		/** ************************************FormPanel面板开始.***************************************** */
		Ext.QuickTips.init();
		Ext.form.Field.prototype.msgTarget = 'side';// 统一指定错误信息提示方式
		var systemUserForm = new Ext.FormPanel( {
			frame: true,border: false,labelSeparator: "：",
			items: [ 
				{xtype: 'textfield',width: 200,allowBlank: false,blankText: '登录名不能为空',name: 'loginName',fieldLabel: '登录名'},
				{xtype: 'textfield',width: 200,allowBlank: false,blankText: '密码不能为空',name: 'passwd',fieldLabel: '密码'},
				{xtype: 'textfield',width: 200,allowBlank: false,blankText: '姓名不能为空',name: 'name',fieldLabel: '姓名'},
				{xtype: 'textfield',width: 200,allowBlank: false,blankText: '电话不能为空',name: 'phone',fieldLabel: '电话'},
				{xtype: 'textfield',width: 200,allowBlank: false,blankText: 'email不能为空',name: 'email',fieldLabel: 'email'},
				{xtype: 'checkbox',width: 200,allowBlank: false,blankText: '是否锁定不能为空',name: 'islock',fieldLabel: '是否锁定'},
				{xtype: 'hidden',name: 'id'} 
			],
			buttons: [ {
				text: '保存',
				handler: function() {
                	if(systemUserForm.form.isValid()){/*验证所有表单元素*/
	               		systemUserForm.form.submit( {
	   						clientValidation: true,
	   						url: 'saveSystemUser.action',
	   						method: 'POST',
	   						success: function(form, action) {
	   							if(action.result.success == 'true'){//判断返回成功失败.
	   								win.hide();pageStore.reload();/*重新刷新数据.*/
	   								Ext.CommonJS.msg('提示', '保存数据成功。');
	   							}else{
	   								Ext.CommonJS.msg('提示', '保存数据失败！');
	   							}
	   						},
	   						failure: function(form, action) {
	   							Ext.CommonJS.msg('提示', '保存数据异常！');
	   						}
	   					});
                	}
				}
			}, 
			{text: '关闭',handler: function() { win.hide(); } }
			]
		});
		// 创建弹出窗口
		var win = new Ext.Window( {
			title: '系统用户',layout: 'fit',
			closeAction: 'hide' ,width: 380 ,height: 330,
			resizable: false ,shadow: true ,modal: false ,//显示遮罩.
			closable: true,bodyStyle: 'padding:5 5 5 5',
			animCollapse: false,
			items: [ systemUserForm ]
		});

		// 新建操作.
		function addSystemUser() {
			systemUserForm.form.reset();/* 清空数据. */
			win.show();
		}
		// 修改操作.
		function modifySystemUser() {
			var recs = systemUserGrid.getSelectionModel().getSelections();
			if (recs.length != 1) {/* 判断只能选择一条数据. */
				Ext.CommonJS.msg('提示', '请选择一条数据');
				return;
			}
			systemUserForm.form.reset();
			systemUserForm.form.load( {
				url: 'getSystemUser.action',params: {id: recs[0].get('id') },method: 'POST',
				failure: function(form, action) {/* 取得数据失败. */
					Ext.CommonJS.msg('提示', '读取数据异常！');return;
				}
			});
			win.show();/* 只有在成功的时候才弹出页面. */
		}
		// 删除操作.
		function deleteSystemUser() {
			var selection = systemUserGrid.getSelectionModel().getSelections();
			if (selection.length < 1) {/* 判断至少选择一条数据. */
				Ext.CommonJS.msg('提示', '请至少选择一条数据。');return;
			}
			var selectIds = '';
			for ( var i = 0; i < selection.length; i++) {
				selectIds += selection[i].get('id') + ',';
			}
			Ext.MessageBox.confirm("提示", "您确定要删除所选吗？", function(btnId) {
				if (btnId == 'yes') {
					Ext.Ajax.request( {
						url: 'deleteSystemUser.action', params: { ids: selectIds }, method: 'POST',
						success: function(response, options) {
							if(Ext.decode(response.responseText).success == 'true'){//特殊写法.判断返回成功失败.
								pageStore.reload();/*重新刷新数据.*/
								Ext.CommonJS.msg('提示', '删除数据成功。');
							}else{
								Ext.CommonJS.msg('提示', '删除数据失败！');
							}
						},
						failure: function(response, options) {
							Ext.CommonJS.msg('提示', '删除数据异常！');
						}
					});
				}
			})
		}
		/** ************************************FormPanel面板结束.***************************************** */
	});
</script>
<div id='grid-div' style="width:100%; height:100%;"></div>
</body>
</html>