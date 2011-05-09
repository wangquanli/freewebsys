package com.freewebsys.sns.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.sns.pojo.PhotoAlbum;
import com.freewebsys.sns.service.PhotoAlbumException;

public interface PhotoAlbumService{
	/**
	 * @Description: 保存
	 */
	void savePhotoAlbum(PhotoAlbum photoAlbum) throws PhotoAlbumException;
	/**
	 * @Description: 删除
	 */
	void deletePhotoAlbumById(Integer id) throws PhotoAlbumException;
	/**
	 * @Description:  按ID查询
	 */
	PhotoAlbum findPhotoAlbumById(Integer id) throws PhotoAlbumException;
	/**
	 * @Description:  查询分页
	 */
	PageConf findPhotoAlbumPageList(int start, int limit, Map values) throws PhotoAlbumException;
	/**
	 * @Description:  查询全部
	 */
	List<PhotoAlbum> findAllPhotoAlbum(Map values) throws PhotoAlbumException;
}
