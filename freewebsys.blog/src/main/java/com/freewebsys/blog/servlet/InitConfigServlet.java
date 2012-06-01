package com.freewebsys.blog.servlet;

import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.freewebsys.blog.dao.BaseDao;
import com.freewebsys.blog.pojo.PostType;
import com.freewebsys.blog.service.PostTypeService;

/**
 * Servlet implementation class InitConfigServlet
 */
public class InitConfigServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public InitConfigServlet() {
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("inti");
		ApplicationContext applicationContext = WebApplicationContextUtils
				.getWebApplicationContext(config.getServletContext());
		PostTypeService postTypeService = (PostTypeService) applicationContext
				.getBean("postTypeService");
		try {
			PostType postType = postTypeService.findHomePostType();
			if (postType == null) {
				postType = new PostType();
				postType.setName("首页");
				postType.setIsHome(1);
				// 设置排序号
				postType.setOrderId(new Date().getTime());
				// 保存
				postTypeService.savePostType(postType);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
