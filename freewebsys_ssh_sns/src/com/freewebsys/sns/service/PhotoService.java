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
	 * @Description: 查询分页
	 */
	PageConf findPhotoPageList(int start, int limit, Map values)
			throws PhotoException;

	/**
	 * @Description: 查询全部
	 */
	List<Photo> findAllPhoto(Map values) throws PhotoException;

}
