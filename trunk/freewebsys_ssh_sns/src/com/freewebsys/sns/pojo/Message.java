package com.freewebsys.sns.pojo;

import java.util.Date;

public class Message implements java.io.Serializable {
	
    private Integer id;//id
    
    private Integer fromUserId;//发件人id
    
    private String fromName;//发件人姓名
    
    private String toUserIds;//收件人Id
    
    private String toUserNames;//收件人姓名
    
    private String subject;//标题
    
    private String content;//内容
    

    /** default constructor */
    public Message() {
    }
	
    public Integer getId() {
        return this.id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getFromUserId() {
        return this.fromUserId;
    }
    public void setFromUserId(Integer fromUserId) {
        this.fromUserId = fromUserId;
    }
    public String getFromName() {
        return this.fromName;
    }
    public void setFromName(String fromName) {
        this.fromName = fromName;
    }
    public String getToUserIds() {
        return this.toUserIds;
    }
    public void setToUserIds(String toUserIds) {
        this.toUserIds = toUserIds;
    }
    public String getToUserNames() {
        return this.toUserNames;
    }
    public void setToUserNames(String toUserNames) {
        this.toUserNames = toUserNames;
    }
    public String getSubject() {
        return this.subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getContent() {
        return this.content;
    }
    public void setContent(String content) {
        this.content = content;
    }
}
