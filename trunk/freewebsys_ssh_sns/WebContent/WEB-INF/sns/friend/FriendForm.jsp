<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/common/sns/commonMeta.jsp">
	<s:param name="index">Friend</s:param>
</s:include>
<script type="text/javascript">
<!--
function addFriend(friendId){
	//alert(friendId);
	$.ajax({
 		type:"POST",
 		url:'saveFriend.action',
 		data:{friendId:friendId},
 		success:function(data){
 			//alert(data);
 			if(data == 0){
 				alert("已经添加好友,等待好友同意.");
 			}else if(data == 1){
 				alert("该用户已经成为好友.");
 			}
 		}
 	});
}
//-->
</script>
</head>
<body>
<!-- 引入头部 -->
<s:include value="/common/sns/include/header.jsp">
<s:param name="topIndex">2</s:param>
<s:param name="leftIndex">friend</s:param>
</s:include>


<s:form theme="simple" id="FriendSearchFormId" action="friendSearch">
<table width="100%">
	<tr><td height="30" colspan="2"></td></tr>
	<tr><td valign="bottom" align="center" colspan="2">
			好友名称：
			<s:textfield name="userInfo.name" id="blog_title_id" theme="simple" cssStyle="width: 150px;"/>
			<input name="button" class="gwt-Button" id="registerFormSubmitId" value="查询" type="submit"/>
	</td></tr>
<s:iterator value="page.data" status="status">
	
	<s:if test="#status.count % 2 == 1"><tr><td></s:if>
	<s:if test="#status.count % 2 == 0"><td></s:if>
			<table>
				<tr>
				<td>
					<a href="#">
					<img src="<s:property value="userPic"/>" alt="" width=100 height="80"/>
					</a>
				</td>
				<td valign="middle" align="left">
					<div><a href="javascript:addFriend('<s:property value="id"/>')">加为好友</a></div>
				</td>
				</tr>
			</table>
	<s:if test="#status.count % 2 == 1"></td></s:if>
	<s:if test="#status.count % 2 == 0 || #status.last ">
		</td>
		</tr>
		<!-- 分割线 -->
		<tr><td colspan="2">
			<div style="border-bottom: 1px solid #92C1F0;height: 2px;"></div>
		</td></tr>
	</s:if>
	
</s:iterator>
	<!-- 分页 -->
	<tr><td colspan="2">
		<div>
			<fws:gsPage  action="friendSearch.htm" otherValue="userInfo.name" start="${page.start}" limit="${page.limit}" total="${page.total}"/>
		</div>
	</td></tr>
</table>
</s:form>

<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>