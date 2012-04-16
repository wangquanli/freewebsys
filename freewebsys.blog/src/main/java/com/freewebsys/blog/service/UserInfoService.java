package com.freewebsys.blog.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.blog.page.PageConf;
import com.freewebsys.blog.pojo.UserInfo;

public interface UserInfoService{
	/**
	 * @Description: 保存
	 */
	void saveUserInfo(UserInfo userInfo) throws Exception;
	/**
	 * @Description: 删除
	 */
	void deleteUserInfoById(Long id) throws Exception;
	/**
	 * @Description:  按ID查询
	 */
	UserInfo findUserInfoById(Long id) throws Exception;
	/**
	 * @Description:  查询分页
	 */
	PageConf findUserInfoPageList(int start, int limit, Map values) throws Exception;
	/**
	 * @Description:  查询全部
	 */
	List<UserInfo> findAllUserInfo(Map values) throws Exception;
	
	/**
	 * @Description:  用户登录。
	 */
	UserInfo getUserInfoByLogin(String loginName, String passwd);
}
