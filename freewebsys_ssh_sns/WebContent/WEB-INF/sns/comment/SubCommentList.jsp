<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<%request.setAttribute("ctx",request.getContextPath());//重新设置缩写. %>
<%request.setAttribute("img_ctx",request.getContextPath()+"/common/css/web/images");//重新设置缩写. %>
			
				<s:iterator value="page.data" status="subStatus"> 
				<div class="sublist pt5 clear" id="subComment_${parentId}_${subStatus.index}_id">
				<div class="left" style="width: 50px;">
				<span class="pic38"><a href="" class="tips" rel=""><img src="http://toeoso-laptop/thinksns/data/userface/000/00/00/1_small_face.jpg"></a></span>
					</div>
					<div style="margin-left: 50px;">
					<h3 class="tit_Critique lh20 mb5"><span class="right f12px mr5">
					<span class="ml5"><a href="###" onclick="deleteComment('${status.index}_${subStatus.index}')">删除</a></span>
					</span><a href="/thinksns/index.php?s=/space/1">管理员</a><em class="cGray2">37分钟前</em></h3>
					<p><s:property value="comment"/></p>
					</div>
					<div class="c"></div>
				</div>
				</s:iterator>
				<!-- 子回复框 Begin -->
				<input name="comment.parentId" id="replayParentId_${parentId}_id" type="hidden" value="${parentId}"/>
				<div style="display: none;" id="replaySubComment_${parentId}_id">
		          <div class="pt5 clear">
		            <div class="left" style="width: 50px;"><span class="pic38"><img src="http://toeoso-laptop/thinksns/data/userface/000/00/00/1_small_face.jpg" id="face"></span></div>
		            <div style="margin-left: 50px; overflow: hidden;">
		              <textarea id="replayTextarea_${parentId}_id" name="comment.comment" rows="4" style="width: 99%;" class="Text" onblur="this.className='Text'" onfocus="this.className='Text1'"></textarea>
		              <input type="submit" class="btn_b mt5" value="回 复" onclick="saveReplayComment('${parentId}');">
		              <input type="button" class="btn_w mt5" value="取消" onclick="hideReplay('${parentId}');"/>
		            </div>
		          </div>
		        </div>
				<!-- 子回复框 End -->
				
	<fsns:page id="${parentId}" action="listSubComment.htm" otherValue="parentId,appType,appId" start="${page.start}" limit="${page.limit}" total="${page.total}" theme="miniAjax"/>

<script type="text/javascript">
<!--
function goMiniPage_${parentId}(url){
	//加载 loading 图片
	$("#subComment_${parentId}_id").action("<div align='center' style='padding-top:50px'><img src='${img_ctx}/loading_blue_big.gif'></div>'");
	$("#subComment_${parentId}_id").load(url,function() {
		$('html,body').animate({scrollTop: $("#subComment_"+objId+"_anchor_id").offset().top}, 1);
	});
}
//-->
</script>