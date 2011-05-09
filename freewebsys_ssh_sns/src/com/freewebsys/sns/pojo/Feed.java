package com.freewebsys.sns.pojo;

import java.util.Date;

public class Feed implements java.io.Serializable {

	private Integer id;//

	private Integer userId;// 用户id

	private String userName;// 用户名

	private String feedType;// 动态类型

	private String titleData;// 标题数据

	private String contentData;// 内容数据

	private Date createTime;// 创建时间

	private Integer feedTemplateId;// 模板Id

	/** default constructor */
	public Feed() {
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

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFeedType() {
		return this.feedType;
	}

	public void setFeedType(String feedType) {
		this.feedType = feedType;
	}

	public String getTitleData() {
		return this.titleData;
	}

	public void setTitleData(String titleData) {
		this.titleData = titleData;
	}

	public String getContentData() {
		return this.contentData;
	}

	public void setContentData(String contentData) {
		this.contentData = contentData;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getFeedTemplateId() {
		return this.feedTemplateId;
	}

	public void setFeedTemplateId(Integer feedTemplateId) {
		this.feedTemplateId = feedTemplateId;
	}
}
