package com.freewebsys.action;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.freewebsys.dao.UserDAO;
import com.freewebsys.jdo.User;

public class UserAction {

	UserDAO userDAO = new UserDAO();

	/**
	 * 分页.查询.排序.
	 */
	public String list() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String strStart = (null == request.getParameter("start") ? "0"
				: request.getParameter("start"));
		String strLimit = (null == request.getParameter("limit") ? "0"
				: request.getParameter("limit"));
		String sort = (null == request.getParameter("sort") ? "" : request
				.getParameter("sort"));
		String dir = (null == request.getParameter("dir") ? "" : request
				.getParameter("dir"));
		int start = Integer.parseInt(strStart);
		int limit = Integer.parseInt(strLimit);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(
				userDAO.liseUser(start, limit, sort, dir, getUser(request)));
		return null;
	}

	/**
	 * 保存.
	 */
	public String save() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(userDAO.saveUser(getUser(request)));
		return null;
	}

	/**
	 * 删除.
	 */
	public String delete() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(
				userDAO.deleteUser(request.getParameter("ids")));
		return null;
	}

	/**
	 * 修改时候得到数据.
	 */
	public String get() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(userDAO.getUser(request.getParameter("id")));
		return null;
	}

	/**
	 * 从request得到POJO类.
	 */
	private User getUser(HttpServletRequest request) {
		User user = new User();
		String id = (null == request.getParameter("id") ? "" : request
				.getParameter("id"));
		if (!"".equals(id))
			user.setId(Long.parseLong(id));
		user.setLoginName((null == request.getParameter("loginName") ? ""
				: request.getParameter("loginName")));
		user.setEmail((null == request.getParameter("email") ? "" : request
				.getParameter("email")));
		System.out.println(user);
		return user;
	}

}
