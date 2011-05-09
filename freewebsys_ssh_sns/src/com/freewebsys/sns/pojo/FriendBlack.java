package com.freewebsys.sns.pojo;

import java.util.Date;

public class FriendBlack implements java.io.Serializable {

	private Integer id;//

	private Integer userId;// 用户Id

	private Integer friendId;// 好友Id

	/** default constructor */
	public FriendBlack() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getFriendId() {
		return this.friendId;
	}

	public void setFriendId(Integer friendId) {
		this.friendId = friendId;
	}
}
