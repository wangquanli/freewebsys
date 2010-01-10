<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
</head>
<body>
<script type="text/javascript">
Ext.onReady(function() {
	/** ************************************ListPanel分页面板开始.***************************************** */
		// 定义数据集对象
		var maxPageSize = 10;
		var pageStore = new Ext.data.Store( {// 配置分组数据集
			autoLoad : {params : {start : 0,limit : maxPageSize}},
			// 默认加载参数：start=0，limit=6
			reader : new Ext.data.JsonReader( {
				root : 'items',id : 'id',//设置ID为主键.
				totalProperty : 'results',
				fields: ['id','email', 'name']//json返回数据配置.
			} ),
			proxy : new Ext.data.HttpProxy( {url : 'listUser.action'}),
			remoteSort: true//服务端排序.
		});
		var cb = new Ext.grid.CheckboxSelectionModel();//单选按钮.
		var gridColumns = [//Grid列表显示数据.
			cb, 
			{header: "类型编号", width: 120, dataIndex: 'id', sortable: true},
			{header: "email", width: 120, dataIndex: 'email', sortable: true},
			{header: "姓名", width: 120, dataIndex: 'name', sortable: true}
		];

		// 创建工具栏组件
		var toolbar = new Ext.Toolbar([//设置不同权限可以隐藏下面按钮.样式/common/css/style.css
			{text : '新增',iconCls : 'addCls',handler : addBookType},
			{text : '修改',iconCls : 'editCls',handler : modifyBookType},
			{text : '删除',iconCls : 'removeCls',handler : deleteBookType},
			"<span style='text-align:center;'>&nbsp;&nbsp;email</span><input id=email_search type=text width=60px;>",
			"<span style='text-align:center;'>&nbsp;&nbsp;姓名</span><input id=name_search type=text width=60px;>",
			{text : '查询',iconCls : 'searchCls',handler : searchBookType},
			"&nbsp;&nbsp;<a href='#' id='more_button'>更多</a>"
		]);
		function searchBookType(){
			var email_search = Ext.get('email_search').getValue();
			var name_search = Ext.get('name_search').getValue();
			pageStore.load({params: {
				start: 0,limit: maxPageSize,
				email: email_search,
				name: name_search
			}});//这样写解决 分页到 到其他页,然后查询.分页参数设置首页问题.
		}
		
		// 创建Grid表格组件
		var bookTypeGrid = new Ext.grid.GridPanel( {
			tbar : toolbar,loadMask : false,// 载入遮罩动画,
			applyTo : 'grid-div',//定义一个绑定div的ID.
			store : pageStore,frame:true,//frame这里指的是加了一个边框.IE会有点错位.
			viewConfig : { autoFill : false },
			sm : cb,//单选按钮.在列表最前面的.
			columns : gridColumns,
			bbar : new Ext.PagingToolbar( {// 分页工具栏
				store : pageStore,displayInfo : true,
				pageSize : maxPageSize,//每页显示的条数,用于系统自动计算它的start值
				displayMsg : '当前  {0}- {1} 共 {2}条记录', emptyMsg : "没有记录"
			})
		});
		
		/** ************************************ListPanel分页面板结束.***************************************** */

		/** ************************************FormPanel面板开始.***************************************** */
		Ext.QuickTips.init();
		Ext.form.Field.prototype.msgTarget = 'side';// 统一指定错误信息提示方式
		var bookTypeForm = new Ext.FormPanel( {
			frame : true,border : false,labelSeparator : "：",
			items : [ 
				{xtype : 'textfield',width : 200,allowBlank : false,blankText : '姓名不能为空',name : 'name',fieldLabel : '姓名'},
				{xtype : 'textfield',width : 200,allowBlank : false,blankText : 'email不能为空',name : 'email',fieldLabel : 'email'},
				{xtype : 'hidden',name : 'id'} 
			],
			buttons : [ {
				text : '保存',
				handler : function() {
					bookTypeForm.form.submit( {
						clientValidation : true,
						url : 'saveUser.action',
						method : 'POST',
						success : function(form, action) {
							pageStore.reload();/*重新刷新数据.*/
							win.hide();Ext.Msg.alert('提示', '保存数据成功。');
						},
						failure : function(form, action) {
							Ext.Msg.alert('提示', '保存数据失败！');
						}
					});
				}
			}, 
			{text : '关闭',handler : function() { win.hide(); } }
			]
		});
		// 创建弹出窗口
		var win = new Ext.Window( {
			title: '测试信息CRUD',layout: 'fit',
			closeAction: 'hide' ,width: 380 ,height: 200,
			resizable: false ,modal: false ,shadow: false,//显示遮罩.
			closable: true,bodyStyle : 'padding:5 5 5 5',
			animCollapse : false,
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
				params : {id : recs[0].get('id') },
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
					var selection = bookTypeGrid.getSelectionModel().getSelections();
					var selectIds = '';
					for ( var i = 0; i < selection.length; i++) {
						selectIds += selection[i].get('id') + ',';
					}
					Ext.Ajax.request( {
						url : 'deleteUser.action',
						params : { ids : selectIds },
						method : 'POST',
						success : function(response, options) {
							pageStore.reload();/*重新刷新数据.*/
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
</script>
<div id='grid-div' style="width:100%; height:100%;"></div>
</body>
</html>