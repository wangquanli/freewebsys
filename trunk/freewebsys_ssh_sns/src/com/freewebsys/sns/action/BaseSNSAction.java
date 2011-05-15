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

	protected String SUCCESS() {
		if (isMobile()) {//判断是否手机类型
			return SUCCESS;
		} else {
			return SUCCESS + "_mobile";
		}
	}

	protected String INPUT() {
		if (isMobile()) {//判断是否手机类型
			return INPUT;
		} else {
			return INPUT + "_mobile";
		}
	}

	protected String PAGE(String name) {
		if (isMobile()) {//判断是否手机类型
			return name;
		} else {
			return name + "_mobile";
		}
	}

	private boolean isMobile() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String requestHeader = request.getHeader("user-agent");
		if (requestHeader.indexOf("Android") > 0) {
			// 判断浏览器类型是否是手机类型
			return true;
		} else {
			return false;
		}
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
