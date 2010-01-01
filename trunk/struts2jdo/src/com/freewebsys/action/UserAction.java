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
		// TODO Auto-generated method stub
		System.out.println("heree");
		String strStart = (null == request.getParameter("start") ? "0"
				: request.getParameter("start"));
		String strLimit = (null == request.getParameter("limit") ? "0"
				: request.getParameter("limit"));
		String sort = (null == request.getParameter("sort") ? "" : request
				.getParameter("sort"));
		String dir = (null == request.getParameter("dir") ? "" : request
				.getParameter("dir"));
		System.out.println(strStart);
		System.out.println(strLimit);
		int start = Integer.parseInt(strStart);
		int limit = Integer.parseInt(strLimit);

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(userDAO.liseUser(start, limit));
		return null;
	}

	public String save() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		System.out.println("saveUser:#################["
				+ request.getParameter("id"));
		System.out.println("getUser:#################["
				+ request.getParameter("name"));
		User user = new User();
		if (!"".equals(request.getParameter("id")))
			user.setId(Long.parseLong(request.getParameter("id")));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		userDAO.saveUser(user);
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
		response.getWriter().write(
				"{success:\"true\",data:"
						+ userDAO.getUser(request.getParameter("id")) + "}");
		return null;
	}

}
