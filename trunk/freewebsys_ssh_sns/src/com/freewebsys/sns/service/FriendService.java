package com.freewebsys.sns.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.sns.pojo.Friend;
import com.freewebsys.sns.service.FriendException;

public interface FriendService {
	/**
	 * @Description: 保存
	 */
	void saveFriend(Friend friend) throws FriendException;

	/**
	 * @Description: 删除
	 */
	void deleteFriendById(Integer userId, Integer friendId) throws FriendException;

	/**
	 * @Description: 按ID查询
	 */
	Friend findFriendById(Integer id) throws FriendException;

	/**
	 * @Description: 查询分页
	 */
	PageConf findFriendPageList(int start, int limit, Map values)
			throws FriendException;

	/**
	 * @Description: 我的好友,查询分页
	 */
	PageConf findMyFriendPageList(int start, int limit, Map values)
			throws FriendException;

	/**
	 * @Description: 查询全部
	 */
	List<Friend> findAllFriend(Map values) throws FriendException;
	
	/**
	 * @Description: 是否是好友
	 */
	int findIsFriend(Integer id, Integer id2);
}
