package com.freewebsys.blog.action;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.freewebsys.blog.common.GlobalConf;
import com.freewebsys.blog.pojo.UserInfo;

public class AdminLoginFilter implements Filter {

	private static Log log = LogFactory.getLog(AdminLoginFilter.class);

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		String url = httpRequest.getRequestURI();
		// log.debug("url=" + url);
		UserInfo userInfo = (UserInfo) httpRequest.getSession().getAttribute(
				GlobalConf.USER_SESSION);
		System.out.println(userInfo);
		if (url.indexOf("/admin") == 0 && url.indexOf("/admin/userLogin") != 0
				&& url.indexOf("/admin/userLogout") != 0) {

			if (userInfo == null) {// 用户没有登录跳转到登录页面.
				String redirect = "/admin/userLogout.do";
				httpResponse.sendRedirect(redirect);
				log.info("Redirect=" + redirect);
				return;
			} else {
				chain.doFilter(request, httpResponse);
			}
		} else {
			chain.doFilter(request, httpResponse);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}

	public void destroy() {

	}

}