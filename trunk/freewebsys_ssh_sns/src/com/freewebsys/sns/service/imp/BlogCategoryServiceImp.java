package com.freewebsys.sns.service.imp;

import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.service.CommonDaoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.pojo.BlogCategory;
import com.freewebsys.sns.service.BlogCategoryService;
import com.freewebsys.sns.service.BlogCategoryException;

public class BlogCategoryServiceImp implements BlogCategoryService {
	
	@Autowired
	private BaseDao baseDao;

	/**
	 * BlogCategory删除
	 */
	@Override
	@Transactional
	public void deleteBlogCategoryById(Integer id) throws BlogCategoryException {
		try{
			BlogCategory blogCategory = (BlogCategory) baseDao.findById(BlogCategory.class, id);
			baseDao.delete(blogCategory);
		} catch (Exception e) {
			throw new BlogCategoryException("BlogCategory删除异常");
		}
	}

	/**
	 * BlogCategory保存
	 */
	@Override
	@Transactional
	public void saveBlogCategory(BlogCategory blogCategory) throws BlogCategoryException {
		try {
			baseDao.save(blogCategory);
		} catch (Exception e) {
			throw new BlogCategoryException("BlogCategory保存异常");
		}
	}

	/**
	 * BlogCategory按ID查询
	 */
	@Override
	@Transactional
	public BlogCategory findBlogCategoryById(Integer id) throws BlogCategoryException {
		try {
			return (BlogCategory) baseDao.findById(BlogCategory.class, id);
		} catch (Exception e) {
			throw new BlogCategoryException("BlogCategory按ID查询异常");
		}
	}

	/**
	 * BlogCategory分页
	 */
	@Override
	@Transactional
	public PageConf findBlogCategoryPageList(int start, int limit, Map map) throws BlogCategoryException {
		try {
			String hql = " select module from BlogCategory module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.findPage(start, limit, hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new BlogCategoryException("BlogCategory分页异常");
		}
	}
	
	/**
	 * 查询BlogCategory全部
	 */
	@Override
	@Transactional
	public List<BlogCategory> findAllBlogCategory(Map map) throws BlogCategoryException {
		try {
			String hql = " select module from BlogCategory module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.find(hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new BlogCategoryException("查询BlogCategory全部异常");
		}
	}

}
