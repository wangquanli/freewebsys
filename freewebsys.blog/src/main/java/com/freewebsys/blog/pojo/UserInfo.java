package com.freewebsys.blog.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "blog_user_info")
public class UserInfo implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;

	private String loginName;// 登录名

	private String passwd;// 密码

	private String rememberMe;// 记住我密码

	private String displayName;// 显示名称

	private String email;// email

	private String url;// url

	private Long regTime;// 注册时间

	private Integer status;// 状态

	public UserInfo() {
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

	@Column(name = "login_name", unique = false, nullable = true, length = 200)
	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "passwd", unique = false, nullable = true, length = 200)
	public String getPasswd() {
		return this.passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	@Column(name = "remember_me", unique = false, nullable = true, length = 200)
	public String getRememberMe() {
		return rememberMe;
	}

	public void setRememberMe(String rememberMe) {
		this.rememberMe = rememberMe;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Column(name = "display_name", unique = false, nullable = true, length = 200)
	public String getDisplayName() {
		return this.displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	@Column(name = "email", unique = false, nullable = true, length = 200)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "url", unique = false, nullable = true, length = 200)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(name = "reg_time", unique = false, nullable = true)
	public Long getRegTime() {
		return this.regTime;
	}

	public void setRegTime(Long regTime) {
		this.regTime = regTime;
	}

	@Column(name = "status", unique = false, nullable = true, length = 2)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}