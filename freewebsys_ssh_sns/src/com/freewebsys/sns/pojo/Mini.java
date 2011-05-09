package com.freewebsys.sns.pojo;

import java.util.Date;

import com.freewebsys.sns.pojo.UserInfo;

public class Mini implements java.io.Serializable {

	private Integer id;//

	private UserInfo userInfo;// 用户

	private String content;// 内容

	private Date createTime;// 创建时间

	private Integer commentCount;// 评论次数

	private Integer feedId;// 动态Id

	/** default constructor */
	public Mini() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getCommentCount() {
		return this.commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public Integer getFeedId() {
		return this.feedId;
	}

	public void setFeedId(Integer feedId) {
		this.feedId = feedId;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
}
