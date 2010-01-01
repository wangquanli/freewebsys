package com.freewebsys.jdo;

import java.io.Serializable;
import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@SuppressWarnings("serial")
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class User implements Serializable {

	public User() {
	}

	public User(Long id, String loginName, String passwd, String name,
			String phone, String email, Integer islock, Date createDate,
			Integer loginTimes, Date lastLogin) {

		this.id = id;
		this.loginName = loginName;
		this.passwd = passwd;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.islock = islock;
		this.createDate = createDate;
		this.loginTimes = loginTimes;
		this.lastLogin = lastLogin;
	}

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Persistent
	private String loginName;

	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Persistent
	private String passwd;

	public String getPasswd() {
		return this.passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	@Persistent
	private String name;

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Persistent
	private String phone;

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Persistent
	private String email;

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Persistent
	private Integer islock;

	public Integer getIslock() {
		return this.islock;
	}

	public void setIslock(Integer islock) {
		this.islock = islock;
	}

	@Persistent
	private Date createDate;

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Persistent
	private Integer loginTimes;

	public Integer getLoginTimes() {
		return this.loginTimes;
	}

	public void setLoginTimes(Integer loginTimes) {
		this.loginTimes = loginTimes;
	}

	@Persistent
	private Date lastLogin;

	public Date getLastLogin() {
		return this.lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	@Override
	public String toString() {
		return "User [createDate=" + createDate + ", email=" + email + ", id="
				+ id + ", islock=" + islock + ", lastLogin=" + lastLogin
				+ ", loginName=" + loginName + ", loginTimes=" + loginTimes
				+ ", name=" + name + ", passwd=" + passwd + ", phone=" + phone
				+ "]";
	}

}
