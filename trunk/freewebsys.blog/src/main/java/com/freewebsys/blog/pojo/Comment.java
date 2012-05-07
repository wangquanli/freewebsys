package com.freewebsys.blog.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "blog_comment")
public class Comment implements java.io.Serializable {

	private Long id;

	private Long postId;// 文章Id

	private String authorEmail;// 作者邮箱

	private String authorUrl;// 作者url

	private String authorIp;// 作者ip

	private String content;// 内容

	private Integer status;// 状态

	private Long createDate;// 创建时间

	private Long parentId;// 父节点

	private Long userId;// 用户Id

	public Comment() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "post_id", unique = false, nullable = false)
	public Long getPostId() {
		return this.postId;
	}

	public void setPostId(Long postId) {
		this.postId = postId;
	}

	@Column(name = "author_email", unique = false, nullable = true, length = 200)
	public String getAuthorEmail() {
		return this.authorEmail;
	}

	public void setAuthorEmail(String authorEmail) {
		this.authorEmail = authorEmail;
	}

	@Column(name = "author_url", unique = false, nullable = true, length = 200)
	public String getAuthorUrl() {
		return this.authorUrl;
	}

	public void setAuthorUrl(String authorUrl) {
		this.authorUrl = authorUrl;
	}

	@Column(name = "author_ip", unique = false, nullable = true, length = 50)
	public String getAuthorIp() {
		return this.authorIp;
	}

	public void setAuthorIp(String authorIp) {
		this.authorIp = authorIp;
	}

	@Column(name = "content", unique = false, nullable = true, length = 2000)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "status", unique = false, nullable = true)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "create_date", unique = false, nullable = true)
	public Long getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Long createDate) {
		this.createDate = createDate;
	}

	@Column(name = "parent_id", unique = false, nullable = true)
	public Long getParentId() {
		return this.parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	@Column(name = "user_id", unique = false, nullable = true)
	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

}