package com.freewebsys.sns.pojo;

import java.util.Date;

public class UserVisitor implements java.io.Serializable {

	private Integer id;//

	private Date createTime;// 创建时间

	private Integer userId;// 用户id

	private Integer visitorId;// 访问Id

	private String visitorName;// 访问用户名

	/** default constructor */
	public UserVisitor() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getVisitorId() {
		return this.visitorId;
	}

	public void setVisitorId(Integer visitorId) {
		this.visitorId = visitorId;
	}

	public String getVisitorName() {
		return this.visitorName;
	}

	public void setVisitorName(String visitorName) {
		this.visitorName = visitorName;
	}
}
