package com.freewebsys.sns.pojo;

import java.util.Date;

public class Photo implements java.io.Serializable {

	private Integer id;//

	// private Integer albumId;// 相册Id
	private PhotoAlbum photoAlbum;// 相册

	// private Integer userId;// 用户
	private UserInfo userInfo;// 用户

	private String name;// 照片名称

	private Date createTime;// 创建时间

	private Integer commentCount;// 评论数

	private Integer readCount;// 阅读次数

	private String imagePath;// 图片路径

	private String smallImagePath;// 缩略图路径

	/** default constructor */
	public Photo() {
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

	public Integer getCommentCount() {
		return this.commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public Integer getReadCount() {
		return this.readCount;
	}

	public void setReadCount(Integer readCount) {
		this.readCount = readCount;
	}

	public String getImagePath() {
		return this.imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getSmallImagePath() {
		return this.smallImagePath;
	}

	public void setSmallImagePath(String smallImagePath) {
		this.smallImagePath = smallImagePath;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public PhotoAlbum getPhotoAlbum() {
		return photoAlbum;
	}

	public void setPhotoAlbum(PhotoAlbum photoAlbum) {
		this.photoAlbum = photoAlbum;
	}
}
