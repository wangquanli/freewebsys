<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<%request.setAttribute("ctx",request.getContextPath());//重新设置缩写. %>
<%request.setAttribute("img_ctx",request.getContextPath()+"/common/css/web/images");//重新设置缩写. %>

<script type="text/javascript">
<!--
function showReplay(objId){//{status.index}
	$('#replaySubComment_'+objId+'_id').toggle();
	$('#replayTextarea_'+objId+'_id').focus();
}
function hideReplay(objId){//{status.index}
	$('#replaySubComment_'+objId+'_id').hide();
}
function saveReplayComment(objId){
	if($('#replayTextarea_'+objId+'_id').val() == ''){
		alert('请输入评论内容。');
	}
	$.ajax({
		url:'saveComment.htm',
		type:"POST",
		data:{
			'appType':'${appType}',
			'appId':'${appId}',
			'parentId':$('#replayParentId_'+objId+'_id').val(),
			'commentContent':$('#replayTextarea_'+objId+'_id').val()},
		success:function(data){//回调函数
			if(data == 1){
				$('#replayTextarea_'+objId+'_id').val('');
				$('#replaySubComment_'+objId+'_id').hide();
				//重新加载子分页
				var parentId = $('#replayParentId_'+objId+'_id').val();
				$("#subComment_"+objId+"_id").action("<div align='center' style='padding-top:50px'><img src='${img_ctx}/loading_blue_big.gif'></div>'");
				$("#subComment_"+objId+"_id").load("${ctx}/listSubComment.htm?appType=${param.appType}&appId=${param.appId}&parentId="+parentId,function() {
					$('html,body').animate({scrollTop: $("#comment_"+objId+"_id").offset().top}, 1);
				});
			}
		}
	});
}
function goPage(url){
	//加载 loading 图片
	$("#comment_id").action("<div align='center' style='padding-top:50px'><img src='${img_ctx}/loading_blue_big.gif'></div>'");
	$("#comment_id").load(url,function() {
		$('html,body').animate({scrollTop: $("comment_anchor_id").offset().top}, 1);
	});
}
//-->
</script>
	
	<ul>
    
    <s:iterator value="page.data" status="status">     
	<li id="comment_${id}_id" class="comlist">
	<div class="left" style="width: 65px;">
		<span class="headpic50">
		<a href="" class="tips"><img src="http://toeoso-laptop/thinksns/data/userface/000/00/00/1_small_face.jpg"/></a></span></div>
		<div style="margin-left: 65px;">
				<div style="padding-bottom: 20px;">
				<h3 class="tit_Critique lh25 mb5">
				<span class="right f12px mr5"><span>
				<a href="javaScript:void(0);" onclick="showReplay('${id}');">回复</a></span>
				</span>
				<a href="/thinksns/index.php?s=/space/1">管理员</a><em class="cGray2">37分钟前</em></h3>
				<p><s:property value="comment"/></p>
			</div>
            
			<span id="subComment_${id}_anchor_id"></span>
			<div id="subComment_${id}_id" class="subcomment">
<script type="text/javascript">
<!--
$(document).ready(function(){
	$("#subComment_${id}_id").action("<div align='center' style='padding-top:50px'><img src='${img_ctx}/loading_blue_big.gif'></div>'");
	$("#subComment_${id}_id").load("${ctx}/listSubComment.htm?appType=${param.appType}&appId=${param.appId}&parentId=${id}",function() {});
});
//-->
</script>
			</div>
		</div>
	</li>
	</s:iterator>
</ul>
	
	<s:set name="page" value="page"/><!-- 重新给page赋值,urlwrite的问题 -->
	<fsns:page action="listComment" otherValue="appType,appId" start="${page.start}" limit="${page.limit}" total="${page.total}" theme="ajax"/>
