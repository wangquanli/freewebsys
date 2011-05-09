package com.freewebsys.sns.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.sns.pojo.Mini;
import com.freewebsys.sns.service.MiniException;
import com.freewebsys.sns.pojo.UserInfo;

public interface MiniService {
	/**
	 * @Description: 保存
	 */
	void saveMini(Mini mini) throws MiniException;

	/**
	 * @Description: 删除
	 */
	void deleteMiniById(Integer id) throws MiniException;

	/**
	 * @Description: 按ID查询
	 */
	Mini findMiniById(Integer id) throws MiniException;

	/**
	 * @Description: 查询分页
	 */
	PageConf findMiniPageList(int start, int limit, UserInfo userInfo,
			String type) throws MiniException;

	/**
	 * @Description: 查询全部
	 */
	List<Mini> findAllMini(Map values) throws MiniException;
}
