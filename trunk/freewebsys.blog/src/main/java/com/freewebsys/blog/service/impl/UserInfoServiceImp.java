package com.freewebsys.blog.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.freewebsys.blog.common.PasswdUtil;
import com.freewebsys.blog.dao.BaseDao;
import com.freewebsys.blog.page.PageConf;
import com.freewebsys.blog.pojo.UserInfo;
import com.freewebsys.blog.service.UserInfoService;

public class UserInfoServiceImp implements UserInfoService {

	@Autowired
	private BaseDao baseDao;

	private static Log log = LogFactory.getLog(UserInfoServiceImp.class);

	/**
	 * UserInfo删除
	 */
	@Transactional
	public void deleteUserInfoById(Long id) throws Exception {
		log.info("deleteUserInfoById：" + id);
		try {
			UserInfo userInfo = (UserInfo) baseDao.findById(UserInfo.class, id);
			baseDao.delete(userInfo);
		} catch (Exception e) {
			log.info("UserInfo删除异常");
			e.printStackTrace();
		}
	}

	/**
	 * UserInfo保存
	 */
	@Transactional
	public void saveUserInfo(UserInfo userInfo) throws Exception {
		log.info("saveUserInfo：" + userInfo);
		try {
			baseDao.save(userInfo);
		} catch (Exception e) {
			log.info("UserInfo保存异常");
			e.printStackTrace();
		}
	}

	/**
	 * UserInfo按ID查询
	 */
	@Transactional
	public UserInfo findUserInfoById(Long id) throws Exception {
		log.info("findUserInfoById：" + id);
		try {
			return (UserInfo) baseDao.findById(UserInfo.class, id);
		} catch (Exception e) {
			log.info("UserInfo按ID查询异常");
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 用户登录。
	 */
	@Transactional
	public UserInfo getUserInfoByLogin(String loginName, String passwd) {
		log.info("getUserInfoByLogin：" + loginName + ","
				+ PasswdUtil.crypt(passwd));
		try {
			String hql = " from UserInfo userInfo where userInfo.loginName = ? and userInfo.passwd = ? and userInfo.status = ? ";
			return (UserInfo) baseDao.findFirstOne(hql, loginName,
					PasswdUtil.crypt(passwd), 1);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * UserInfo分页
	 */
	@Transactional
	public PageConf findUserInfoPageList(int start, int limit, Map map)
			throws Exception {
		log.info("findUserInfoPageList：" + start + "," + limit);
		try {
			String hql = " select module from UserInfo module ";
			return baseDao.findPage(start, limit, hql);
		} catch (Exception e) {
			log.info("UserInfo分页异常");
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 查询UserInfo全部
	 */
	@Transactional
	public List<UserInfo> findAllUserInfo(Map map) throws Exception {
		log.info("findAllUserInfo：");
		try {
			String hql = " select module from UserInfo module ";
			return baseDao.find(hql);
		} catch (Exception e) {
			log.info("查询UserInfo全部异常");
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 更新记住我.
	 */
	public String updateUserInfoRememberMe(Long userId) {
		log.info("updateUserInfoRememberMe：" + userId);
		try {
			// 查询用户信息.
			UserInfo userInfo = (UserInfo) baseDao.findById(UserInfo.class,
					userId);

			if (userInfo != null) {
				String rememberMe = PasswdUtil.crypt(userInfo.getLoginName()
						+ System.currentTimeMillis());
				userInfo.setRememberMe(rememberMe);
				// update .
				baseDao.save(userInfo);
				return rememberMe;
			} else {
				return "";
			}

		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 用户RememberMe登录.
	 */
	public UserInfo getUserInfoByRememberMe(String loginName, String rememberMe) {
		log.info("getUserInfoByRememberMe：" + loginName + "," + rememberMe);
		try {
			String hql = " from UserInfo userInfo where userInfo.loginName = ? and userInfo.rememberMe = ? and userInfo.status = ? ";
			return (UserInfo) baseDao.findFirstOne(hql, loginName, rememberMe,
					1);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
			return null;
		}
	}

	public static void main(String[] args) {
		System.out.println();
		String rememberMe = PasswdUtil.crypt("1234"
				+ System.currentTimeMillis());
		System.out.println(rememberMe);
	}

}
