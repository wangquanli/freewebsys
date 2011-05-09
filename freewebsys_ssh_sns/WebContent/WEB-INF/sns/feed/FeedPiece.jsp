<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>


	<!-- 切换标签 begin  -->
	<fsns:tabMenuUrl titles="全部动态,心情,相册,日志,分享,投票,活动,群组"
	actions="viewUserMain-type~all.htm,viewUserMain-type~mini.htm,viewUserMain-type~photo.htm,viewUserMain-type~blog.htm,viewUserMain-type~share.htm,viewUserMain-type~vote.htm,viewUserMain-type~event.htm,viewUserMain-type~group.htm" 
	indexValue="type:all,type:mini,type:photo,type:blog,type:share,type:vote,type:event,type:group"/>
	<!-- 切换标签 end  -->
	
                
	<div class="Friend"><!-- 好友心情 begin  -->
    
<div id="feed_content" class="FList">


<s:iterator value="page.data" status="status" step="10">
<div id="a_feed_<s:property value="id"/>" class="Fli">
        <div class="ico_img"><img src="http://toeoso-laptop/thinksns/apps/blog/appinfo/ico_app01.gif"></div>
        <div style="overflow: hidden;" class="LC">
            <!--动态title-->
            <div id="feed_title_115" alt="115" class="tit">
                <div class="cl"><a href="#" style="white-space: nowrap;"><s:property value="feed.userName"/></a>
                 发表了一篇日志：<a href="#"><s:property value="feed.titleData"/></a></div>
                <div class="cr"><div class="pt5"><a class="del" href="${ctx}/deleteFeed-type~all-id~${id}-start~${page.start}.htm">删除</a></div>
                <div><em><s:date name="feed.createTime" format="yyyy年MM月dd日"/></em></div>
                </div>
                <div class="c"></div>
            </div>
            <!--end-->
            <!--动态body-->
            <div id="feed_body_115" class="RC">
                <div><s:property value="feed.contentData" escape="false"/>&nbsp;</div>
                <div class="c"></div>
            </div>
            <!--end-->
        </div>
</div>
</s:iterator>
	
        
</div>

<s:if test="page.total > page.limit ">                  
<div class="alR lh35">
	<fsns:page action="viewUserMain" otherValue="type" start="${page.start}" limit="${page.limit}" total="${page.total}"/>
</div>
</s:if>
	
	
	
</div><!-- 好友心情 end  -->