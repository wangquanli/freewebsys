<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/test/commonHead.jsp"%>
</head>
<body>
<script type="text/javascript">
Ext.onReady(function(){
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = 'side';// 统一指定错误信息提示方式
	 
	// 创建弹出窗口
	var winChat = new Ext.Window( {
		//layout : 'fit',
		layout:'accordion',
        width: 250,
        height: 400,
        iconCls: 'accordion',
		closeAction : 'hide',
		resizable : false,
		shadow : true,
		modal : false,
		closable : true,
		bodyStyle : 'padding:5 5 5 5',
		shim: false,
        animCollapse: false,
		constrainHeader: true,
		tbar:[{
            tooltip:{title:'Rich Tooltips', text:'Let your users know what they can do!'},
            iconCls:'connect'
        },'-',{
            tooltip:'Add a new user',
            iconCls:'user-add'
        },' ',{
            tooltip:'Remove the selected user',
            iconCls:'user-delete'
        }],
		items : [ new Ext.tree.TreePanel({
            id:'im-tree',
            title: 'Online Users',
            loader: new Ext.tree.TreeLoader(),
            rootVisible:false,
            lines:false,
            autoScroll:true,
            tools:[{
                id:'refresh',
                on:{
                    click: function(){
                        var tree = Ext.getCmp('im-tree');
                        tree.body.mask('Loading', 'x-mask-loading');
                        tree.root.reload();
                        tree.root.collapse(true, false);
                        setTimeout(function(){ // mimic a server call
                            tree.body.unmask();
                            tree.root.expand(true, true);
                        }, 1000);
                    }
                }
            }],
            root: new Ext.tree.AsyncTreeNode({
                text:'Online',
                children:[{
                    text:'Friends',
                    expanded:true,
                    children:[{
                        text:'Jack',
                        iconCls:'user',
                        leaf:true
                    },{
                        text:'Brian',
                        iconCls:'user',
                        leaf:true
                    },{
                        text:'Jon',
                        iconCls:'user',
                        leaf:true
                    },{
                        text:'Tim',
                        iconCls:'user',
                        leaf:true
                    },{
                        text:'Nige',
                        iconCls:'user',
                        leaf:true
                    },{
                        text:'Fred',
                        iconCls:'user',
                        leaf:true
                    },{
                        text:'Bob',
                        iconCls:'user',
                        leaf:true
                    }]
                },{
                    text:'Family',
                    expanded:true,
                    children:[{
                        text:'Kelly',
                        iconCls:'user-girl',
                        leaf:true
                    },{
                        text:'Sara',
                        iconCls:'user-girl',
                        leaf:true
                    },{
                        text:'Zack',
                        iconCls:'user-kid',
                        leaf:true
                    },{
                        text:'John',
                        iconCls:'user-kid',
                        leaf:true
                    }]
                }]
            })
        }), {
            title: 'Settings',
            html:'<p>Something useful would be in here.</p>',
            autoScroll:true
        },{
            title: 'Even More Stuff',
            html : '<p>Something useful would be in here.</p>'
        },{
            title: 'My Stuff',
            html : '<p>Something useful would be in here.</p>'
        }
        ]
	});
	
	Ext.get('myButton').on('click', 
			function(){
		winChat.setTitle("测试信息.");
		winChat.show();
	});
});
</script>
<button type="button" id="myButton">测试.</button>
</body>
</html>