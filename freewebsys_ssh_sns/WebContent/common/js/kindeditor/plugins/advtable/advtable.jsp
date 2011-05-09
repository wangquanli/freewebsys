<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Table</title>
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
				margin-right: 20px;
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
			.table li input.text {
				width:50px;
			}
			.margin-right-10 {
				margin-right:10px;
			}
			.color-picker {
				border: 1px solid #A0A0A0;
				background-color: #FFFFFF;
				font-size: 12px;
				width: 60px;
				height: 20px;
				line-height: 20px;
				padding-left: 5px;
				overflow: hidden;
				display: -moz-inline-stack;
				display: inline-block;
				vertical-align: middle;
				zoom: 1;
				*display: inline;
				cursor: pointer;
			}
		</style>
		<script type="text/javascript">
			var KE = parent.KindEditor;
			location.href.match(/\&id=([\w-]+)/i);
			var id = RegExp.$1;
			location.href.match(/\?mode=([\w-]*)/i);
			var mode = RegExp.$1;
			KE.event.ready(function() {
				var modeBox = KE.$('mode', document);
				var rowsBox = KE.$('rows', document);
				var colsBox = KE.$('cols', document);
				var widthBox = KE.$('width', document);
				var heightBox = KE.$('height', document);
				var widthTypeBox = KE.$('widthType', document);
				var heightTypeBox = KE.$('heightType', document);
				var paddingBox = KE.$('padding', document);
				var spacingBox = KE.$('spacing', document);
				var alignBox = KE.$('align', document);
				var borderBox = KE.$('border', document);
				var borderColorBox = KE.$('borderColor', document);
				var backgroundColorBox = KE.$('backgroundColor', document);
				var lang = KE.lang.plugins.advtable;
				widthTypeBox.options[0] = new Option(lang.percent, '%');
				widthTypeBox.options[1] = new Option(lang.px, 'px');
				heightTypeBox.options[0] = new Option(lang.percent, '%');
				heightTypeBox.options[1] = new Option(lang.px, 'px');
				alignBox.options[0] = new Option(lang.alignDefault, '');
				alignBox.options[1] = new Option(lang.alignLeft, 'left');
				alignBox.options[2] = new Option(lang.alignCenter, 'center');
				alignBox.options[3] = new Option(lang.alignRight, 'right');
				var rows = 3;
				var cols = 2;
				var width = 100;
				var height = '';
				var widthType = '%';
				var heightType = '%';
				var padding = 2;
				var spacing = 0;
				var align = '';
				var border = 1;
				var borderColor = '#000000';
				var backgroundColor = '';
				var table = KE.plugin.advtable.getSelectedTable(id);
				if (mode === 'default' && table) mode = 'update';
				if (mode === 'update') {
					rows = table.rows.length;
					cols = rows > 0 ? table.rows[0].cells.length : 0;
					rowsBox.disabled = true;
					colsBox.disabled = true;
					var tableWidth = table.style.width || table.width;
					var tableHeight = table.style.height || table.height;
					if (tableWidth !== undefined && tableWidth.match(/^(\d+)((?:px|%)*)$/)) {
						width = RegExp.$1;
						widthType = RegExp.$2;
					} else {
						width = '';
					}
					if (tableHeight !== undefined && tableHeight.match(/^(\d+)((?:px|%)*)$/)) {
						height = RegExp.$1;
						heightType = RegExp.$2;
					}
					padding = table.cellPadding || '';
					spacing = table.cellSpacing || '';
					align = table.align || '';
					border = (table.border === undefined) ? '' : table.border;
					borderColor = table.getAttribute('borderColor') || '';
					backgroundColor = table.style.backgroundColor || table.bgColor || '';
					borderColor = KE.util.rgbToHex(borderColor).toUpperCase();
					backgroundColor = KE.util.rgbToHex(backgroundColor).toUpperCase();
				}
				modeBox.value = mode;
				rowsBox.value = rows;
				colsBox.value = cols;
				widthBox.value = width;
				heightBox.value = height;
				widthTypeBox.value = widthType;
				heightTypeBox.value = heightType;
				paddingBox.value = padding;
				spacingBox.value = spacing;
				alignBox.value = align;
				borderBox.value = border;
				function setColor(el, color) {
					el.style.backgroundColor = color;
					el.style.color = (color == '#000000') ? '#FFFFFF' : '#000000';
					el.innerHTML = color;
				}
				setColor(borderColorBox, borderColor);
				setColor(backgroundColorBox, backgroundColor);
				var picker;
				var currentElement;
				function removePicker() {
					if (picker) {
						picker.remove();
						picker = null;
						currentElement = null;
					}
				}
				function onclickFunc(el) {
					if (picker && el === currentElement) {
						removePicker();
					} else {
						removePicker();
						var dialog = KE.g[id].dialogStack[0];
						dialog.beforeHide = removePicker;
						dialog.ondrag = removePicker;
						var scrollPos = KE.util.getScrollPos();
						var iframePos = KE.util.getElementPos(dialog.iframe);
						var pos = KE.util.getElementPos(el);
						picker = new KE.colorpicker({
							x : iframePos.x + pos.x - scrollPos.x,
							y : iframePos.y + pos.y - scrollPos.y + 22,
							z : dialog.zIndex + 1,
							onclick : function(color) {
								setColor(el, color);
								removePicker();
							},
							selectedColor : (el.innerHTML || '')
						});
						picker.create();
						currentElement = el;
					}
				}
				borderColorBox.onclick = function() {
					onclickFunc(borderColorBox);
				};
				backgroundColorBox.onclick = function() {
					onclickFunc(backgroundColorBox);
				};
				KE.util.pluginLang('advtable', document);
				KE.util.hideLoadingPage(id);
			}, window, document);
		</script>
	</head>
	<body>
		<div class="main">
			<input type="hidden" id="mode" name="mode" value="" /> 
			<ul class="table">
				<li>
					<label for="rows"><span id="lang.cells"></span></label>
					<span id="lang.rows"></span>&nbsp;<input type="text" id="rows" name="rows" value="" maxlength="4" class="text margin-right-10" />
					<span id="lang.cols"></span>&nbsp;<input type="text" id="cols" name="cols" value="" maxlength="4" class="text" />
				</li>
				<li>
					<label for="width"><span id="lang.size"></span></label>
					<span id="lang.width"></span>&nbsp;<input type="text" id="width" name="width" value="" maxlength="4" class="text" align="absmiddle" />
					<select id="widthType" name="widthType" align="absmiddle" class="margin-right-10"></select>
					<span id="lang.height"></span>&nbsp;<input type="text" id="height" name="height" value="" maxlength="4" class="text" align="absmiddle" />
					<select id="heightType" name="heightType" align="absmiddle" class="margin-right-10"></select>
				</li>
				<li>
					<label for="padding"><span id="lang.space"></span></label>
					<span id="lang.padding"></span>&nbsp;<input type="text" id="padding" name="padding" value="" maxlength="4" class="text margin-right-10" />
					<span id="lang.spacing"></span>&nbsp;<input type="text" id="spacing" name="spacing" value="" maxlength="4" class="text" />
				</li>
				<li>
					<label for="align"><span id="lang.align"></span></label>
					<select id="align" name="align"></select>
				</li>
				<li>
					<label for="border"><span id="lang.border"></span></label>
					<span id="lang.borderWidth"></span>&nbsp;<input type="text" id="border" name="border" value="" maxlength="4" class="text margin-right-10" />
					<span id="lang.borderColor"></span>&nbsp;<span id="borderColor" class="color-picker"></span>
				</li>
				<li>
					<label for="backgroundColor"><span id="lang.backgroundColor"></span></label>
					<span id="backgroundColor" class="color-picker"></span>
				</li>
			</ul>
		</div>
	</body>
</html>