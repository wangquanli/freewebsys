package com.freewebsys.sns.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.service.PhotoAlbumService;
import com.freewebsys.sns.pojo.PhotoAlbum;
import com.freewebsys.sns.action.BaseSNSAction;
import com.freewebsys.core.page.PageConf;

public class PhotoAlbumAction extends BaseSNSAction {
	
	@Autowired
	private PhotoAlbumService photoAlbumService;
	private PhotoAlbum photoAlbum;
	private PageConf page;
	
	/**
	 * 分页.查询.排序.
	 */
	public String listPhotoAlbum() throws Exception {
		// 设定分页记录数.
		limit = 10;
		Map map = new HashMap<String, Object>();
		//匹配查询参数.
		if (photoAlbum != null) {
			map.put("module.id,Integer,=", photoAlbum.getId());
			map.put("module.userId,Integer,=", photoAlbum.getUserId());
			map.put("module.name,String,=", photoAlbum.getName());
			map.put("module.createTime,Integer,=", photoAlbum.getCreateTime());
			map.put("module.coverImageId,Integer,=", photoAlbum.getCoverImageId());
			map.put("module.coverImagePath,String,=", photoAlbum.getCoverImagePath());
			map.put("module.photoCount,Integer,=", photoAlbum.getPhotoCount());
			map.put("module.share,Integer,=", photoAlbum.getShare());
			map.put("module.privacy,Integer,=", photoAlbum.getPrivacy());
		}
		page = photoAlbumService.findPhotoAlbumPageList(start, limit, map);
		return SUCCESS;
	}

	/**
	 * 增加,修改action.
	 */
	public String addPhotoAlbum() throws Exception {
		if(id != null){
			photoAlbum = photoAlbumService.findPhotoAlbumById(id);
		}
		return  INPUT;
	}

	/**
	 * 删除action.
	 */
	public String deletePhotoAlbum() throws Exception {
		for (int i = 0; ids != null && i < ids.length; i++) {//删除多个.
			photoAlbumService.deletePhotoAlbumById(ids[i]);
		}
		return  SUCCESS;
	}

	
	/**
	 * 保存action.
	 */
	public String savePhotoAlbum() throws Exception {
		photoAlbumService.savePhotoAlbum(photoAlbum);
		return  SUCCESS;
	}

	/**
	 * 查看aciton.
	 */
	public String viewPhotoAlbum() throws Exception {
		photoAlbum = photoAlbumService.findPhotoAlbumById(id);
		return  SUCCESS;
	}
	/**以下是get,set方法*/
	public PhotoAlbum getPhotoAlbum() {
		return photoAlbum;
	}

	public void setPhotoAlbum(PhotoAlbum photoAlbum) {
		this.photoAlbum = photoAlbum;
	}
	
	public PageConf getPage() {
		return page;
	}

	public void setPage(PageConf page) {
		this.page = page;
	}

}
