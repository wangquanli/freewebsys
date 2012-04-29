package com.freewebsys.blog.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.blog.page.PageConf;
import com.freewebsys.blog.pojo.Link;

public interface LinkService{
	/**
	 * @Description: 保存
	 */
	void saveLink(Link link) throws Exception;
	/**
	 * @Description: 删除
	 */
	void deleteLinkById(Long id) throws Exception;
	/**
	 * @Description:  按ID查询
	 */
	Link findLinkById(Long id) throws Exception;
	/**
	 * @Description:  查询分页
	 */
	PageConf findLinkPageList(int start, int limit, Map values) throws Exception;
	/**
	 * @Description:  查询全部
	 */
	List<Link> findAllLink(Map values) throws Exception;
}
