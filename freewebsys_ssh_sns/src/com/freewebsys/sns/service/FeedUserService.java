package com.freewebsys.sns.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.sns.pojo.FeedUser;
import com.freewebsys.sns.service.FeedUserException;

public interface FeedUserService{
	/**
	 * @Description: 保存
	 */
	void saveFeedUser(FeedUser feedUser) throws FeedUserException;
	/**
	 * @Description: 删除
	 */
	void deleteFeedUserById(Integer id) throws FeedUserException;
	/**
	 * @Description:  按ID查询
	 */
	FeedUser findFeedUserById(Integer id) throws FeedUserException;
	/**
	 * @Description:  查询分页
	 */
	PageConf findFeedUserPageList(int start, int limit, Map values) throws FeedUserException;
	/**
	 * @Description:  查询全部
	 */
	List<FeedUser> findAllFeedUser(Map values) throws FeedUserException;
}
