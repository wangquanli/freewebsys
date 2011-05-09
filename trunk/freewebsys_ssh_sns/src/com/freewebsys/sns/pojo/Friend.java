package com.freewebsys.sns.pojo;

import java.util.Date;

import com.freewebsys.sns.pojo.UserInfo;

public class Friend implements java.io.Serializable {

	private Integer id;//

	private Date createTime;// 创建时间

	private Integer userId;// 用户Id

	private UserInfo friend;// 好友Id

	private String friendUserName;// 好友名称

	private Integer status;// 状态 0 请求中,1 成为好友

	private String note;// 请求信息

	/** default constructor */
	public Friend() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFriendUserName() {
		return this.friendUserName;
	}

	public void setFriendUserName(String friendUserName) {
		this.friendUserName = friendUserName;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public UserInfo getFriend() {
		return friend;
	}

	public void setFriend(UserInfo friend) {
		this.friend = friend;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}
