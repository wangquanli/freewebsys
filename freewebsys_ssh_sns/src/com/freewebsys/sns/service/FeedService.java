package com.freewebsys.sns.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.sns.pojo.Feed;
import com.freewebsys.sns.service.FeedException;
import com.freewebsys.sns.pojo.UserInfo;

public interface FeedService {

	/**
	 * @Description: 用户动态删除
	 */
	void deleteFeedById(Integer id, UserInfo userInfo) throws FeedException;

	/**
	 * @Description: 查询分页
	 */
	PageConf findFeedPiecePageList(int start, int limit, UserInfo userInfo,
			String type) throws FeedException;

	/**
	 * @Description: 保存用户动态,并将动态插入到用户好友的数据.
	 */
	void saveFeed(Object obj) throws FeedException;
}
