Ext.onReady(
	function(){
		// 包含actions的菜单
		var tabActions = new Ext.Panel({
			frame:true, 
			title: 'Actions', 
			collapsible:true, 
			contentEl:'actions',
			titleCollapse: true 
		}); 
		// 保持actions菜单的父面板
	var actionPanel = new Ext.Panel({ 
		id:'action-panel', 
		region:'west', 
		split:true, 
		collapsible: true,
		collapseMode: 'mini', 
		width:200, 
		minWidth: 150, 
		border: false,
		baseCls:'x-plain',
		items: [tabActions] 
	}); 
	// 主面板（已有tab） 
	var tabPanel = new Ext.TabPanel({ 
		region:'center', 
		deferredRender:false, 
		autoScroll: true,
		margins:'0 4 4 0', 
		activeTab:0, 
		items:[{ id:'tab1',autoLoad: {
			url: 'index2.jsp', 
			callback: this.initSearch, 
			scope: this}
		, contentEl:'tabs', title: '首页', closable:false/**设置不可以关闭.*/, autoScroll:true }]
	}); 
	// 配置视图viewport 
	var viewport = new Ext.Viewport({ 
		layout:'border', 
		items:[actionPanel,tabPanel]
	});
	
	// 在中间的面板加入tab添加TabId标题.和url参数.
	function addTab(tabId, tabTitle, targetUrl){ 
		tabPanel.add({
			id: tabId,
			title: tabTitle, 
			iconCls: 'tabs', 
			autoLoad: {
				url: targetUrl, 
				callback: this.initSearch, 
				scope: this}, closable:true 
			}).show(); 
	}
	// 更新tab内容，如不存在就新建一个
	function updateTab(tabId,title, url) { 
		var tab = tabPanel.getItem(tabId);
		if(tab){ 
			tab.getUpdater().update(url); 
			tab.setTitle(title); 
		}else{ 
			tab = addTab(tabId, title, url); 
		} 
		tabPanel.setActiveTab(tab);
	} // 映射连接的id到函数
	var count = 0;
	var actions = { 
			'create' : function(){
				updateTab("001","New Tab2",'index2.jsp');
			}, 
			'create1' : function(){
				updateTab("002","New Tab1",'index2.jsp');
			}, 
			'use' : function(){ 
				// 演示页之间的轮换 
				updateTab('tab1','替换' + count + ' 次','index2.jsp');
				count++; 
			} 
	}; 
	function doAction(e, t){ 
		e.stopEvent(); actions[t.id](); 
	} 
	
	// body初始化后，viewport setup过后才能执行下面的代码
	actionPanel.body.on('mousedown', doAction, null, {delegate:'a'});
	
});