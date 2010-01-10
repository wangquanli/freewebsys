Ext.onReady(function() {
	Ext.BLANK_IMAGE_URL = 'extjs2.0/resources/images/default/s.gif';
	var root = new Ext.tree.TreeNode( {
		id : '0',
		text : '菜单',
		url : 'welcome.html',
		expanded : true
	// 默认展开根节点
			});
	root.appendChild(new Ext.tree.TreeNode( {
		id : '2',
		text : '用户管理',
		url : 'pages/adminPages/userList.jsp'
	}));
	for ( var i = 10; i < 30; i++) {
		root.appendChild(new Ext.tree.TreeNode( {
			id : i,
			text : '日记本' + i,
			url : 'pages/adminPages/noteInfo.jsp'
		}));
	}
	var menu = new Ext.tree.TreePanel( {
		title : '功能菜单',
		region : 'west',
		split : true,
		collapsible : true,
		collapseMode : 'mini',
		width : 200,
		minWidth : 150,
		margins : '0 0 4 4',
		root : root,
		hrefTarget : 'mainContent',
		listeners : {
			/** 添加一个监听事件.用来控制中心面板的显示. */
			click : function(node, e) {
				updateTab(node.id, node.text, node.attributes.url);
				/** 更新table 控制条. */
			}
		}
	});

	var northPanel = new Ext.Panel( {
		title : '测试系统.',
		collapseMode : 'mini',
		region : 'north',
		split : true,
		collapsible : true,
		height : 80,
		margins : '4 4 0 4'
	});

	// 主面板（已有tab）
		var tabPanel = new Ext.TabPanel( {
			scripts : true,
			tabWidth : 120,
			region : 'center',
			deferredRender : false,
			autoScroll : true,
			margins : '0 4 4 0',
			activeTab : 0,loadMask : false,// 载入遮罩动画
			enableTabScroll : true,/* 当有多个tab的时候溢出显示. */
			items : [ {
				id : 'tab1',
				autoLoad : {
					url : 'welcome.html',
					/** 初始化jsp.也就是首页. */
					callback : this.initSearch,
					scope : this
				},
				title : '首页',
				closable : false,/** 设置不可以关闭. */
				autoScroll : true
			} ]
		});
		// 在中间的面板加入tab添加TabId标题.和url参数.
		function addTab(tabId, tabTitle, targetUrl) {
			tabPanel.add( {
				id : tabId,
				title : tabTitle,
				iconCls : 'tabs',
				autoScroll : false,/*不将子窗口带滚动条.*/
				autoLoad : {
					scripts : true,/* 添加执行子js. */
					animate : false,/* 动画效果 */
					nocache : true,
					url : targetUrl,
					callback : this.initSearch,
					scope : this
				},
				closable : true
			}).show();
		}

		/** 更新tab内容，如不存在就新建一个 */
		function updateTab(tabId, title, url) {
			var tab = tabPanel.getItem(tabId);
			if (tab) {
				tab.getUpdater().update(url);
				tab.setTitle(title);
			} else {
				tab = addTab(tabId, title, url);
			}
			tabPanel.setActiveTab(tab);
		}
		/** 映射连接的id到函数 */

		// 配置视图viewport
		var viewport = new Ext.Viewport( {
			layout : 'border',
			items : [ northPanel, menu, tabPanel ]
		});

		Ext.fly('loading').hide();
	});