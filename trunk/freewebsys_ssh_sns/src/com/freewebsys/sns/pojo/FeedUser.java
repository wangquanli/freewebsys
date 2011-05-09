package com.freewebsys.sns.pojo;

import java.util.Date;

public class FeedUser implements java.io.Serializable {

	private Integer id;//

	private Integer userId;// 用户id

	// private Integer feedId;//动态id
	private Feed feed;

	private String feedType;// 动态分类 数据冗余查询速度快

	/** default constructor */
	public FeedUser() {
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

	public Feed getFeed() {
		return feed;
	}

	public void setFeed(Feed feed) {
		this.feed = feed;
	}

	public String getFeedType() {
		return feedType;
	}

	public void setFeedType(String feedType) {
		this.feedType = feedType;
	}
}
