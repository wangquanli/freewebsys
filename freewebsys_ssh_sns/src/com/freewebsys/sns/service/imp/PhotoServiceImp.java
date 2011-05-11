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
import com.freewebsys.sns.service.BlogException;
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
		try {
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
	public void savePhoto(Integer photoAlbumId, String[] photoUploadFile,
			String[] photoUploadFileName, UserInfo userInfo)
			throws PhotoException {
		try {
			PhotoAlbum photoAlbum = null;
			if (photoAlbumId == null) {
			}
			for (int i = 0; photoUploadFile != null
					&& i < photoUploadFile.length; i++) {
				Photo photo = new Photo();
				// 设置文件名称
				photo.setName(photoUploadFileName[i]);
				photo.setCreateTime(new Date());
				photo.setCommentCount(0);
				photo.setReadCount(0);
				// 设置图片路径
				photo.setImagePath(photoUploadFile[i]);
				int position = photoUploadFile[i].lastIndexOf(".");
				String extension = photoUploadFile[i].substring(position);
				photoUploadFile[i] = photoUploadFile[i].replace(extension, "")
						+ "_resize" + extension;
				// 设置缩略图片路径
				photo.setSmallImagePath(photoUploadFile[i]);

				photo.setUserInfo(userInfo);
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
	 * Blog分页
	 */
	@Override
	@Transactional
	public PageConf findPhotoPageList(int start, int limit, UserInfo userInfo,
			String type) throws BlogException {
		try {
			String hql = " select module from Photo module left join fetch module.userInfo left join fetch module.photoAlbum ";
			// 通用查询匹配
			if (type != null && userInfo != null) {
				if (type.equals("friend")) {
					hql += " where exists ( select friend.friend.id from Friend friend "
							+ " where friend.friend.id = module.userInfo.id and friend.userId = ? ) "
							+ " order by module.createTime desc ";
					return baseDao
							.findPage(start, limit, hql, userInfo.getId());
				} else if (type.equals("my")) {
					// 查询我自己的日志
					hql += " where module.userInfo.id = ? order by module.createTime desc ";
					return baseDao
							.findPage(start, limit, hql, userInfo.getId());
				} else if (type.equals("all")) {
					//
					hql += " order by module.createTime desc ";
					return baseDao.findPage(start, limit, hql);
				} else {
					return null;
				}
			} else {
				return null;
			}
		} catch (Exception e) {
			throw new BlogException("Blog分页异常");
		}
	}

	/**
	 * Blog分页
	 */
	@Override
	@Transactional
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public PageConf findPhotoPageList(int start, int limit, UserInfo userInfo,
			String type, Integer photoId) throws BlogException {
		try {
			String sql = " select temp_0.rowno from (select @rowno := @rowno + 1 as rowno , module.id as id from Photo as module "
					+ " , (select @rowno := 0 ) as t_rowno ";
			// 通用查询匹配
			if (type != null && userInfo != null) {

				// 找到blogId所在位置
				Long indexStart = 0L;

				if (type.equals("friend")) {
					sql += " and exists ( select friend.friend.id from Friend friend "
							+ " where friend.friend.id = module.userInfo.id and friend.userId = ? ) "
							+ " order by module.createTime desc ";
					System.out.println(sql);
					List<Object[]> countList = baseDao.findSql(sql, photoId);
					if (countList.iterator().hasNext()) {
						Object[] obj = countList.iterator().next();
						indexStart = (Long) obj[0];
					}
					System.out.println(indexStart);
				} else if (type.equals("my")) {
					// 查询我自己的日志
					sql += " where module.userId = ? order by module.createTime desc ) as temp_0 where temp_0.id = ? ";
					System.out.println(sql);
					List<Object[]> countList = baseDao.findSql(sql,
							userInfo.getId(), photoId);
					if (countList.iterator().hasNext()) {
						Object[] obj = countList.iterator().next();
						indexStart = ((Double) obj[0]).longValue();
					}
					System.out.println(indexStart);
				} else if (type.equals("all")) {
					//
					sql += " order by module.createTime desc ) as temp_0 where temp_0.id = ? ";
					System.out.println(sql);
					List<Object[]> countList = baseDao.findSql(sql, photoId);
					if (countList.iterator().hasNext()) {
						Object[] obj = countList.iterator().next();
						indexStart = ((Double) obj[0]).longValue();
					}
					System.out.println(indexStart);
				}
				// 再次进行分页查询
				// 分页是从0开始所以-1
				// 处理第一篇文章
				return findPhotoPageList(indexStart.intValue() - 1, limit,
						userInfo, type);

			} else {
				return null;
			}
		} catch (Exception e) {
			throw new BlogException("Blog分页异常");
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
