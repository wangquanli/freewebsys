<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/test/commonHead.jsp"%>
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
			proxy : new Ext.data.HttpProxy( {url : 'listUser11.action'}),
			remoteSort: true//服务端排序.
		});
		var cb = new Ext.grid.CheckboxSelectionModel();//单选按钮.
		var gridColumns = [//Grid列表显示数据.
			cb, 
			{header: "email", width: 120, dataIndex: 'email', sortable: true},
			{header: "email", width: 120, dataIndex: 'email', sortable: true},
			{header: "email", width: 120, dataIndex: 'email', sortable: true},
			{header: "email", width: 120, dataIndex: 'email', sortable: true},
			{header: "姓名", width: 120, dataIndex: 'name', sortable: true}
		];

		// 创建工具栏组件
		var toolbar = new Ext.Toolbar([//设置不同权限可以隐藏下面按钮.样式/common/css/style.css
			{text : '新增',iconCls : 'addCls',handler : function(){}},
			{text : '修改',iconCls : 'editCls',handler : function(){}},
			{text : '删除',iconCls : 'removeCls',handler : function(){}},
			"<span style='text-align:center;'>&nbsp;&nbsp;email:</span><input id=email_search type=text width=60px;>",
			{text : '查询',iconCls : 'searchCls',handler : function(){}},
			"&nbsp;&nbsp;<a href='#' id='more_button'>更多</a>"
		]);

		 var tbar_search = new Ext.Toolbar({
             items : [{
                         text : '新增',
                         iconCls : 'add'
                     }, {
                         text : '修改',
                         iconCls : 'modify'
                     }]
         });
		 
		
		// 创建Grid表格组件
		var bookTypeGrid = new Ext.grid.GridPanel( {
			tbar : toolbar,loadMask : false,// 载入遮罩动画,
			applyTo : 'grid-div',//定义一个绑定div的ID.
			store : pageStore,frame:false,//frame这里指的是加了一个边框.IE会有点错位.
			viewConfig : { autoFill : false },
			sm : cb,//单选按钮.在列表最前面的.
			columns : gridColumns,
			bbar : new Ext.PagingToolbar( {// 分页工具栏
				store : pageStore,displayInfo : true,
				pageSize : maxPageSize,//每页显示的条数,用于系统自动计算它的start值
				displayMsg : '当前  {0}- {1} 共 {2}条记录', emptyMsg : "没有记录"
			})
		});
		tbar_search.render(bookTypeGrid.tbar);
		/** ************************************ListPanel分页面板结束.***************************************** */

	});
</script>
<div id='grid-div' style="width:100%; height:100%;"></div>
</body>
</html>