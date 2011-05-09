package com.freewebsys.sns.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.sns.pojo.Comment;
import com.freewebsys.sns.service.CommentException;

public interface CommentService{
	/**
	 * @Description: 保存
	 */
	void saveComment(Comment comment) throws CommentException;
	/**
	 * @Description: 删除
	 */
	void deleteCommentById(Integer id) throws CommentException;
	/**
	 * @Description:  按ID查询
	 */
	Comment findCommentById(Integer id) throws CommentException;
	/**
	 * @Description:  查询分页
	 */
	PageConf findCommentPageList(int start, int limit, Map values) throws CommentException;
	/**
	 * @Description:  查询全部
	 */
	List<Comment> findAllComment(Map values) throws CommentException;
}
