package com.freewebsys.blog.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "blog_post")
public class Post implements java.io.Serializable {

	private Long id;

	private Long authorId;// 作者Id

	private UserInfo userInfo;// 作者只做查询显示.

	private Long createDate;// 创建时间

	private Long modifiedDate;// 修改时间

	private String url;// url

	private String title;// 标题

	private String content;// 内容

	private Integer status;// 状态

	private Integer commentStatus;// 评论状态

	private Long postTypeId;// 分类

	private PostType postType;// 分类只做查询显示.

	private String postMimeType;// 小类型

	private Long commentCount;// 评论数量

	public Post() {
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

	@Column(name = "author_id", unique = false, nullable = true)
	public Long getAuthorId() {
		return this.authorId;
	}

	public void setAuthorId(Long authorId) {
		this.authorId = authorId;
	}

	@ManyToOne(fetch = FetchType.LAZY, targetEntity = UserInfo.class)
	@JoinColumn(name = "author_id", unique = false, nullable = true, updatable = false, insertable = false)
	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	@Column(name = "create_date", unique = false, nullable = true)
	public Long getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Long createDate) {
		this.createDate = createDate;
	}

	@Column(name = "modified_date", unique = false, nullable = true)
	public Long getModifiedDate() {
		return this.modifiedDate;
	}

	public void setModifiedDate(Long modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	@Column(name = "url", unique = false, nullable = true, length = 100)
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(name = "title", unique = false, nullable = true, length = 250)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "content", unique = false, nullable = true, length = 4000)
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

	@Column(name = "comment_status", unique = false, nullable = true)
	public Integer getCommentStatus() {
		return this.commentStatus;
	}

	public void setCommentStatus(Integer commentStatus) {
		this.commentStatus = commentStatus;
	}

	@Column(name = "post_type_id", unique = false, nullable = true)
	public Long getPostTypeId() {
		return this.postTypeId;
	}

	public void setPostTypeId(Long postTypeId) {
		this.postTypeId = postTypeId;
	}

	@ManyToOne(fetch = FetchType.LAZY, targetEntity = PostType.class)
	@JoinColumn(name = "post_type_id", unique = false, nullable = true, updatable = false, insertable = false)
	public PostType getPostType() {
		return postType;
	}

	public void setPostType(PostType postType) {
		this.postType = postType;
	}

	@Column(name = "post_mime_type", unique = false, nullable = true, length = 200)
	public String getPostMimeType() {
		return this.postMimeType;
	}

	public void setPostMimeType(String postMimeType) {
		this.postMimeType = postMimeType;
	}

	@Column(name = "comment_count", unique = false, nullable = true)
	public Long getCommentCount() {
		return this.commentCount;
	}

	public void setCommentCount(Long commentCount) {
		this.commentCount = commentCount;
	}

}