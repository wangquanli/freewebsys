<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Link</title>
		<style type="text/css" rel="stylesheet">
			body {
				margin: 0;
				font:12px/1.5 "sans serif",tahoma,verdana,helvetica;
				background-color:#F0F0EE;
				color:#222222;
				overflow:hidden;
			}
			label {
				cursor:pointer;
			}
			.main {
				margin: 0 10px;
			}
			.table {
				list-style-image:none;
				list-style-position:outside;
				list-style-type:none;
				margin:0;
				padding:0;
				display:block;
			}
			.table li {
				padding:0;
				margin-bottom:10px;
				display:list-item;
				line-height:1.5;
			}
			.table li label {
				font-weight:bold;
			}
			.table li input {
				vertical-align:middle;
			}
			.table li img {
				vertical-align:middle;
			}
		</style>
		<script type="text/javascript">
			var KE = parent.KindEditor;
			location.href.match(/\?id=([\w-]+)/i);
			var id = RegExp.$1;
			KE.event.ready(function() {
				var hyperLink = KE.$('hyperLink', document);
				var linkType = KE.$('linkType', document);
				linkType.options[0] = new Option(KE.lang.plugins.link.newWindow, '_blank');
				linkType.options[1] = new Option(KE.lang.plugins.link.selfWindow, '');
				var linkNode = KE.plugin['link'].getSelectedNode(id);
				if (linkNode) {
					var tempDiv = KE.$$('div', KE.g[id].iframeDoc);
					tempDiv.appendChild(linkNode.cloneNode(false));
					var linkHtml = tempDiv.innerHTML;
					var src = linkNode.href;
					if (linkHtml.match(/kesrc="([^"]+)"/i)) src = RegExp.$1;
					var target = linkNode.target;
					hyperLink.value = KE.util.unescape(src);
					linkType.value = target == '_blank' ? target : '';
					var range = KE.g[id].keRange;
					range.selectTextNode(linkNode);
					KE.g[id].keSel.addRange(range);
				}
				KE.util.pluginLang('link', document);
				KE.util.hideLoadingPage(id);
			}, window, document);
		</script>
	</head>
	<body>
		<div class="main">
			<ul class="table">
				<li>
					<label for="hyperLink"><span id="lang.url"></span></label>
					<input type="text" id="hyperLink" name="hyperLink" value="http://" style="width:90%;" />
				</li>
				<li>
					<label for="linkType"><span id="lang.linkType"></span></label>&nbsp;
					<select id="linkType" name="linkType"></select>
				</li>
			</ul>
		</div>
	</body>
</html>