package com.freewebsys.sns.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.sns.pojo.UserVisitor;
import com.freewebsys.sns.service.UserVisitorException;

public interface UserVisitorService{
	/**
	 * @Description: 保存
	 */
	void saveUserVisitor(UserVisitor userVisitor) throws UserVisitorException;
	/**
	 * @Description: 删除
	 */
	void deleteUserVisitorById(Integer id) throws UserVisitorException;
	/**
	 * @Description:  按ID查询
	 */
	UserVisitor findUserVisitorById(Integer id) throws UserVisitorException;
	/**
	 * @Description:  查询分页
	 */
	PageConf findUserVisitorPageList(int start, int limit, Map values) throws UserVisitorException;
	/**
	 * @Description:  查询全部
	 */
	List<UserVisitor> findAllUserVisitor(Map values) throws UserVisitorException;
}
