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
//删除好友
function deleteFriend(id){
	//commonConfirm("确定解除好友关系么？",function(){window.location.href='${ctx}/deleteFriend.htm?id='+id;});
	commonConfirm('${ctx}/deleteFriend.htm?id='+id,"确定解除好友关系么？");
}
</script>
</head>
<body>
<!-- 引入头部 -->
<s:include value="/common/sns/include/header.jsp">
<s:param name="topIndex">1</s:param>
<s:param name="leftIndex">friend</s:param>
</s:include>


<table width="100%">
	<tr><td height="30"></td></tr>
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
					<div><a href="javascript:deleteFriend('<s:property value="friend.id"/>')">删除好友</a></div>
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
	<tr><td>
		<div>
			<fws:gsPage  action="listBlog.htm" otherValue="type" start="${page.start}" limit="${page.limit}" total="${page.total}"/>
		</div>
	</td></tr>
</table>


<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>