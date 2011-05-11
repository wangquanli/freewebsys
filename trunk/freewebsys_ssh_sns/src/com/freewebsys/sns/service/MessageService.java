package com.freewebsys.sns.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.sns.pojo.Message;
import com.freewebsys.sns.pojo.UserInfo;
import com.freewebsys.sns.service.MessageException;

public interface MessageService {
	/**
	 * @Description: 保存
	 */
	void saveMessage(Message message, UserInfo fromUserInfo)
			throws MessageException;

	/**
	 * @Description: 删除
	 */
	void deleteMessageById(Integer id) throws MessageException;

	/**
	 * @Description: 按ID查询
	 */
	Message findMessageById(Integer id) throws MessageException;

	/**
	 * @Description: 查询分页
	 */
	PageConf findMessagePageList(int start, int limit, UserInfo myUserInfo,
			String type) throws MessageException;

	/**
	 * @Description: 查询全部
	 */
	List<Message> findAllMessage(Map values) throws MessageException;

	/**
	 * @Description: 查询全部
	 */
	String[] findUserByIds(String ids) throws MessageException;
}
