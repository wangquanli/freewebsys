package com.freewebsys.sns.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.sns.pojo.Blog;
import com.freewebsys.sns.service.BlogException;
import com.freewebsys.sns.pojo.UserInfo;

public interface BlogService {
	/**
	 * @Description: 保存
	 */
	void saveBlog(Blog blog) throws BlogException;

	/**
	 * @Description: 删除
	 */
	void deleteBlogById(Integer id) throws BlogException;

	/**
	 * @Description: 按ID查询
	 */
	Blog findBlogById(Integer id) throws BlogException;

	/**
	 * @Description: 查询分页
	 */
	PageConf findBlogPageList(int start, int limit, UserInfo userInfo,
			String type) throws BlogException;
	
	/**
	 * @Description: 显示,上一页,下一页
	 */
	public PageConf findBlogPageList(int start, int limit, UserInfo userInfo,
			String type,Integer blogId) throws BlogException;

	/**
	 * @Description: 查询全部
	 */
	List<Blog> findAllBlog(Map values) throws BlogException;
}
