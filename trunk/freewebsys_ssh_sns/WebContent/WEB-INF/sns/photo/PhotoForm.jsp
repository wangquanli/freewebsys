<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fws" uri="http://freewebsys.com"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<fws:gsHead></fws:gsHead>
<s:include value="/common/sns/commonMeta.jsp">
	<s:param name="index">Photo</s:param>
</s:include>
<script type="text/javascript">
	var photo_index = 0;
	//上传成功事件
	function user_uploadSuccess_swf(file, serverData){
		var data = eval('('+serverData+')');
		if(data.status){
			var fileName = data.fileName.substr(data.fileName.lastIndexOf("/")+1);
			var html = '<div id="photo_upload_div_id_'+photo_index+'" style="margin-top: 5px;">'
			+'<img src="'+data.fileNameResize+'" height="100" width="100" style="border: 1px solid #92C1F0;"></img>&nbsp;&nbsp;'
			+'重新命名图片：<input type="text" name="photoUploadFileName" value="'+fileName+'"/>'
			+'<a href="#" onclick="deleteUploadPhoto(\''+photo_index+'\');">删除该图片</a>'
			+'<input type="hidden" name="photoUploadFile" value="'+data.fileName+'"/></div>';
			$('#photo_upload_td_id').append(html);
			photo_index ++;
		}
	}
	//删除上传图片
	function deleteUploadPhoto(index){
		$('#photo_upload_div_id_'+index).remove();
	}
</script>
</head>
<body>
<!-- 引入头部 -->
<s:include value="/common/sns/include/header.jsp">
<s:param name="topIndex">4</s:param>
<s:param name="leftIndex">photo</s:param>
</s:include>

<s:form theme="simple" id="PhotoFormId" action="savePhoto">
<table>
		<tr>
			<td colspan="3" height="30"></td>
		</tr>
		<tr>
			<td width="80"></td>
			<td width="420">
				批量上传照片，每张大小500K
			</td>
			<td width="100"><div id="blog_title_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<fws:swfUpload fileSize="500" fileType="*.jpg" filePath="user" 
				buttonText="上传图片" id="user" isResize="true" resizeWidth="150" resizeHeight="120"/>
			</td>
			<td width="100"><div id="blog_title_idTip" style="width: 100px;"></div></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2" id="photo_upload_td_id" valign="middle">
			</td>
		</tr>
		<tr>
			<td colspan="3" height="30"></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2">
			<input name="button" class="gwt-Button" id="registerFormSubmitId" value="保存" type="submit"/>
			<input name="button" class="gwt-Button" onclick="window.location.href='${ctx}/listPhoto.htm?type=my'" value="返回我的照片" type="button"/>
			</td>
		</tr>
</table>
</s:form>

<!-- 引入底部 -->
<s:include value="/common/sns/include/footer.jsp" />
</body>
</html>