package com.freewebsys.sns.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.freewebsys.sns.service.BlogService;
import com.freewebsys.sns.service.PhotoService;
import com.freewebsys.sns.service.UserInfoService;
import com.freewebsys.sns.pojo.UserInfo;
import com.freewebsys.sns.action.BaseSNSAction;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.servlet.ImageCodeServlet;
import com.opensymphony.xwork2.ActionContext;

public class UserInfoAction extends BaseSNSAction {

	@Autowired
	private UserInfoService userInfoService;
	private UserInfo userInfo;
	private PageConf page;

	private String email;// 用户email
	private String passwd;// 密码

	private String ac;// 激活码

	/**
	 * 跳转用户登录页
	 */
	public String userLogin() throws Exception {
		return SUCCESS;
	}

	/**
	 * 用户退出页
	 */
	public String userLogout() throws Exception {
		// 用户退出session失效
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		request.getSession().invalidate();
		return SUCCESS;
	}

	/**
	 * 用户登录
	 */
	public String saveUserLogin() throws Exception {
		UserInfo userInfoTemp = userInfoService.findUserInfoByEmailPasswd(
				email, passwd);
		if (userInfoTemp != null) {
			if (userInfoTemp.getActive().intValue() == 0) {//用户未激活
				addActionError("用户未激活，请查收邮件并激活帐号。");
				return INPUT;
			}
			HttpServletRequest request = (HttpServletRequest) ActionContext
					.getContext().get(ServletActionContext.HTTP_REQUEST);
			request.getSession().setAttribute(UserInfo.USER_SESSION,
					userInfoTemp);
			return SUCCESS;
		} else {
			addActionError("用户名密码错误");
			return INPUT;
		}
	}

	/**
	 * 跳转注册页面
	 */
	public String userRegister() throws Exception {
		return SUCCESS;
	}

	/**
	 * 检查用户email
	 */
	public void checkUserEmail() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		UserInfo userInfoTemp = userInfoService
				.findUserInfoByEmail((String) request
						.getParameter("userInfo_email_id"));
		if (userInfoTemp == null) {
			writeToPage("true");
		} else {
			writeToPage("false");
		}
	}

	/**
	 * 检测验证码
	 */
	public void chekcUserImgCode() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String imageCodeStr = (String) request.getSession().getAttribute(
				ImageCodeServlet.IMAGE_CODE);
		String userInfo_verifyImg_id = (String) request
				.getParameter("userInfo_verifyImg_id");
		if (userInfo_verifyImg_id == null) {// 这个兼容登录的校验
			userInfo_verifyImg_id = (String) request
					.getParameter("login_verifyImg_id");
		}
		System.out.println(userInfo_verifyImg_id);
		if (imageCodeStr.equals(userInfo_verifyImg_id)) {
			writeToPage("true");
		} else {
			writeToPage("false");
		}
	}

	/**
	 * 保存注册信息
	 */
	public String saveUserRegister() throws Exception {
		UserInfo userInfoTemp = userInfoService.saveUserRegister(userInfo);
		email = userInfoTemp.getEmail();
		return SUCCESS;
	}

	/**
	 * 激活用户
	 */
	public String activeUser() throws Exception {
		UserInfo userInfoTemp = userInfoService.saveActiveUser(ac);
		if (userInfoTemp == null) {
			addActionError("连接地址错误。");
		} else {
			addActionMessage("帐号激活成功！");
			email = userInfoTemp.getEmail();// 设置邮件
		}
		return SUCCESS;
	}

	/**
	 * 查看aciton.
	 */
	public String viewUserInfo() throws Exception {
		userInfo = userInfoService.findUserInfoById(id);
		return SUCCESS;
	}

	/**
	 * 首页查看日志信息
	 */
	@Autowired
	private BlogService blogService;

	public String listIndexBlog() throws Exception {
		// 设定分页记录数.
		limit = 10;
		type = "all";
		page = blogService.findBlogPageList(start, limit, getSessionUserInfo(),
				type);
		return SUCCESS;
	}

	public String viewIndexBlog() throws Exception {
		// 设定分页记录数.
		limit = 1;
		type = "all";
		if (id != null) {
			page = blogService.findBlogPageList(start, limit,
					getSessionUserInfo(), type, id);
		} else {
			page = blogService.findBlogPageList(start, limit,
					getSessionUserInfo(), type);
		}
		return SUCCESS;
	}

	/**
	 * 首页查看相册信息
	 */
	@Autowired
	private PhotoService photoService;

	public String listIndexPhoto() throws Exception {
		// 设定分页记录数.
		limit = 12;
		type = "all";
		page = photoService.findPhotoPageList(start, limit,
				getSessionUserInfo(), type);
		return SUCCESS;
	}

	public String viewIndexPhoto() throws Exception {
		// 设定分页记录数.
		limit = 1;
		type = "all";
		if (id != null) {
			page = photoService.findPhotoPageList(start, limit,
					getSessionUserInfo(), type, id);
		} else {
			page = photoService.findPhotoPageList(start, limit,
					getSessionUserInfo(), type);
		}
		return SUCCESS;
	}

	/** 以下是get,set方法 */
	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public PageConf getPage() {
		return page;
	}

	public void setPage(PageConf page) {
		this.page = page;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAc() {
		return ac;
	}

	public void setAc(String ac) {
		this.ac = ac;
	}

}
