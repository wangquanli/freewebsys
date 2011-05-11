package com.freewebsys.sns.pojo;

import java.util.Date;

public class MessageLog implements java.io.Serializable {

	private Integer id;// id

	private Integer messageId;// 消息Id

	private Integer userId;// 用户ID

	private Date createTime;// 创建时间

	private Integer parentId;// 父节点Id,查看信息往来用,类表显示来往包含在一封信里面

	private Integer isRead;// 阅读状态

	private Integer status;// 状态 1 草稿箱 2 发件箱 3 收件箱 -1 垃圾箱 4 通知

	private Message message;// 只用查询先生,不入库操作

	/** default constructor */
	public MessageLog() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMessageId() {
		return this.messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getIsRead() {
		return this.isRead;
	}

	public void setIsRead(Integer isRead) {
		this.isRead = isRead;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}
}
