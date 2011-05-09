package com.freewebsys.sns.service.imp;

import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.service.CommonDaoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.pojo.PhotoAlbum;
import com.freewebsys.sns.service.PhotoAlbumService;
import com.freewebsys.sns.service.PhotoAlbumException;

public class PhotoAlbumServiceImp implements PhotoAlbumService {
	
	@Autowired
	private BaseDao baseDao;

	/**
	 * PhotoAlbum删除
	 */
	@Override
	@Transactional
	public void deletePhotoAlbumById(Integer id) throws PhotoAlbumException {
		try{
			PhotoAlbum photoAlbum = (PhotoAlbum) baseDao.findById(PhotoAlbum.class, id);
			baseDao.delete(photoAlbum);
		} catch (Exception e) {
			throw new PhotoAlbumException("PhotoAlbum删除异常");
		}
	}

	/**
	 * PhotoAlbum保存
	 */
	@Override
	@Transactional
	public void savePhotoAlbum(PhotoAlbum photoAlbum) throws PhotoAlbumException {
		try {
			baseDao.save(photoAlbum);
		} catch (Exception e) {
			throw new PhotoAlbumException("PhotoAlbum保存异常");
		}
	}

	/**
	 * PhotoAlbum按ID查询
	 */
	@Override
	@Transactional
	public PhotoAlbum findPhotoAlbumById(Integer id) throws PhotoAlbumException {
		try {
			return (PhotoAlbum) baseDao.findById(PhotoAlbum.class, id);
		} catch (Exception e) {
			throw new PhotoAlbumException("PhotoAlbum按ID查询异常");
		}
	}

	/**
	 * PhotoAlbum分页
	 */
	@Override
	@Transactional
	public PageConf findPhotoAlbumPageList(int start, int limit, Map map) throws PhotoAlbumException {
		try {
			String hql = " select module from PhotoAlbum module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.findPage(start, limit, hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new PhotoAlbumException("PhotoAlbum分页异常");
		}
	}
	
	/**
	 * 查询PhotoAlbum全部
	 */
	@Override
	@Transactional
	public List<PhotoAlbum> findAllPhotoAlbum(Map map) throws PhotoAlbumException {
		try {
			String hql = " select module from PhotoAlbum module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.find(hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new PhotoAlbumException("查询PhotoAlbum全部异常");
		}
	}

}
