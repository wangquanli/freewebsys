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
import com.freewebsys.blog.pojo.Link;
import com.freewebsys.blog.service.LinkService;
 
public class LinkServiceImp implements LinkService {
	
	@Autowired
	private BaseDao baseDao;

	private static Log log = LogFactory.getLog(LinkServiceImp.class);

	/**
	 * Link删除
	 */
	@Transactional
	public void deleteLinkById(Long id) throws Exception {
		log.info("deleteLinkById：" + id);
		try{
			Link link = (Link) baseDao.findById(Link.class, id);
			baseDao.delete(link);
		} catch (Exception e) {
			log.info("Link删除异常");
			e.printStackTrace();
		}
	}

	/**
	 * Link保存
	 */
	@Transactional
	public void saveLink(Link link) throws Exception {
		log.info("saveLink：" + link);
		try {
			baseDao.save(link);
		} catch (Exception e) {
			log.info("Link保存异常");
			e.printStackTrace();
		}
	}

	/**
	 * Link按ID查询
	 */
	@Transactional
	public Link findLinkById(Long id) throws Exception {
		log.info("findLinkById：" + id);
		try {
			return (Link) baseDao.findById(Link.class, id);
		} catch (Exception e) {
			log.info("Link按ID查询异常");
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * Link分页
	 */
	@Transactional
	public PageConf findLinkPageList(int start, int limit, Map map) throws Exception {
		log.info("findLinkPageList：" + start + "," + limit);
		try {
			String hql = " select module from Link module ";
			return baseDao.findPage(start, limit, hql);
		} catch (Exception e) {
			log.info("Link分页异常");
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询Link全部
	 */
	@Transactional
	public List<Link> findAllLink(Map map) throws Exception {
		log.info("findAllLink：");
		try {
			String hql = " select module from Link module ";
			return baseDao.find(hql);
		} catch (Exception e) {
			log.info("查询Link全部异常");
			e.printStackTrace();
		}
		return null;
	}

}
