package com.freewebsys.sns.service.imp;

import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.service.CommonDaoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.pojo.Photo;
import com.freewebsys.sns.pojo.PhotoAlbum;
import com.freewebsys.sns.pojo.UserInfo;
import com.freewebsys.sns.service.PhotoService;
import com.freewebsys.sns.service.PhotoException;

public class PhotoServiceImp implements PhotoService {
	
	@Autowired
	private BaseDao baseDao;

	/**
	 * Photo删除
	 */
	@Override
	@Transactional
	public void deletePhotoById(Integer id) throws PhotoException {
		try{
			Photo photo = (Photo) baseDao.findById(Photo.class, id);
			baseDao.delete(photo);
		} catch (Exception e) {
			throw new PhotoException("Photo删除异常");
		}
	}

	/**
	 * Photo保存
	 */
	@Override
	@Transactional
	public void savePhoto(Integer photoAlbumId, String[] photoUploadFile,UserInfo userInfo) throws PhotoException {
		try {
			PhotoAlbum photoAlbum = null; 
			if(photoAlbumId == null){
			}
			for(int i = 0; photoUploadFile != null && i < photoUploadFile.length; i++){
				Photo photo = new Photo();
				photo.setCreateTime(new Date());
				photo.setCommentCount(0);
				photo.setReadCount(0);
				photo.setSmallImagePath(photoUploadFile[i]);
				photo.setImagePath(photoUploadFile[i]);
				photo.setUserId(userInfo.getId());
				baseDao.save(photo);
			}
		} catch (Exception e) {
			throw new PhotoException("Photo保存异常");
		}
	}

	/**
	 * Photo按ID查询
	 */
	@Override
	@Transactional
	public Photo findPhotoById(Integer id) throws PhotoException {
		try {
			return (Photo) baseDao.findById(Photo.class, id);
		} catch (Exception e) {
			throw new PhotoException("Photo按ID查询异常");
		}
	}

	/**
	 * Photo分页
	 */
	@Override
	@Transactional
	public PageConf findPhotoPageList(int start, int limit, Map map) throws PhotoException {
		try {
			String hql = " select module from Photo module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.findPage(start, limit, hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new PhotoException("Photo分页异常");
		}
	}
	
	/**
	 * 查询Photo全部
	 */
	@Override
	@Transactional
	public List<Photo> findAllPhoto(Map map) throws PhotoException {
		try {
			String hql = " select module from Photo module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.find(hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new PhotoException("查询Photo全部异常");
		}
	}

}
