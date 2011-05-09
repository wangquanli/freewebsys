package com.freewebsys.sns.pojo;

import java.util.Date;

public class FriendGroup implements java.io.Serializable {

	private Integer id;//

	private Integer userId;// 用户Id

	private String name;// 分组名称

	/** default constructor */
	public FriendGroup() {
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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
