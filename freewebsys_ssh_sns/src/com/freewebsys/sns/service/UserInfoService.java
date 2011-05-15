package com.freewebsys.sns.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.sns.pojo.UserInfo;
import com.freewebsys.sns.service.UserInfoException;

public interface UserInfoService {
	/**
	 * @Description: 保存注册用户
	 */
	UserInfo saveUserRegister(UserInfo userInfo) throws UserInfoException;

	/**
	 * @Description: 按ID查询
	 */
	UserInfo findUserInfoById(Integer id) throws UserInfoException;

	/**
	 * @Description: 按Email查询
	 */
	UserInfo findUserInfoByEmail(String email) throws UserInfoException;

	/**
	 * @Description: 按Email查询和密码查询,登录调用
	 */
	UserInfo findUserInfoByEmailPasswd(String email, String passwd)
			throws UserInfoException;

	/**
	 * @Description: 激活帐户
	 */
	UserInfo saveActiveUser(String ac) throws UserInfoException;

}
