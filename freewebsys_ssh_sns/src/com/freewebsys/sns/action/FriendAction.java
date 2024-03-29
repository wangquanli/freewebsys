package com.freewebsys.sns.action;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.service.FriendService;
import com.freewebsys.sns.pojo.Friend;
import com.freewebsys.sns.pojo.UserInfo;
import com.freewebsys.sns.action.BaseSNSAction;
import com.freewebsys.core.page.PageConf;

public class FriendAction extends BaseSNSAction {

	@Autowired
	private FriendService friendService;
	private Friend friend;
	private UserInfo userInfo;
	private PageConf page;
	private Integer friendId;// 好友Id

	/**
	 * 分页.查询.排序.
	 */
	public String friendSearch() throws Exception {
		// 设定分页记录数.
		limit = 10;
		if (userInfo != null && userInfo.getName() != null
				&& !userInfo.getName().trim().equals("")) {// 也不可以是空格
			// 如果用户名称不为空就查询好友 不是模糊查询，防止恶意查询全部用户
			page = friendService.findFriendPageList(start, limit,
					userInfo.getName());
		}
		return SUCCESS;
	}

	/**
	 * 分页.查询.排序.
	 */
	public String listFriend() throws Exception {
		// 设定分页记录数.
		limit = 10;
		Map map = new HashMap<String, Object>();
		// 匹配查询参数.
		map.put("module.userId,Integer,=", getSessionUserInfo().getId());
		map.put("module.status,Integer,=", 1);
		page = friendService.findMyFriendPageList(start, limit, map);
		return SUCCESS;
	}

	/**
	 * 增加,修改action.
	 */
	public String findFriend() throws Exception {
		// 设定分页记录数.
		limit = 10;
		if (userInfo != null) {
			Map map = new HashMap<String, Object>();
			// 匹配查询参数.
			map.put("module.name,String,=", userInfo.getName());
			map.put("userInfo", getSessionUserInfo());
			page = friendService.findFriendPageList(start, limit, map);
		}
		return SUCCESS;
	}

	/**
	 * 增加,修改action.
	 */
	public String addFriend() throws Exception {
		if (id != null) {
			friend = friendService.findFriendById(id);
		}
		return INPUT;
	}

	/**
	 * 删除action.
	 */
	public String deleteFriend() throws Exception {
		friendService.deleteFriendById(getSessionUserInfo().getId(), id);
		return SUCCESS;
	}

	/**
	 * 保存action.ajax 状态 0 为待审核 1 为成功添加好友
	 */
	public void saveFriend() throws Exception {
		int state = friendService.findIsFriend(getSessionUserInfo().getId(),
				friendId);
		if (state == -1) {
			friend = new Friend();
			// 帮定好友用户
			userInfo = new UserInfo();
			userInfo.setId(friendId);
			friend.setFriend(userInfo);
			// 设置我的Id
			friend.setUserId(getSessionUserInfo().getId());
			// 保存好友信息
			friendService.saveFriend(friend);
			writeToPage("" + 0);
		} else {
			writeToPage("" + state);
		}

	}

	/**
	 * 查看aciton.
	 */
	public String viewFriend() throws Exception {
		friend = friendService.findFriendById(id);
		return SUCCESS;
	}

	/** 以下是get,set方法 */
	public Friend getFriend() {
		return friend;
	}

	public void setFriend(Friend friend) {
		this.friend = friend;
	}

	public PageConf getPage() {
		return page;
	}

	public void setPage(PageConf page) {
		this.page = page;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public Integer getFriendId() {
		return friendId;
	}

	public void setFriendId(Integer friendId) {
		this.friendId = friendId;
	}

}
