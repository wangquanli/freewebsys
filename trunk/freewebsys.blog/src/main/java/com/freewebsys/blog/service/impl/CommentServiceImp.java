package com.freewebsys.blog.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.freewebsys.blog.common.GlobalConf;
import com.freewebsys.blog.dao.BaseDao;
import com.freewebsys.blog.page.PageConf;
import com.freewebsys.blog.pojo.Comment;
import com.freewebsys.blog.pojo.Post;
import com.freewebsys.blog.service.CommentService;
import com.freewebsys.blog.template.CommonTemplateService;
import com.freewebsys.blog.template.FreemakerTemplateEngine;

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
		try {
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
			if (comment.getPostId() != null) {
				baseDao.save(comment);

				Post post = (Post) baseDao.findById(Post.class,
						comment.getPostId());
				// 所有评论数据.
				List<Comment> commentList = findAllCommentByPostId(post.getId());
				// 循环展示页面.
				String url = post.getUrl();
				url = url.substring(0, url.lastIndexOf("/") + 1);
				// 生成评论文件夹路径。
				String filePath = FreemakerTemplateEngine.WEBAPP_PATH + url
						+ "article_" + post.getId() + "/";
				// 如果文件夹不存在,创建.
				File fileDir = new File(filePath);
				if (!fileDir.exists()) {
					fileDir.mkdirs();
				}
				// 输出评论数量。
				System.out.println(filePath + "comment_count.json");
				FileUtils.writeStringToFile(new File(filePath
						+ "comment_count.json"), commentList.size() + "",
						GlobalConf.ENCODING);
				// 生成评论分页数据。
				CommonTemplateService.genCommentByPage(20, commentList,
						filePath);
			}

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
	public PageConf findCommentPageList(int start, int limit, Map map)
			throws Exception {
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
	public List<Comment> findAllCommentByPostId(Long postId) throws Exception {
		log.info("findAllCommentByPostId：" + postId);
		try {
			String hql = " select module from Comment module where module.status = 1 " +
					" and module.postId = ? order by module.createDate asc";
			return baseDao.find(hql, postId);
		} catch (Exception e) {
			log.info("查询Comment全部异常");
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		String url = "/2012/01/01/111.html";
		System.out.println(url.substring(0, url.lastIndexOf("/") + 1));
	}

}
