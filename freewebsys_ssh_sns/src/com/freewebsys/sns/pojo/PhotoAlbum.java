package com.freewebsys.sns.pojo;

import java.util.Date;

public class PhotoAlbum implements java.io.Serializable {

	private Integer id;//

	private Integer userId;// 用户

	private String name;// 相册名称

	private Date createTime;// 创建时间

	private Integer coverImageId;// 封面图片

	private String coverImagePath;// 封面图片路径

	private Integer photoCount;// 照片数量

	private Integer share;// 分享

	private Integer privacy;// 权限

	/** default constructor */
	public PhotoAlbum() {
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

	public Integer getCoverImageId() {
		return this.coverImageId;
	}

	public void setCoverImageId(Integer coverImageId) {
		this.coverImageId = coverImageId;
	}

	public String getCoverImagePath() {
		return this.coverImagePath;
	}

	public void setCoverImagePath(String coverImagePath) {
		this.coverImagePath = coverImagePath;
	}

	public Integer getPhotoCount() {
		return this.photoCount;
	}

	public void setPhotoCount(Integer photoCount) {
		this.photoCount = photoCount;
	}

	public Integer getShare() {
		return this.share;
	}

	public void setShare(Integer share) {
		this.share = share;
	}

	public Integer getPrivacy() {
		return this.privacy;
	}

	public void setPrivacy(Integer privacy) {
		this.privacy = privacy;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
