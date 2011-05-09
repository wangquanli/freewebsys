package com.freewebsys.sns.pojo;

import java.util.Date;

public class Blog implements java.io.Serializable {

	private Integer id;//

	private UserInfo userInfo;// 用户

	private String title;// 标题

	private BlogCategory blogCategory;// 日志分类

	private String content;// 内容

	private Integer readCount;// 阅读数量

	private Integer commentCount;// 评论数量

	private Date createTime;// 创建时间

	private Date modifyTime;// 修改时间

	private Integer status;// 状态

	private String privatePermission;// 权限

	private String commentPermission;// 评论权限

	private String attach;// 附件

	/** default constructor */
	public Blog() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getReadCount() {
		return this.readCount;
	}

	public void setReadCount(Integer readCount) {
		this.readCount = readCount;
	}

	public Integer getCommentCount() {
		return this.commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getPrivatePermission() {
		return this.privatePermission;
	}

	public void setPrivatePermission(String privatePermission) {
		this.privatePermission = privatePermission;
	}

	public String getCommentPermission() {
		return this.commentPermission;
	}

	public void setCommentPermission(String commentPermission) {
		this.commentPermission = commentPermission;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public BlogCategory getBlogCategory() {
		return blogCategory;
	}

	public void setBlogCategory(BlogCategory blogCategory) {
		this.blogCategory = blogCategory;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAttach() {
		return attach;
	}

	public void setAttach(String attach) {
		this.attach = attach;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
}
