package com.freewebsys.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.freewebsys.dao.UserDAO;
import com.freewebsys.jdo.User;

public class UserAction {

	UserDAO userDAO = new UserDAO();

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
		System.out.println(strStart + "\t" + strLimit + "\t" + sort + "\t"
				+ dir + "");
		int start = Integer.parseInt(strStart);
		int limit = Integer.parseInt(strLimit);

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(
				userDAO.liseUser(start, limit, sort, dir, getUser(request)));
		return null;
	}

	public String save() {
		HttpServletRequest request = ServletActionContext.getRequest();
		userDAO.saveUser(getUser(request));
		return null;
	}

	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		System.out.println("delete:#################["
				+ request.getParameter("ids"));
		userDAO.deleteUser(request.getParameter("ids"));
		return null;
	}

	public String get() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		System.out.println("delete:#################["
				+ request.getParameter("id"));
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(userDAO.getUser(request.getParameter("id")));
		return null;
	}

	private User getUser(HttpServletRequest request) {
		User user = new User();
		String id = (null == request.getParameter("id") ? "" : request
				.getParameter("id"));
		if (!"".equals(id))
			user.setId(Long.parseLong(id));
		user.setName((null == request.getParameter("name") ? "" : request
				.getParameter("name")));
		user.setEmail((null == request.getParameter("email") ? "" : request
				.getParameter("email")));
		System.out.println(user);
		return user;
	}

}
