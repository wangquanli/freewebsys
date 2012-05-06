package com.freewebsys.blog.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.freewebsys.blog.common.GlobalConf;
import com.freewebsys.blog.dao.BaseDao;
import com.freewebsys.blog.page.PageConf;
import com.freewebsys.blog.pojo.Post;
import com.freewebsys.blog.service.PostService;
import com.freewebsys.blog.template.CommonTemplateService;
import com.mchange.v2.c3p0.stmt.GooGooStatementCache;

public class PostServiceImp implements PostService {

	@Autowired
	private BaseDao baseDao;

	private static Log log = LogFactory.getLog(PostServiceImp.class);

	/**
	 * Post删除
	 */
	@Transactional
	public void deletePostById(Long id) throws Exception {
		log.info("deletePostById：" + id);
		try {
			Post post = (Post) baseDao.findById(Post.class, id);
			baseDao.delete(post);

			// 重新生成静态页面.
			CommonTemplateService.genHtmlByTemplate(baseDao);
		} catch (Exception e) {
			log.info("Post删除异常");
			e.printStackTrace();
		}
	}

	/**
	 * Post保存
	 */
	@Transactional
	public void savePost(Post post) throws Exception {
		log.info("savePost：" + post);
		try {
			// 比较特殊需要知道ID.
			boolean updateUrl = false;

			if (post.getId() == null) {
				// 设置创建时间.
				post.setCreateDate(new Date().getTime());
				// 设置修改时间.
				post.setModifiedDate(new Date().getTime());
				updateUrl = true;
			} else {
				// 设置修改时间.
				post.setModifiedDate(new Date().getTime());
			}
			baseDao.save(post);

			if (updateUrl) {// 第一次保存的时候更新url.
				// 设置链接地址
				SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/");
				String url = GlobalConf.BLOG_PATH + sdf.format(new Date())
						+ "article_" + post.getId() + ".html";
				post.setUrl(url);
				updateUrl = false;
				baseDao.save(post);
			}
			// 重新生成静态页面.
			CommonTemplateService.genHtmlByTemplate(baseDao);
		} catch (Exception e) {
			log.info("Post保存异常");
			e.printStackTrace();
		}
	}

	/**
	 * Post按ID查询
	 */
	@Transactional
	public Post findPostById(Long id) throws Exception {
		log.info("findPostById：" + id);
		try {
			return (Post) baseDao.findById(Post.class, id);
		} catch (Exception e) {
			log.info("Post按ID查询异常");
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * Post分页
	 */
	@Transactional
	public PageConf findPostPageList(int start, int limit, Map map)
			throws Exception {
		log.info("findPostPageList：" + start + "," + limit);
		try {
			String hql = " select module from Post module ";
			return baseDao.findPage(start, limit, hql);
		} catch (Exception e) {
			log.info("Post分页异常");
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 查询Post全部
	 */
	@Transactional
	public List<Post> findAllPost(Map map) throws Exception {
		log.info("findAllPost：");
		try {
			String hql = " select module from Post module ";
			return baseDao.find(hql);
		} catch (Exception e) {
			log.info("查询Post全部异常");
			e.printStackTrace();
		}
		return null;
	}

}
