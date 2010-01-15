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
	// The action
    var action = new Ext.Action({
        text: 'Action 1',
        handler: function(){
            alert('Click You clicked on "Action 1".');
        },
        iconCls: 'blist'
    });

    var panel = new Ext.Panel({
    	border: false,
        items: [
           new Ext.Button({ text: 'Action 1',
               handler: function(){
               alert('Click You clicked on "Action 1".');
           },
           iconCls: 'blist'}),
           new Ext.Button({ text: 'Action 1',
               handler: function(){
               alert('Click You clicked on "Action 1".');
           },
           iconCls: 'blist'})
        ],
        applyTo: 'panel-div'
    });


});
</script>
<br></br>

<div id='panel-div'
	style="width: 50%; height: 50%; text-align: center;border: 1px solid #3399FF;"></div>
</body>

</body>
</html>