package com.freewebsys.sns.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.sns.pojo.Photo;
import com.freewebsys.sns.pojo.UserInfo;
import com.freewebsys.sns.service.PhotoException;

public interface PhotoService {
	/**
	 * @Description: 保存
	 */
	void savePhoto(Integer photoAlbumId, String[] photoUploadFile,
			String[] photoUploadFileName,
			UserInfo userInfo) throws PhotoException;

	/**
	 * @Description: 删除
	 */
	void deletePhotoById(Integer id) throws PhotoException;

	/**
	 * @Description: 按ID查询
	 */
	Photo findPhotoById(Integer id) throws PhotoException;

	/**
	 * * @Description: 显示,上一页,下一页 跳转查询
	 */
	public PageConf findPhotoPageList(int start, int limit, UserInfo userInfo,
			String type, Integer photoId) throws BlogException;
	
	/**
	 * @Description: 查询分页
	 */
	public PageConf findPhotoPageList(int start, int limit, UserInfo userInfo,
			String type) throws BlogException;

	/**
	 * @Description: 查询全部
	 */
	List<Photo> findAllPhoto(Map values) throws PhotoException;

}
