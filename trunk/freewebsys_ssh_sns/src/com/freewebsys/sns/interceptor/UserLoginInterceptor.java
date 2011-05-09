package com.freewebsys.sns.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.freewebsys.sns.action.UserInfoAction;
import com.freewebsys.sns.pojo.UserInfo;

/**
 * 用户登陆的拦截器.
 */
public class UserLoginInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {

		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) ctx
				.get(ServletActionContext.HTTP_RESPONSE);

		// System.out.println("url重写后action:" + request.getRequestURI());

		Object action = actionInvocation.getAction();
		if (action instanceof UserInfoAction) {// 判断如果是登录的action不进行拦截
			return actionInvocation.invoke();
		}

		Object userSession = request.getSession().getAttribute(
				UserInfo.USER_SESSION);
		// get session use session name .
		if (userSession != null) {
			// 如果用户session已经存在.则是登陆了.
			return actionInvocation.invoke();
		} else {
			// 如果没有用户session.则跳到登陆页面.
			response.sendRedirect(request.getContextPath()
					+ "/userLogout.action");
			return null;
		}

	}

}
