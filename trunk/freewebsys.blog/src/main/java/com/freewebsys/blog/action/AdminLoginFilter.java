package com.freewebsys.blog.action;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.freewebsys.blog.common.GlobalConf;
import com.freewebsys.blog.pojo.UserInfo;
import com.freewebsys.blog.service.UserInfoService;

public class AdminLoginFilter implements Filter {

	private static Log log = LogFactory.getLog(AdminLoginFilter.class);

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		String url = httpRequest.getRequestURI();
		// log.debug("url=" + url);
		if (url.indexOf("/admin") == 0 && url.indexOf(".do") > 0
				&& url.indexOf("/admin/userLogin") != 0
				&& url.indexOf("/admin/userLogout") != 0) {

			// 获得session.
			UserInfo userInfo = (UserInfo) httpRequest.getSession()
					.getAttribute(GlobalConf.USER_SESSION);

			// System.out.println(userInfo);
			Cookie cookies[] = httpRequest.getCookies();
			Cookie c = null;
			String loginName = "";
			String rememberMe = "";
			for (int i = 0; cookies != null && i < cookies.length; i++) {
				c = cookies[i];
				if (c.getName().equals("loginName")) {
					loginName = c.getValue();
				}
				if (c.getName().equals("rememberme")) {
					rememberMe = c.getValue();
				}
			}
			if (userInfo == null) {// 用户没有登录跳转到登录页面.
				if (StringUtils.isNotBlank(loginName)
						&& StringUtils.isNotBlank(rememberMe)) {

					ServletContext context = httpRequest.getSession()
							.getServletContext();
					ApplicationContext applicationContext = WebApplicationContextUtils
							.getWebApplicationContext(context);
					// 从spring中获得服务
					UserInfoService userInfoService = (UserInfoService) applicationContext
							.getBean("userInfoService");

					UserInfo userInfoTemp = userInfoService
							.getUserInfoByRememberMe(loginName, rememberMe);
					if (userInfoTemp != null) {
						httpRequest.getSession().setAttribute(
								GlobalConf.USER_SESSION, userInfoTemp);
						// 如果教研成功就更新记住我的key.更安全.
						String remembermeKey = userInfoService
								.updateUserInfoRememberMe(userInfoTemp.getId());
						Cookie cookie = new Cookie("rememberme", remembermeKey);
						cookie.setMaxAge(60 * 60 * 24 * 30);
						httpResponse.addCookie(cookie);
						cookie = new Cookie("loginName",
								userInfoTemp.getLoginName());
						cookie.setMaxAge(60 * 60 * 24 * 30);
						httpResponse.addCookie(cookie);
						chain.doFilter(request, httpResponse);
						return;
					}

				}
				String redirect = "/admin/userLogout.do";
				httpResponse.sendRedirect(redirect);
				log.info("Redirect=" + redirect);
				return;
			} else {
				chain.doFilter(request, httpResponse);
			}
		} else {
			chain.doFilter(httpRequest, httpResponse);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}

	public void destroy() {

	}

}