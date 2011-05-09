package com.freewebsys.sns.pojo;

import java.util.Date;
import java.util.Set;

/**
 * 评论是 各自有各自的评论,减少查询压力,
 * 
 */

public class Comment implements java.io.Serializable {

	protected Integer id;// Integer

	protected String appType;// 应用类型 如blog

	protected Integer appId;// 应用Id

	protected Integer userId;// 用户Id

	protected String comment;// 评论内容

	protected Date createTime;// 创建时间

	protected Integer parentId;// 父节点

	/** default constructor */
	public Comment() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAppId() {
		return this.appId;
	}

	public void setAppId(Integer appId) {
		this.appId = appId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getAppType() {
		return appType;
	}

	public void setAppType(String appType) {
		this.appType = appType;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
