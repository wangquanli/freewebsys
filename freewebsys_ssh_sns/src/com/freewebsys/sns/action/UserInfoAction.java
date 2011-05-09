package com.freewebsys.sns.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
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
			HttpServletRequest request = (HttpServletRequest) ActionContext
					.getContext().get(ServletActionContext.HTTP_REQUEST);
			request.getSession().setAttribute(UserInfo.USER_SESSION,
					userInfoTemp);
			return SUCCESS;
		} else {
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
		if (userInfoTemp != null) {
			HttpServletRequest request = (HttpServletRequest) ActionContext
					.getContext().get(ServletActionContext.HTTP_REQUEST);
			request.getSession().setAttribute(UserInfo.USER_SESSION,
					userInfoTemp);
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	/**
	 * 分页.查询.排序.
	 */
	public String listUserInfo() throws Exception {
		// 设定分页记录数.
		limit = 10;
		Map map = new HashMap<String, Object>();
		System.out.println("type:" + type);
		// 匹配查询参数.
		if (userInfo != null) {
			map.put("module.id,Integer,=", userInfo.getId());
			map.put("module.createTime,Integer,=", userInfo.getCreateTime());
			map.put("module.email,String,=", userInfo.getEmail());
			map.put("module.name,String,=", userInfo.getName());
			map.put("module.passwd,String,=", userInfo.getPasswd());
			map.put("module.sex,String,=", userInfo.getSex());
			map.put("module.birthday,Integer,=", userInfo.getBirthday());
			map.put("module.bloodType,Integer,=", userInfo.getBloodType());
			map.put("module.currentProvince,Integer,=",
					userInfo.getCurrentProvince());
			map.put("module.currentCity,Integer,=", userInfo.getCurrentCity());
			map.put("module.currentArea,String,=", userInfo.getCurrentArea());
			map.put("module.adminLevel,Integer,=", userInfo.getAdminLevel());
			map.put("module.active,Integer,=", userInfo.getActive());
			map.put("module.score,Integer,=", userInfo.getScore());
		}
		page = userInfoService.findUserInfoPageList(start, limit, map);
		return SUCCESS;
	}

	/**
	 * 增加,修改action.
	 */
	public String addUserInfo() throws Exception {
		if (id != null) {
			userInfo = userInfoService.findUserInfoById(id);
		}
		return INPUT;
	}

	/**
	 * 删除action.
	 */
	public String deleteUserInfo() throws Exception {
		for (int i = 0; ids != null && i < ids.length; i++) {// 删除多个.
			userInfoService.deleteUserInfoById(ids[i]);
		}
		return SUCCESS;
	}

	/**
	 * 保存action.
	 */
	public String saveUserInfo() throws Exception {
		userInfoService.saveUserInfo(userInfo);
		return SUCCESS;
	}

	/**
	 * 查看aciton.
	 */
	public String viewUserInfo() throws Exception {
		userInfo = userInfoService.findUserInfoById(id);
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

}
