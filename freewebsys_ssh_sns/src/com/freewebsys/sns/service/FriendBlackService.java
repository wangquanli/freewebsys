package com.freewebsys.sns.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.sns.pojo.FriendBlack;

public interface FriendBlackService{
	/**
	 * @Description: 保存
	 */
	void saveFriendBlack(FriendBlack friendBlack) throws FriendBlackException;
	/**
	 * @Description: 删除
	 */
	void deleteFriendBlackById(Integer id) throws FriendBlackException;
	/**
	 * @Description:  按ID查询
	 */
	FriendBlack findFriendBlackById(Integer id) throws FriendBlackException;
	/**
	 * @Description:  查询分页
	 */
	PageConf findFriendBlackPageList(int start, int limit, Map values) throws FriendBlackException;
	/**
	 * @Description:  查询全部
	 */
	List<FriendBlack> findAllFriendBlack(Map values) throws FriendBlackException;
}
