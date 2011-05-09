package com.freewebsys.sns.service.imp;

import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.service.CommonDaoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.pojo.FeedTemplate;
import com.freewebsys.sns.service.FeedTemplateService;
import com.freewebsys.sns.service.FeedTemplateException;

public class FeedTemplateServiceImp implements FeedTemplateService {
	
	@Autowired
	private BaseDao baseDao;

	/**
	 * FeedTemplate删除
	 */
	@Override
	@Transactional
	public void deleteFeedTemplateById(Integer id) throws FeedTemplateException {
		try{
			FeedTemplate feedTemplate = (FeedTemplate) baseDao.findById(FeedTemplate.class, id);
			baseDao.delete(feedTemplate);
		} catch (Exception e) {
			throw new FeedTemplateException("FeedTemplate删除异常");
		}
	}

	/**
	 * FeedTemplate保存
	 */
	@Override
	@Transactional
	public void saveFeedTemplate(FeedTemplate feedTemplate) throws FeedTemplateException {
		try {
			baseDao.save(feedTemplate);
		} catch (Exception e) {
			throw new FeedTemplateException("FeedTemplate保存异常");
		}
	}

	/**
	 * FeedTemplate按ID查询
	 */
	@Override
	@Transactional
	public FeedTemplate findFeedTemplateById(Integer id) throws FeedTemplateException {
		try {
			return (FeedTemplate) baseDao.findById(FeedTemplate.class, id);
		} catch (Exception e) {
			throw new FeedTemplateException("FeedTemplate按ID查询异常");
		}
	}

	/**
	 * FeedTemplate分页
	 */
	@Override
	@Transactional
	public PageConf findFeedTemplatePageList(int start, int limit, Map map) throws FeedTemplateException {
		try {
			String hql = " select module from FeedTemplate module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.findPage(start, limit, hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new FeedTemplateException("FeedTemplate分页异常");
		}
	}
	
	/**
	 * 查询FeedTemplate全部
	 */
	@Override
	@Transactional
	public List<FeedTemplate> findAllFeedTemplate(Map map) throws FeedTemplateException {
		try {
			String hql = " select module from FeedTemplate module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.find(hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new FeedTemplateException("查询FeedTemplate全部异常");
		}
	}

}
