package com.freewebsys.sns.service.imp;

import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.service.CommonDaoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.pojo.Comment;
import com.freewebsys.sns.service.CommentService;
import com.freewebsys.sns.service.CommentException;

public class CommentServiceImp implements CommentService {
	
	@Autowired
	private BaseDao baseDao;

	/**
	 * Comment删除
	 */
	@Override
	@Transactional
	public void deleteCommentById(Integer id) throws CommentException {
		try{
			Comment comment = (Comment) baseDao.findById(Comment.class, id);
			baseDao.delete(comment);
		} catch (Exception e) {
			throw new CommentException("Comment删除异常");
		}
	}

	/**
	 * Comment保存
	 */
	@Override
	@Transactional
	public void saveComment(Comment comment) throws CommentException {
		try {
			baseDao.save(comment);
		} catch (Exception e) {
			throw new CommentException("Comment保存异常");
		}
	}

	/**
	 * Comment按ID查询
	 */
	@Override
	@Transactional
	public Comment findCommentById(Integer id) throws CommentException {
		try {
			return (Comment) baseDao.findById(Comment.class, id);
		} catch (Exception e) {
			throw new CommentException("Comment按ID查询异常");
		}
	}

	/**
	 * Comment分页
	 */
	@Override
	@Transactional
	public PageConf findCommentPageList(int start, int limit, Map map) throws CommentException {
		try {
			String hql = " select module from Comment module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			hql += " order by module.createTime desc ";
			return baseDao.findPage(start, limit, hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new CommentException("Comment分页异常");
		}
	}
	
	/**
	 * 查询Comment全部
	 */
	@Override
	@Transactional
	public List<Comment> findAllComment(Map map) throws CommentException {
		try {
			String hql = " select module from Comment module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.find(hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new CommentException("查询Comment全部异常");
		}
	}
	
	/**
	 * 设计评论 分表 处理
	 */
	private String findCommentTable(String appType, Integer appId) {
		if (appType.equals("Blog")) {
			int tableId = appId.intValue() / 100;
			// 每 100 个评论 进行 分表设计
			return "CommentBlog_" + tableId;
			// 对 appId 进行 100 区分，在 100 范围内查询 同一个表
			// 查询 CommentBlog_0 , CommentBlog_1 , CommentBlog_2 这些数据表
		}
		return null;
	}

}
