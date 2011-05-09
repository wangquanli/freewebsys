<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/common/sns/commonMeta.jsp">
	<s:param name="index">Blog</s:param>
</s:include>
</head>
<body>
<!-- 引入头部 -->
<s:include value="/common/sns/include/header.jsp">
<s:param name="topIndex">4</s:param>
<s:param name="leftIndex">blog</s:param>
</s:include>

<s:form theme="simple" id="BlogFormId" action="saveBlog">
<s:hidden name="blog.id"/>
<table>
		<tr>
			<td colspan="3" height="30"></td>
		</tr>
		<tr>
			<td width="80">标题：</td>
			<td width="420"><s:textfield name="blog.title" id="blog_title_id" theme="simple" cssStyle="width: 100%;"/></td>
			<td width="100"><div id="blog_title_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td valign="top">内容：</td>
			<td>
				<script charset="utf-8" type="text/javascript">
	KE.show({
				id : 'content',
				resizeMode : 0,
				items : [ 
					'cut', 'copy', 'emoticons', 'source', 'justifyleft',
					'justifycenter', 'justifyright', 'fontname',
					'fontsize', 'textcolor', 'bgcolor', 'bold', 'italic',
					'underline', 'removeformat', '-',
					'image', 'link', 'unlink' 
				          ]
			});
</script>
<s:textarea style="width: 100%; padding: 8px; display: none;width: 420px;height: 300px;"
 name="blog.content" id="content"/>
			</td>
			<td><div id="blog_title_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2">
			<input name="button" class="gwt-Button" id="registerFormSubmitId" value="保存" type="submit"/>
			<input name="button" class="gwt-Button" onclick="window.location.href='${ctx}/listBlog.htm?type=my'" value="返回我的日志" type="button"/>
			</td>
		</tr>
</table>
</s:form>


<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>