package com.freewebsys.sns.action;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.freewebsys.core.action.BaseAction;
import com.freewebsys.sns.pojo.UserInfo;

public class BaseSNSAction extends BaseAction {

	protected String type;

	/**
	 * 从session里面取用户信息数据
	 */
	protected UserInfo getSessionUserInfo() {
		HttpServletRequest request = ServletActionContext.getRequest();
		return (UserInfo) request.getSession().getAttribute(
				UserInfo.USER_SESSION);
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
