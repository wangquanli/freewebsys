<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>PlainPaste</title>
		<style type="text/css" rel="stylesheet">
			body {
				margin: 0;
				font:12px/1 "sans serif",tahoma,verdana,helvetica;
				background-color:#F0F0EE;
				color:#222222;
				text-align:center;
			}
			#textArea {
				width:98%;
				height:260px;
				border:1px solid #222222;
				overflow: auto;
				resize: none;
			}
			#textArea:focus {
				outline: none;
			}
			.comment {
				margin-bottom: 10px;
				text-align: left;
			}
		</style>
		<script type="text/javascript">
			var KE = parent.KindEditor;
			location.href.match(/\?id=([\w-]+)/i);
			var id = RegExp.$1;
			KE.event.ready(function() {
				KE.util.pluginLang('plainpaste', document);
				KE.util.hideLoadingPage(id);
			}, window, document);
		</script>
	</head>
	<body>
		<div class="comment"><span id="lang.comment"></span></div>
		<textarea id="textArea"></textarea>
	</body>
</html>
