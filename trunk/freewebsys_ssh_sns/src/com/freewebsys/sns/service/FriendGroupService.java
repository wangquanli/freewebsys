package com.freewebsys.sns.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.sns.pojo.FriendGroup;
import com.freewebsys.sns.service.FriendGroupException;

public interface FriendGroupService{
	/**
	 * @Description: 保存
	 */
	void saveFriendGroup(FriendGroup friendGroup) throws FriendGroupException;
	/**
	 * @Description: 删除
	 */
	void deleteFriendGroupById(Integer id) throws FriendGroupException;
	/**
	 * @Description:  按ID查询
	 */
	FriendGroup findFriendGroupById(Integer id) throws FriendGroupException;
	/**
	 * @Description:  查询分页
	 */
	PageConf findFriendGroupPageList(int start, int limit, Map values) throws FriendGroupException;
	/**
	 * @Description:  查询全部
	 */
	List<FriendGroup> findAllFriendGroup(Map values) throws FriendGroupException;
}
