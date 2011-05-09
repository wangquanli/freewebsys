package com.freewebsys.sns.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.sns.pojo.FeedTemplate;
import com.freewebsys.sns.service.FeedTemplateException;

public interface FeedTemplateService{
	/**
	 * @Description: 保存
	 */
	void saveFeedTemplate(FeedTemplate feedTemplate) throws FeedTemplateException;
	/**
	 * @Description: 删除
	 */
	void deleteFeedTemplateById(Integer id) throws FeedTemplateException;
	/**
	 * @Description:  按ID查询
	 */
	FeedTemplate findFeedTemplateById(Integer id) throws FeedTemplateException;
	/**
	 * @Description:  查询分页
	 */
	PageConf findFeedTemplatePageList(int start, int limit, Map values) throws FeedTemplateException;
	/**
	 * @Description:  查询全部
	 */
	List<FeedTemplate> findAllFeedTemplate(Map values) throws FeedTemplateException;
}
