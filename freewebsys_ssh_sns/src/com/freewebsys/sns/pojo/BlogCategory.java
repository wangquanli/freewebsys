package com.freewebsys.sns.pojo;

import java.util.Date;

public class BlogCategory implements java.io.Serializable {

	private Integer id;// Integer

	private String name;// String

	private Integer userId;// Integer

	/** default constructor */
	public BlogCategory() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}
