<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/common/sns/commonMeta.jsp" >
	<s:param name="index">Mini</s:param>
</s:include>
<script type="text/javascript">
<!--
function commonConfirmMini(id){
	commonConfirm("确定删除么？",commonConfirmCallBack(id));
}
function commonConfirmCallBack(id){
	window.location.href="${ctx}/deleteMini.htm?ids="+id;
}
//-->
</script>
</head>
<body>
<!-- 引入头部 -->
<s:include value="/common/sns/include/header.jsp" />



<!-- 右侧内容 begin  -->
<div class="main">


<form id="BlogFormId" name="BlogFormId" action="saveMini.htm" method="post">
<div class="page_title"> <!-- page_title begin -->
	<div class="tit"><img src="http://toeoso-laptop/thinksns/apps/mini/Tpl/default/Public/images/ico_app02.gif" class="img">心情</div>
	<div class="status_editor">
	<div style="float:left; width:100%" class="lh25">
	<span class="f14px fn cGray" id="mini-content">
		<img title="呲牙" src="http://toeoso-laptop/thinksns/public/images/biaoqing/mini/lol.gif">
		<img title="呲牙" src="http://toeoso-laptop/thinksns/public/images/biaoqing/mini/lol.gif">
		<img title="呲牙" src="http://toeoso-laptop/thinksns/public/images/biaoqing/mini/lol.gif">
		<img title="可爱" src="http://toeoso-laptop/thinksns/public/images/biaoqing/mini/loveliness.gif">
		<img title="可爱" src="http://toeoso-laptop/thinksns/public/images/biaoqing/mini/loveliness.gif">
	</span>
		<span class="cGray2 fn f12px ml10" id="mini-time">25分钟前</span>
		<span class="f12px fn ml5"><a href="/thinksns/apps/mini/index.php?s=/Index/my">更多心情</a></span></div>
		
		<div style="width: 350px; margin-bottom: -5px;" class="alR"><span id="mb-hint"><b><span id="mini_textArea_smell_show_count_id">100</span></b>/100</span></div>
		
		
        <div class="status_edit"><!-- 心情状态页显示编辑框 -->
          <div>
          <fsns:smellTextArea name="mini.content" id="mini_textArea_"/>
          </div>
        </div>
        <div class="left pt5 pl5">
        	<input type="submit" class="btn_big" onclick="doAdd()" value="发布"/>
        </div>
        <div class="c"></div>
      </div>
    <div class="c"></div>
</div>
</form>

<fsns:tabMenuUrl titles="好友的心情,我的心情,大家的心情"
	actions="listMini-type~friend.htm,listMini-type~my.htm,listMini-type~all.htm"
	indexValue="type:friend,type:my,type:all"/>

<div class="MenuSub"></div>

<div class="Friend"><!-- 好友心情 begin  -->
	<div class="sidebar">
        ﻿
<div class="FSort">
<div class="tit">心情归档</div>
<ul>
  <li class="on"><a href="/thinksns/apps/mini/index.php?s=/Index/my/">全部时间</a></li>
  <li><a href="/thinksns/apps/mini/index.php?s=/Index/my/date/201102">2011年02月( 17 )</a></li><li><a href="/thinksns/apps/mini/index.php?s=/Index/my/date/201101">2011年01月( 20 )</a></li><li><a href="/thinksns/apps/mini/index.php?s=/Index/my/date/201012">2010年12月( 0 )</a></li><li><a href="/thinksns/apps/mini/index.php?s=/Index/my/date/201011">2010年11月( 1 )</a></li><li><a href="/thinksns/apps/mini/index.php?s=/Index/my/date/201010">2010年10月( 1 )</a></li></ul>
<div class="btm"></div>
</div><!-- 心情归档 -->
	</div>
      <div class="FList">


<s:iterator value="page.data" status="status" step="10">
<div class="Fli" id="Fli31">
	<div class="c1">
		<span class="headpic50"><a
			href="http://toeoso-laptop/thinksns/index.php?s=/space/1"><img
				src="http://toeoso-laptop/thinksns/data/userface/000/00/00/1_small_face.jpg">
		</a>
		</span>
	</div>
	<div class="c2 bg_ico_arrow">
		<div class="MC bg01" id="MCG31">
			<h4 class="lh20" style="background-color:#F1F6FF;border-top-width: 0px;">
				<span class="right mt5">
					<s:if test="type == 'my'">
						<a id="d-31" class="del" title="删除" style="background-color: #005FAB;"
						href="javaScript:commonConfirmMini('<s:property value="id"/>');">删除</a>
					</s:if>
				</span>
				<span class="left">
					<a href=""><strong><s:property value="userInfo.name"/></strong></a>
					<span class="time"><s:date name="createTime" format="yyyy-MM-dd HH:mm"/>
				</span>
				</span>
			</h4>
			<p class="WB">
				<s:property value="content" escape="false"/>
				<!-- <a href="javascript:replay('false',31)">回复</a> -->
			</p>
		</div>
		<div>
			<div class="RC" id="RC31"></div>
		</div>
		<div class="Input_box" id="RLI31">
			<div class="pic" style="display: none;" id="image31">
				<a href="http://toeoso-laptop/thinksns/index.php?s=/space/1"><img
					src="http://toeoso-laptop/thinksns/data/userface/000/00/00/1_small_face.jpg">
				</a>
			</div>
			<div class="box">
				<textarea id="input31" name="comment" rows="3"
					style="height: 25px; width: 368px; line-height: 25px; display: none;"
					class="cGray2 inputReplay">添加回复</textarea>
				<input id="button31" showmore="false" type="button" class="btn_b"
					onclick="replayComment(31,true,1)" style="display: none;"
					value="回 复"> <input type="button" id="button231"
					name="replayHide($( '#button31' ))" style="display: none;"
					value="取消"> <input id="uid" type="hidden" value="1">
			</div>
		</div>
	</div>
	<div class="c"></div>
</div>
</s:iterator>
          
	<s:set name="page" value="page"/><!-- 重新给page赋值,urlwrite的问题 -->
	<fsns:page action="listMini" otherValue="type" start="${page.start}" limit="${page.limit}" total="${page.total}"/>
      
</div>
</div>



</div>
<!-- 右侧内容 end  -->
<div class="c"></div>


<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>