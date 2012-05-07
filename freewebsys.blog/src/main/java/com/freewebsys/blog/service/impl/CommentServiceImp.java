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
import com.freewebsys.blog.pojo.Comment;
import com.freewebsys.blog.service.CommentService;
 
public class CommentServiceImp implements CommentService {
	
	@Autowired
	private BaseDao baseDao;

	private static Log log = LogFactory.getLog(CommentServiceImp.class);

	/**
	 * Comment删除
	 */
	@Transactional
	public void deleteCommentById(Long id) throws Exception {
		log.info("deleteCommentById：" + id);
		try{
			Comment comment = (Comment) baseDao.findById(Comment.class, id);
			baseDao.delete(comment);
		} catch (Exception e) {
			log.info("Comment删除异常");
			e.printStackTrace();
		}
	}

	/**
	 * Comment保存
	 */
	@Transactional
	public void saveComment(Comment comment) throws Exception {
		log.info("saveComment：" + comment);
		try {
			baseDao.save(comment);
		} catch (Exception e) {
			log.info("Comment保存异常");
			e.printStackTrace();
		}
	}

	/**
	 * Comment按ID查询
	 */
	@Transactional
	public Comment findCommentById(Long id) throws Exception {
		log.info("findCommentById：" + id);
		try {
			return (Comment) baseDao.findById(Comment.class, id);
		} catch (Exception e) {
			log.info("Comment按ID查询异常");
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * Comment分页
	 */
	@Transactional
	public PageConf findCommentPageList(int start, int limit, Map map) throws Exception {
		log.info("findCommentPageList：" + start + "," + limit);
		try {
			String hql = " select module from Comment module ";
			return baseDao.findPage(start, limit, hql);
		} catch (Exception e) {
			log.info("Comment分页异常");
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询Comment全部
	 */
	@Transactional
	public List<Comment> findAllComment(Map map) throws Exception {
		log.info("findAllComment：");
		try {
			String hql = " select module from Comment module ";
			return baseDao.find(hql);
		} catch (Exception e) {
			log.info("查询Comment全部异常");
			e.printStackTrace();
		}
		return null;
	}

}
