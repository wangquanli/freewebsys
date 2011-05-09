<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%request.setAttribute("ctx",request.getContextPath());//重新设置缩写. %>
<%request.setAttribute("img_ctx",request.getContextPath()+"/common/css/web/images");//重新设置缩写. %>


<div id="content1" class="Guestbook">
          <div class="tit"><div class="right pr5" style="position: relative; width: 40px; height: 29px;"><a class="phizIco" id="bqBottom" href="###" onclick="bq_show();" title="插入表情">插入表情</a>
          </div><span class="pl5">添加评论</span><font style='color: yellow;font-weight: bold;font-size: 24;'></font></div>
		<div class="GB_box">
			<textarea id="commentTextarea_id" name="textarea" class="Text" onblur="this.className='Text'" onfocus="this.className='Text1'"></textarea>
			<input type="button" id="content_submit" onclick="saveComment();" class="btn_b" value="发表留言">
			<!--<span class="cGray">(每条最多2000字)</span>
			<input type="checkbox" id="quietly" name="quietly" value="1">悄悄话--> 
		</div>
</div>
<script type="text/javascript">
<!--
$(document).ready(function(){
	$("#comment_id").action("<div align='center' style='padding-top:50px'><img src='${img_ctx}/loading_blue_big.gif'></div>'");
	$("#comment_id").load("${ctx}/listComment.htm?appType=${param.appType}&appId=${param.appId}",function() {});
});
//保存评论
function saveComment(){
	if($('#commentTextarea_id').val() == ''){
		alert('请输入评论内容。');
	}
	$.ajax({
		url:'saveComment.htm',
		type:"POST",
		data:{
			'appType':'${param.appType}',
			'appId':'${param.appId}',
			'parentId':'0',
			'commentContent':$('#commentTextarea_id').val()},
		success:function(data){//回调函数
			if(data == 1){
				$('#commentTextarea_id').val('');
				//重新加载分页
				$("#comment_id").action("<div align='center' style='padding-top:50px'><img src='${img_ctx}/loading_blue_big.gif'></div>'");
				$("#comment_id").load("${ctx}/listComment.htm?appType=${param.appType}&appId=${param.appId}",function() {
					$('html,body').animate({scrollTop: $("#comment_anchor_id").offset().top}, 1);
				});
			}
		}
	});
}
//-->
</script>
<span id="comment_anchor_id"></span>
<div id="comment_id" class="critique"></div>