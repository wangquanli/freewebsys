package com.freewebsys.blog.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.blog.page.PageConf;
import com.freewebsys.blog.pojo.Comment;

public interface CommentService{
	/**
	 * @Description: 保存
	 */
	void saveComment(Comment comment) throws Exception;
	/**
	 * @Description: 删除
	 */
	void deleteCommentById(Long id) throws Exception;
	/**
	 * @Description:  按ID查询
	 */
	Comment findCommentById(Long id) throws Exception;
	/**
	 * @Description:  查询分页
	 */
	PageConf findCommentPageList(int start, int limit, Map values) throws Exception;
	/**
	 * @Description:  查询全部
	 */
	List<Comment> findAllComment(Map values) throws Exception;
}
