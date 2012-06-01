package com.freewebsys.blog.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.blog.page.PageConf;
import com.freewebsys.blog.pojo.PostType;

public interface PostTypeService {
	/**
	 * @Description: 保存
	 */
	void savePostType(PostType postType) throws Exception;

	/**
	 * @Description: 删除
	 */
	void deletePostTypeById(Long id) throws Exception;

	/**
	 * @Description: 按ID查询
	 */
	PostType findPostTypeById(Long id) throws Exception;

	/**
	 * @Description: 首页分类
	 */
	PostType findHomePostType() throws Exception;

	/**
	 * @Description: 查询全部
	 */
	List<PostType> findAllPostType() throws Exception;
}
