package com.freewebsys.blog.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.JsonObject;

@Controller
public class UploadController extends BaseController {

	/**
	 * 上传文件.
	 */
	@RequestMapping(value = "/admin/uploadFile", method = RequestMethod.POST)
	public void userLoginPost(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {

		long maxSize = 500000;

		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		List items = upload.parseRequest(request);
		Iterator itr = items.iterator();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
		String saveUrl = "/upload/" + sdf.format(new Date());
		String savePath = request.getRealPath("/") + saveUrl;
		File saveDirFile = new File(savePath);
		//如果文件夹不存在.
		if (!saveDirFile.exists()) {
			saveDirFile.mkdirs();
		}

		while (itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			String fileName = item.getName();
			long fileSize = item.getSize();
			if (!item.isFormField()) {
				if (item.getSize() > maxSize) {
					writeToPage(response, "上传文件超过限制");
					return;
				}
				// 文件扩展名
				String fileExt = fileName.substring(
						fileName.lastIndexOf(".") + 1).toLowerCase();

				String newFileName = new Random().nextInt(50000) + "." + fileExt;
				try {
					File uploadedFile = new File(savePath, newFileName);
					item.write(uploadedFile);
				} catch (Exception e) {
					writeToPage(response, "上传文件失败.");
					return;
				}

				JsonObject obj = new JsonObject();
				obj.addProperty("err", "");
				obj.addProperty("msg", saveUrl + newFileName);
				writeToPage(response, obj.toString());
			}
		}
	}
}
