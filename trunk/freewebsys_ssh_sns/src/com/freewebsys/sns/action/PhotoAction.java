package com.freewebsys.sns.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.service.PhotoService;
import com.freewebsys.sns.pojo.Photo;
import com.freewebsys.sns.action.BaseSNSAction;
import com.freewebsys.core.page.PageConf;

public class PhotoAction extends BaseSNSAction {
	
	@Autowired
	private PhotoService photoService;
	private Photo photo;
	private PageConf page;
	
	/**
	 * 分页.查询.排序.
	 */
	public String listPhoto() throws Exception {
		// 设定分页记录数.
		limit = 10;
		Map map = new HashMap<String, Object>();
		//匹配查询参数.
		if (photo != null) {
			map.put("module.id,Integer,=", photo.getId());
			map.put("module.albumId,Integer,=", photo.getAlbumId());
			map.put("module.userId,Integer,=", photo.getUserId());
			map.put("module.name,String,=", photo.getName());
			map.put("module.createTime,Integer,=", photo.getCreateTime());
			map.put("module.commentCount,Integer,=", photo.getCommentCount());
			map.put("module.readCount,Integer,=", photo.getReadCount());
			map.put("module.imagePath,String,=", photo.getImagePath());
			map.put("module.smallImagePath,String,=", photo.getSmallImagePath());
		}
		page = photoService.findPhotoPageList(start, limit, map);
		return SUCCESS;
	}

	/**
	 * 增加,修改action.
	 */
	public String addPhoto() throws Exception {
		return  INPUT;
	}

	/**
	 * 删除action.
	 */
	public String deletePhoto() throws Exception {
		for (int i = 0; ids != null && i < ids.length; i++) {//删除多个.
			photoService.deletePhotoById(ids[i]);
		}
		return  SUCCESS;
	}

	
	/**
	 * 保存action.
	 */
	public String savePhoto() throws Exception {
		photoService.savePhoto(photo);
		return  SUCCESS;
	}

	/**
	 * 查看aciton.
	 */
	public String viewPhoto() throws Exception {
		photo = photoService.findPhotoById(id);
		return  SUCCESS;
	}
	/**以下是get,set方法*/
	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}
	
	public PageConf getPage() {
		return page;
	}

	public void setPage(PageConf page) {
		this.page = page;
	}

}
