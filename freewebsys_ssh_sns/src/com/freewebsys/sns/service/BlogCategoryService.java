package com.freewebsys.sns.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.sns.pojo.BlogCategory;
import com.freewebsys.sns.service.BlogCategoryException;

public interface BlogCategoryService{
	/**
	 * @Description: 保存
	 */
	void saveBlogCategory(BlogCategory blogCategory) throws BlogCategoryException;
	/**
	 * @Description: 删除
	 */
	void deleteBlogCategoryById(Integer id) throws BlogCategoryException;
	/**
	 * @Description:  按ID查询
	 */
	BlogCategory findBlogCategoryById(Integer id) throws BlogCategoryException;
	/**
	 * @Description:  查询分页
	 */
	PageConf findBlogCategoryPageList(int start, int limit, Map values) throws BlogCategoryException;
	/**
	 * @Description:  查询全部
	 */
	List<BlogCategory> findAllBlogCategory(Map values) throws BlogCategoryException;
}
