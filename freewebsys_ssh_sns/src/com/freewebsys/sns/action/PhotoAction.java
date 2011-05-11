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
	// 上传文件一个或多个
	private String[] photoUploadFile;
	private String[] photoUploadFileName;
	// 上传相册Id
	private Integer photoAlbumId;
	private PageConf page;

	/**
	 * 分页.查询.排序.
	 */
	public String listPhoto() throws Exception {
		// 设定分页记录数.
		limit = 12;
		page = photoService.findPhotoPageList(start, limit,
				getSessionUserInfo(), type);
		return SUCCESS;
	}

	/**
	 * 增加,修改action.
	 */
	public String addPhoto() throws Exception {
		return INPUT;
	}

	/**
	 * 删除action.
	 */
	public String deletePhoto() throws Exception {
		for (int i = 0; ids != null && i < ids.length; i++) {// 删除多个.
			photoService.deletePhotoById(ids[i]);
		}
		return SUCCESS;
	}

	/**
	 * 保存action.
	 */
	public String savePhoto() throws Exception {
		photoService.savePhoto(photoAlbumId, photoUploadFile,photoUploadFileName,
				getSessionUserInfo());
		return SUCCESS;
	}

	/**
	 * 查看aciton.
	 */
	public String viewPhoto() throws Exception {
		// 设定分页记录数.
		limit = 1;
		if (id != null) {
			page = photoService.findPhotoPageList(start, limit,
					getSessionUserInfo(), type, id);
		} else {
			page = photoService.findPhotoPageList(start, limit,
					getSessionUserInfo(), type);
		}

		return SUCCESS;
	}

	/** 以下是get,set方法 */
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

	public String[] getPhotoUploadFile() {
		return photoUploadFile;
	}

	public void setPhotoUploadFile(String[] photoUploadFile) {
		this.photoUploadFile = photoUploadFile;
	}

	public Integer getPhotoAlbumId() {
		return photoAlbumId;
	}

	public void setPhotoAlbumId(Integer photoAlbumId) {
		this.photoAlbumId = photoAlbumId;
	}

	public String[] getPhotoUploadFileName() {
		return photoUploadFileName;
	}

	public void setPhotoUploadFileName(String[] photoUploadFileName) {
		this.photoUploadFileName = photoUploadFileName;
	}

}
