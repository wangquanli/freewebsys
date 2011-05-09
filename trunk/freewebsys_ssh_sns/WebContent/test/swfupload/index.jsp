<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SWFUpload Demos - Simple Demo</title>
<jsp:include page="/common/sns/commonMeta.jsp" />
<script src="${ctx}/struts/ext2style/js/jquery-1.4.2.min.js" type="text/javascript"></script> 
<script src="${ctx}/struts/ext2style/js/jquery-ui-custom.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="${ctx}/struts/ext2style/js/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${ctx}/struts/ext2style/js/swfupload/swfupload.queue.js"></script>
<script type="text/javascript" src="${ctx}/struts/ext2style/js/swfupload/fileprogress.js"></script>
<script type="text/javascript" src="${ctx}/struts/ext2style/js/swfupload/handlers.js"></script>
<script type="text/javascript">
	alert('dd');
	var swfu;
	window.onload = function() {
		var settings = {
			flash_url : "${ctx}/struts/ext2style/js/swfupload/swfupload.swf",
			upload_url : "${ctx}/swfUploadFile.action",
			post_params : {
				"filePath" : "product"
			},
			file_post_name : 'swfu',
			file_size_limit : "2000",
			file_types : "*.*",
			file_types_description : "All Files",
			file_upload_limit : 1,
			file_queue_limit : 0,
			custom_settings : {
				progressTarget : "fsUploadProgress",
				cancelButtonId : "btnCancel"
			},
			debug : false,
			// Button settings
			button_image_url : "${ctx}/struts/ext2style/images/swfupload/upload_img.png",
			button_width : "61",
			button_height : "22",
			button_placeholder_id : "spanButtonPlaceHolder",
			button_text : '<span class="theFont">上传文件</span>',
			button_text_style : ".theFont { font-size: 12; }",
			button_text_left_padding : 4,
			button_text_top_padding : 0,

			// The event handler functions are defined in handlers.js
			file_queued_handler : fileQueued,
			file_queue_error_handler : fileQueueError,
			file_dialog_complete_handler : fileDialogComplete,
			upload_start_handler : uploadStart,
			upload_progress_handler : uploadProgress,
			upload_error_handler : uploadError,
			upload_success_handler : uploadSuccess_swf,
			upload_complete_handler : uploadComplete,
			queue_complete_handler : queueComplete
		// Queue plugin event
		};
		swfu = new SWFUpload(settings);
	};
	function uploadSuccess_swf(file, serverData){
		alert('888');
		var data = eval('('+serverData+')');
		alert(data.status);
		alert(data.fileName);
	}
</script>
</head>
<body>
	<div id="content">
		<span id="spanButtonPlaceHolder"></span>
		<div id="fsUploadProgress" style="display: none;" />
		<div id="btnCancel" style="display: none;" />
	</div>
</body>
</html>
