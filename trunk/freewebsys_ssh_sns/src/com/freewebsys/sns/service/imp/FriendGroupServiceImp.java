package com.freewebsys.sns.service.imp;

import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.service.CommonDaoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.pojo.FriendGroup;
import com.freewebsys.sns.service.FriendGroupService;
import com.freewebsys.sns.service.FriendGroupException;

public class FriendGroupServiceImp implements FriendGroupService {
	
	@Autowired
	private BaseDao baseDao;

	/**
	 * FriendGroup删除
	 */
	@Override
	@Transactional
	public void deleteFriendGroupById(Integer id) throws FriendGroupException {
		try{
			FriendGroup friendGroup = (FriendGroup) baseDao.findById(FriendGroup.class, id);
			baseDao.delete(friendGroup);
		} catch (Exception e) {
			throw new FriendGroupException("FriendGroup删除异常");
		}
	}

	/**
	 * FriendGroup保存
	 */
	@Override
	@Transactional
	public void saveFriendGroup(FriendGroup friendGroup) throws FriendGroupException {
		try {
			baseDao.save(friendGroup);
		} catch (Exception e) {
			throw new FriendGroupException("FriendGroup保存异常");
		}
	}

	/**
	 * FriendGroup按ID查询
	 */
	@Override
	@Transactional
	public FriendGroup findFriendGroupById(Integer id) throws FriendGroupException {
		try {
			return (FriendGroup) baseDao.findById(FriendGroup.class, id);
		} catch (Exception e) {
			throw new FriendGroupException("FriendGroup按ID查询异常");
		}
	}

	/**
	 * FriendGroup分页
	 */
	@Override
	@Transactional
	public PageConf findFriendGroupPageList(int start, int limit, Map map) throws FriendGroupException {
		try {
			String hql = " select module from FriendGroup module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.findPage(start, limit, hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new FriendGroupException("FriendGroup分页异常");
		}
	}
	
	/**
	 * 查询FriendGroup全部
	 */
	@Override
	@Transactional
	public List<FriendGroup> findAllFriendGroup(Map map) throws FriendGroupException {
		try {
			String hql = " select module from FriendGroup module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.find(hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new FriendGroupException("查询FriendGroup全部异常");
		}
	}

}
