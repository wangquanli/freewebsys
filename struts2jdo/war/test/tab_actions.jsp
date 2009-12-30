<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <html>
<head>
<title>TabPane测试.</title>
<!-- Ext CSS and Libs -->
<link rel="stylesheet" type="text/css" href="extjs2.0/resources/css/ext-all.css" />
<script type="text/javascript" src="extjs2.0/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="extjs2.0/ext-all.js"></script>
<script type="text/javascript">Ext.onReady(function(){Ext.BLANK_IMAGE_URL = 'extjs2.0/resources/images/default/s.gif';});</script>
<!-- Custom CSS and Libs -->
<script type="text/javascript" src="./tab_actions.js"></script>
<style>
#actions li { margin:.3em; }
#actions li a { color:#666688; text-decoration:none; }
</style>
</head>
<body>
<ul id="actions" class="">
<li> <a id="use" href="#">Use Existing Tab</a> </li> 
<li> <a id="create" href="#">Create New Tab</a> </li>
<li> <a id="create1" href="#">Create New Tab</a> </li>
<li> <a id="create2" href="#">Create New Tab</a> </li>
</ul>
[ <div id="tabs"></div>] 
[ <div id="tab1">1111111111111</div>] 
</body>
</html>