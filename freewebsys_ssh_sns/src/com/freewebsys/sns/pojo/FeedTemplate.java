package com.freewebsys.sns.pojo;

import java.util.Date;

public class FeedTemplate implements java.io.Serializable {

	private Integer id;//

	private String feedType;// 动态类型

	private String title;// 动态标题

	private String content;// 动态内容

	/** default constructor */
	public FeedTemplate() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFeedType() {
		return this.feedType;
	}

	public void setFeedType(String feedType) {
		this.feedType = feedType;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
