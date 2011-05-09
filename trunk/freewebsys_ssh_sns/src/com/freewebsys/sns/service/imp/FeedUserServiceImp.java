package com.freewebsys.sns.service.imp;

import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.service.CommonDaoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.pojo.FeedUser;
import com.freewebsys.sns.service.FeedUserService;
import com.freewebsys.sns.service.FeedUserException;

public class FeedUserServiceImp implements FeedUserService {
	
	@Autowired
	private BaseDao baseDao;

	/**
	 * FeedUser删除
	 */
	@Override
	@Transactional
	public void deleteFeedUserById(Integer id) throws FeedUserException {
		try{
			FeedUser feedUser = (FeedUser) baseDao.findById(FeedUser.class, id);
			baseDao.delete(feedUser);
		} catch (Exception e) {
			throw new FeedUserException("FeedUser删除异常");
		}
	}

	/**
	 * FeedUser保存
	 */
	@Override
	@Transactional
	public void saveFeedUser(FeedUser feedUser) throws FeedUserException {
		try {
			baseDao.save(feedUser);
		} catch (Exception e) {
			throw new FeedUserException("FeedUser保存异常");
		}
	}

	/**
	 * FeedUser按ID查询
	 */
	@Override
	@Transactional
	public FeedUser findFeedUserById(Integer id) throws FeedUserException {
		try {
			return (FeedUser) baseDao.findById(FeedUser.class, id);
		} catch (Exception e) {
			throw new FeedUserException("FeedUser按ID查询异常");
		}
	}

	/**
	 * FeedUser分页
	 */
	@Override
	@Transactional
	public PageConf findFeedUserPageList(int start, int limit, Map map) throws FeedUserException {
		try {
			String hql = " select module from FeedUser module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.findPage(start, limit, hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new FeedUserException("FeedUser分页异常");
		}
	}
	
	/**
	 * 查询FeedUser全部
	 */
	@Override
	@Transactional
	public List<FeedUser> findAllFeedUser(Map map) throws FeedUserException {
		try {
			String hql = " select module from FeedUser module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.find(hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new FeedUserException("查询FeedUser全部异常");
		}
	}

}
