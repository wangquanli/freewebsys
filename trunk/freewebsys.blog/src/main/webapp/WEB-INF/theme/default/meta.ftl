<!--add google analytics javaScript here.-->
<#if options??><#if options.analyticsJs??>${options.analyticsJs}</#if></#if>
<link type="text/css" rel="stylesheet" href="${blogPath}/css/style.css"></link>
<!--page css.-->
<style type="text/css" media="screen">
.pageNav a{
	font-weight: bold;
	color:#2B4A78; 
	text-decoration:none;
	border-color: #E3E3E3;
	background: #EEE;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	border-width: 1px;
	border-style: solid;
}
.pageNav a:hover { color:#2B4A78;text-decoration:underline; }
.pageNav a:focus, input:focus {outline-style:none; outline-width:medium; }
/* custom css style: pageNum,cPageNum */
.pageNum{border: 1px solid #999;padding:2px 8px;display: inline-block;}
.cPageNum{font-weight: bold;padding:2px 5px;}
.pageNav a:hover{text-decoration:none;background: #fff4d8; }
</style>
<script src="${blogPath}/js/jquery-1.7.1.min.js"></script>
<script src="${blogPath}/js/pagenav1.1.min.js"></script>