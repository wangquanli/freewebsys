package com.freewebsys.sns.pojo;

import java.util.Date;
import java.util.Set;
import com.freewebsys.sns.pojo.Friend;

public class UserInfo implements java.io.Serializable {

	public static final String USER_SESSION = "userInfoSession";// 用户session常量

	private Integer id;//

	private Date createTime;// 创建时间

	private String email;// 电子邮件

	private String name;// 真实姓名

	private String passwd;// 密码

	private Integer sex;// 性别

	private String birthday;// 生日

	private String bloodType;// 血型

	private Integer currentProvince;// 所在省

	private Integer currentCity;// 所在城市

	private String currentArea;// 所在地区

	private Integer adminLevel;// 管理员级别

	private Integer active;// 是否激活

	private Integer score;// 积分

	private Set<Friend> friends;// 我的好友

	private Integer myFriendState;// 我好友的状态,并不入库

	/** default constructor */
	public UserInfo() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPasswd() {
		return this.passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public Integer getCurrentProvince() {
		return this.currentProvince;
	}

	public void setCurrentProvince(Integer currentProvince) {
		this.currentProvince = currentProvince;
	}

	public Integer getCurrentCity() {
		return this.currentCity;
	}

	public void setCurrentCity(Integer currentCity) {
		this.currentCity = currentCity;
	}

	public String getCurrentArea() {
		return this.currentArea;
	}

	public void setCurrentArea(String currentArea) {
		this.currentArea = currentArea;
	}

	public Integer getAdminLevel() {
		return this.adminLevel;
	}

	public void setAdminLevel(Integer adminLevel) {
		this.adminLevel = adminLevel;
	}

	public Integer getActive() {
		return this.active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Set<Friend> getFriends() {
		return friends;
	}

	public void setFriends(Set<Friend> friends) {
		this.friends = friends;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getMyFriendState() {
		return myFriendState;
	}

	public void setMyFriendState(Integer myFriendState) {
		this.myFriendState = myFriendState;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getBloodType() {
		return bloodType;
	}

	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}

}
