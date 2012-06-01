package com.freewebsys.blog.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.freewebsys.blog.dao.BaseDao;
import com.freewebsys.blog.page.PageConf;
import com.freewebsys.blog.pojo.PostType;
import com.freewebsys.blog.service.PostTypeService;

public class PostTypeServiceImp implements PostTypeService {

	@Autowired
	private BaseDao baseDao;

	private static Log log = LogFactory.getLog(PostTypeServiceImp.class);

	/**
	 * PostType删除
	 */
	@Transactional
	public void deletePostTypeById(Long id) throws Exception {
		log.info("deletePostTypeById：" + id);
		try {
			PostType postType = (PostType) baseDao.findById(PostType.class, id);
			baseDao.delete(postType);
		} catch (Exception e) {
			log.info("PostType删除异常");
			e.printStackTrace();
		}
	}

	/**
	 * PostType保存
	 */
	@Transactional
	public void savePostType(PostType postType) throws Exception {
		log.info("savePostType：" + postType);
		try {
			if (postType.getId() == null) {
				// 设置排序号
				postType.setOrderId(new Date().getTime());
			}
			baseDao.save(postType);
		} catch (Exception e) {
			log.info("PostType保存异常");
			e.printStackTrace();
		}
	}

	/**
	 * PostType按ID查询
	 */
	@Transactional
	public PostType findPostTypeById(Long id) throws Exception {
		log.info("findPostTypeById：" + id);
		try {
			return (PostType) baseDao.findById(PostType.class, id);
		} catch (Exception e) {
			log.info("PostType按ID查询异常");
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 查询PostType全部
	 */
	@Transactional
	public List<PostType> findAllPostType() throws Exception {
		log.info("findAllPostType：");
		try {
			String hql = " select module from PostType module order by module.isHome desc ,module.orderId asc ";
			return baseDao.find(hql);
		} catch (Exception e) {
			log.info("查询PostType全部异常");
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 查询Home的分类PostType
	 */
	@Transactional
	public PostType findHomePostType() throws Exception {
		log.info("findHomePostType:");
		try {
			String hql = "from PostType postType where postType.isHome = 1 ";
			return (PostType) baseDao.findFirstOne(hql);
		} catch (Exception e) {
			log.info("PostType按ID查询异常");
			e.printStackTrace();
		}
		return null;
	}

}
