package com.freewebsys.blog.service;

import java.util.List;
import java.util.Map;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.freewebsys.blog.page.PageConf;
import com.freewebsys.blog.pojo.Post;

public interface PostService {
	/**
	 * @Description: 保存
	 */
	void savePost(Post post, HttpServletRequest request) throws Exception;

	/**
	 * @Description: 删除
	 */
	void deletePostById(Long id, HttpServletRequest request) throws Exception;

	/**
	 * @Description: 按ID查询
	 */
	Post findPostById(Long id) throws Exception;

	/**
	 * @Description: 查询分页
	 */
	PageConf findPostPageList(int start, int limit, Map values)
			throws Exception;

	/**
	 * @Description: 查询全部
	 */
	List<Post> findAllPost() throws Exception;
}
