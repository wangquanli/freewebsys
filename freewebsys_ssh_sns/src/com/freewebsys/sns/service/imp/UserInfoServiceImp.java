package com.freewebsys.sns.service.imp;

import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.service.CommonDaoUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.freewebsys.sns.service.MailService;
import com.freewebsys.sns.pojo.UserInfo;
import com.freewebsys.sns.service.UserInfoService;
import com.freewebsys.sns.service.UserInfoException;

public class UserInfoServiceImp implements UserInfoService {

	@Autowired
	private BaseDao baseDao;

	@Autowired
	private MailService mailService;

	/**
	 * UserInfo删除
	 */
	@Override
	@Transactional
	public void deleteUserInfoById(Integer id) throws UserInfoException {
		try {
			UserInfo userInfo = (UserInfo) baseDao.findById(UserInfo.class, id);
			baseDao.delete(userInfo);
		} catch (Exception e) {
			throw new UserInfoException("UserInfo删除异常");
		}
	}

	/**
	 * UserInfo保存
	 */
	@Override
	@Transactional
	public UserInfo saveUserRegister(UserInfo userInfo)
			throws UserInfoException {
		try {
			baseDao.save(userInfo);// 保存用户
			mailService.systemSendMail(userInfo.getEmail(), "恭喜您注册成功。", "code");// 发送邮件
			return userInfo;
		} catch (Exception e) {
			throw new UserInfoException("UserInfo保存异常");
		}
	}

	/**
	 * UserInfo保存
	 */
	@Override
	@Transactional
	public void saveUserInfo(UserInfo userInfo) throws UserInfoException {
		try {
			baseDao.save(userInfo);
		} catch (Exception e) {
			throw new UserInfoException("UserInfo保存异常");
		}
	}

	/**
	 * UserInfo按ID查询
	 */
	@Override
	@Transactional
	public UserInfo findUserInfoById(Integer id) throws UserInfoException {
		try {
			return (UserInfo) baseDao.findById(UserInfo.class, id);
		} catch (Exception e) {
			throw new UserInfoException("UserInfo按ID查询异常");
		}
	}

	/**
	 * UserInfo按email查询
	 */
	@Override
	@Transactional
	public UserInfo findUserInfoByEmail(String email) throws UserInfoException {
		try {
			String hql = "from UserInfo userInfo where userInfo.email = ? ";
			return (UserInfo) baseDao.findFirstOne(hql, email);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new UserInfoException("UserInfo按email查询异常");
		}
	}

	/**
	 * UserInfo按email和密码查询
	 */
	@Override
	public UserInfo findUserInfoByEmailPasswd(String email, String passwd)
			throws UserInfoException {
		try {
			String hql = "from UserInfo userInfo where userInfo.email = ? and userInfo.passwd = ? ";
			return (UserInfo) baseDao.findFirstOne(hql, email, passwd);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new UserInfoException("UserInfo按email,密码查询异常");
		}
	}

	/**
	 * UserInfo分页
	 */
	@Override
	@Transactional
	public PageConf findUserInfoPageList(int start, int limit, Map map)
			throws UserInfoException {
		try {
			String hql = " select module from UserInfo module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.findPage(start, limit, hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new UserInfoException("UserInfo分页异常");
		}
	}

	/**
	 * 查询UserInfo全部
	 */
	@Override
	@Transactional
	public List<UserInfo> findAllUserInfo(Map map) throws UserInfoException {
		try {
			String hql = " select module from UserInfo module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.find(hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new UserInfoException("查询UserInfo全部异常");
		}
	}

}
