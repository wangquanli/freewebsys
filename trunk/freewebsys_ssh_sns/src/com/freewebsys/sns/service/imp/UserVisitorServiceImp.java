package com.freewebsys.sns.service.imp;

import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.service.CommonDaoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.pojo.UserVisitor;
import com.freewebsys.sns.service.UserVisitorService;
import com.freewebsys.sns.service.UserVisitorException;

public class UserVisitorServiceImp implements UserVisitorService {
	
	@Autowired
	private BaseDao baseDao;

	/**
	 * UserVisitor删除
	 */
	@Override
	@Transactional
	public void deleteUserVisitorById(Integer id) throws UserVisitorException {
		try{
			UserVisitor userVisitor = (UserVisitor) baseDao.findById(UserVisitor.class, id);
			baseDao.delete(userVisitor);
		} catch (Exception e) {
			throw new UserVisitorException("UserVisitor删除异常");
		}
	}

	/**
	 * UserVisitor保存
	 */
	@Override
	@Transactional
	public void saveUserVisitor(UserVisitor userVisitor) throws UserVisitorException {
		try {
			baseDao.save(userVisitor);
		} catch (Exception e) {
			throw new UserVisitorException("UserVisitor保存异常");
		}
	}

	/**
	 * UserVisitor按ID查询
	 */
	@Override
	@Transactional
	public UserVisitor findUserVisitorById(Integer id) throws UserVisitorException {
		try {
			return (UserVisitor) baseDao.findById(UserVisitor.class, id);
		} catch (Exception e) {
			throw new UserVisitorException("UserVisitor按ID查询异常");
		}
	}

	/**
	 * UserVisitor分页
	 */
	@Override
	@Transactional
	public PageConf findUserVisitorPageList(int start, int limit, Map map) throws UserVisitorException {
		try {
			String hql = " select module from UserVisitor module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.findPage(start, limit, hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new UserVisitorException("UserVisitor分页异常");
		}
	}
	
	/**
	 * 查询UserVisitor全部
	 */
	@Override
	@Transactional
	public List<UserVisitor> findAllUserVisitor(Map map) throws UserVisitorException {
		try {
			String hql = " select module from UserVisitor module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.find(hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new UserVisitorException("查询UserVisitor全部异常");
		}
	}

}
