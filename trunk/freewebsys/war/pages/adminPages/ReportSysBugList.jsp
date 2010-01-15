<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ReportSysBug列表</title>
</head>
<body>
<script type="text/javascript">
Ext.onReady(function() {
	/** ************************************ListPanel分页面板开始.***************************************** */
		// 定义数据集对象
		var reportSysBugMaxPageSize = 10;
		var reportSysBugPageStore = new Ext.data.Store( {// 配置分组数据集
			autoLoad: {params: {start: 0,limit: reportSysBugMaxPageSize}},
			// 默认加载参数：start=0，limit=6
			reader: new Ext.data.JsonReader( {
				root: 'items',id: 'id',//设置ID为主键.
				totalProperty: 'results',
				fields: ['id','contactName','contactEmail','createDate','tittle','bugDesc','suggest']//json返回数据配置.
			} ),
			proxy: new Ext.data.HttpProxy( {url: 'listReportSysBug.action'}),
			remoteSort: true//服务端排序.
		});
		var reportSysBugCB = new Ext.grid.CheckboxSelectionModel();//单选按钮.
		var reportSysBugGridColumns = [//Grid列表显示数据.
			reportSysBugCB, 
			{header: "联系人", width: 120, dataIndex: 'contactName', sortable: true},
			{header: "联系Email", width: 120, dataIndex: 'contactEmail', sortable: true},
			{header: "创建时间", width: 120, dataIndex: 'createDate', sortable: true},
			{header: "标题", width: 120, dataIndex: 'tittle', sortable: true},
			{header: "bug描述", width: 120, dataIndex: 'bugDesc', sortable: true},
			{header: "建议", width: 120, dataIndex: 'suggest', sortable: true}
		];

		// 创建工具栏组件
		var reportSysBugToolbar = new Ext.Toolbar([//设置不同权限可以隐藏下面按钮.样式/common/css/style.css
			{text: '新增',iconCls: 'addCls',handler: addReportSysBug},
			'-',{text: '修改',iconCls: 'editCls',handler: modifyReportSysBug},
			'-',{text: '删除',iconCls: 'removeCls',handler: deleteReportSysBug},
			'-','标题: ', {xtype: 'textfield',id: 'tittle_search', width : 120},
			'-',{text: '查询',iconCls: 'searchCls',handler: searchReportSysBug}
		]);
		function searchReportSysBug(){
			var tittle_search = Ext.get('tittle_search').getValue();
			reportSysBugPageStore.load({params: {
				start: 0 ,limit: reportSysBugMaxPageSize,
				tittle: tittle_search
			}});//这样写解决 分页到 到其他页,然后查询.分页参数设置首页问题.
		}
		
		// 创建Grid表格组件
		var reportSysBugGrid = new Ext.grid.GridPanel( {
			tbar: reportSysBugToolbar ,layout: 'fit' ,loadMask: false,// 载入遮罩动画,
			border:false,applyTo: 'reportSysBug-grid-div',//定义一个绑定div的ID.
			store: reportSysBugPageStore,frame: false,//frame这里指的是加了一个边框.IE会有点错位.
			viewConfig: { autoFill: true },
			sm: reportSysBugCB,//单选按钮.在列表最前面的.
			columns: reportSysBugGridColumns , stripeRows: true,//显示不同颜色.
			bbar: new Ext.PagingToolbar( {// 分页工具栏
				store: reportSysBugPageStore,displayInfo: true,
				pageSize: reportSysBugMaxPageSize,//每页显示的条数,用于系统自动计算它的start值
				displayMsg: '当前  {0}- {1} 共 {2}条记录', emptyMsg: "没有记录"
			})
		});
		/** ************************************ListPanel分页面板结束.***************************************** */

		/** ************************************FormPanel面板开始.***************************************** */
		Ext.QuickTips.init();
		Ext.form.Field.prototype.msgTarget = 'side';// 统一指定错误信息提示方式
		var reportSysBugHtmlEditor =new Ext.form.HtmlEditor({  
	        name: 'content', 
	        enableFont: false,  enableLinks: false ,enableSourceEdit: false, //字体.//设置链接.//源文件编辑.  
	        width:350
	    });
		var reportSysBugForm = new Ext.FormPanel( {
			frame: true,border: false,labelSeparator: "：",
			items: [ 
				{xtype: 'textfield',width: 200,allowBlank: true,blankText: '联系人不能为空',name: 'contactName',fieldLabel: '联系人'},
				{xtype: 'textfield',width: 200,allowBlank: true,blankText: '联系Email不能为空',name: 'contactEmail',fieldLabel: '联系Email'},
				/*{xtype: 'textfield',width: 200,allowBlank: false,blankText: '创建时间不能为空',name: 'createDate',fieldLabel: '创建时间'},*/
				{xtype: 'textfield',width: 200,allowBlank: false,blankText: '标题不能为空',name: 'tittle',fieldLabel: '标题'},
				{xtype: 'textfield',width: 200,allowBlank: false,blankText: 'bug描述不能为空',name: 'bugDesc',fieldLabel: 'bug描述'},
				{xtype: 'textfield',width: 200,allowBlank: true,blankText: '建议不能为空',name: 'suggest',fieldLabel: '建议'},
				{xtype: 'hidden',name: 'id'} 
			],
			buttons: [ {
				text: '保存',
				handler: function() {
					if(reportSysBugForm.form.isValid()){/*验证所有表单元素*/
						reportSysBugForm.form.submit( {
							clientValidation: true,
							url: 'saveReportSysBug.action',
							method: 'POST',
							success: function(form, action) {
								if(action.result.success == 'true'){//判断返回成功失败.
									reportSysBugWin.hide();reportSysBugPageStore.reload();/*重新刷新数据.*/
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
			{text: '关闭',handler: function() { reportSysBugWin.hide(); } }
			]
		});
		// 创建弹出窗口
		var reportSysBugWin = new Ext.Window( {
			title: 'ReportSysBug',layout: 'fit',
			closeAction: 'hide' ,width: 380 ,height: 400,
			resizable: false ,shadow: true, modal: false ,//显示遮罩.
			closable: true,bodyStyle: 'padding:5 5 5 5',
			animCollapse: false,
			items: [ reportSysBugForm ]
		});

		// 新建操作.
		function addReportSysBug() {
			reportSysBugForm.form.reset();/* 清空数据. */
			reportSysBugWin.show();
		}
		// 修改操作.
		function modifyReportSysBug() {
			var recs = reportSysBugGrid.getSelectionModel().getSelections();
			if (recs.length != 1) {/* 判断只能选择一条数据. */
				Ext.CommonJS.msg('提示', '请选择一条数据。');
				return;
			}
			reportSysBugForm.form.reset();
			reportSysBugForm.form.load( {
				url: 'getReportSysBug.action',params: {id: recs[0].get('id') },method: 'POST',
				failure: function(form, action) {/* 取得数据失败. */
					Ext.CommonJS.msg('提示', '读取数据异常！');return;
				}
			});
			reportSysBugWin.show();/* 只有在成功的时候才弹出页面. */
		}
		// 删除操作.
		function deleteReportSysBug() {
			var selection = reportSysBugGrid.getSelectionModel().getSelections();
			if (selection.length < 1) {/* 判断至少选择一条数据. */
				Ext.CommonJS.msg('提示', '请至少选择一条数据。');return;
			}
			var selectIds = '';
			for ( var i = 0; i < selection.length; i++) {
				selectIds += selection[i].get('id') + ',';
			}
			Ext.MessageBox.confirm("提示", "您确定要删除所选书籍类型吗？", function(btnId) {
				if (btnId == 'yes') {
					Ext.Ajax.request( {
						url: 'deleteReportSysBug.action', params: { ids: selectIds }, method: 'POST',
						success: function(response, options) {
							if(Ext.decode(response.responseText).success == 'true'){//特殊写法.判断返回成功失败.
								reportSysBugPageStore.reload();/*重新刷新数据.*/
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
<div id='reportSysBug-grid-div' style="width:100%; height:100%;"></div>
</body>
</html>