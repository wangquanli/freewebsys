package com.freewebsys.sns.service.imp;

import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.service.CommonDaoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.pojo.FriendBlack;
import com.freewebsys.sns.service.FriendBlackService;
import com.freewebsys.sns.service.FriendBlackException;

public class FriendBlackServiceImp implements FriendBlackService {
	
	@Autowired
	private BaseDao baseDao;

	/**
	 * FriendBlack删除
	 */
	@Override
	@Transactional
	public void deleteFriendBlackById(Integer id) throws FriendBlackException {
		try{
			FriendBlack friendBlack = (FriendBlack) baseDao.findById(FriendBlack.class, id);
			baseDao.delete(friendBlack);
		} catch (Exception e) {
			throw new FriendBlackException("FriendBlack删除异常");
		}
	}

	/**
	 * FriendBlack保存
	 */
	@Override
	@Transactional
	public void saveFriendBlack(FriendBlack friendBlack) throws FriendBlackException {
		try {
			baseDao.save(friendBlack);
		} catch (Exception e) {
			throw new FriendBlackException("FriendBlack保存异常");
		}
	}

	/**
	 * FriendBlack按ID查询
	 */
	@Override
	@Transactional
	public FriendBlack findFriendBlackById(Integer id) throws FriendBlackException {
		try {
			return (FriendBlack) baseDao.findById(FriendBlack.class, id);
		} catch (Exception e) {
			throw new FriendBlackException("FriendBlack按ID查询异常");
		}
	}

	/**
	 * FriendBlack分页
	 */
	@Override
	@Transactional
	public PageConf findFriendBlackPageList(int start, int limit, Map map) throws FriendBlackException {
		try {
			String hql = " select module from FriendBlack module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.findPage(start, limit, hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new FriendBlackException("FriendBlack分页异常");
		}
	}
	
	/**
	 * 查询FriendBlack全部
	 */
	@Override
	@Transactional
	public List<FriendBlack> findAllFriendBlack(Map map) throws FriendBlackException {
		try {
			String hql = " select module from FriendBlack module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.find(hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new FriendBlackException("查询FriendBlack全部异常");
		}
	}

}
