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
import com.opensymphony.xwork2.ActionContext;

public class UserMainAction extends BaseSNSAction {

	@Autowired
	private UserInfoService userInfoService;
	private UserInfo userInfo;
	private PageConf page;
	
	/**
	 * 登录成功跳转的页面
	 */
	public String viewUserMain() throws Exception {
		return SUCCESS;
	}

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

}
