package com.freewebsys.action;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.freewebsys.dao.SystemUserDAO;
import com.freewebsys.jdo.SystemUser;

public class SystemUserAction {

	SystemUserDAO systemUserDAO = new SystemUserDAO();

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
				systemUserDAO.liseSystemUser(start, limit, sort, dir,
						getSystemUser(request)));
		return null;
	}

	/**
	 * 保存.
	 */
	public String save() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(
				systemUserDAO.saveSystemUser(getSystemUser(request)));
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
				systemUserDAO.deleteSystemUser(request.getParameter("ids")));
		return null;
	}

	/**
	 * 修改时候得到数据.
	 */
	public String get() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(
				systemUserDAO.getSystemUser(request.getParameter("id")));
		return null;
	}

	/**
	 * 从request得到POJO类.
	 */
	private SystemUser getSystemUser(HttpServletRequest request) {
		SystemUser systemUser = new SystemUser();
		String id = (null == request.getParameter("id") ? "" : request
				.getParameter("id"));
		if (!"".equals(id))
			systemUser.setId(Long.parseLong(id));
		systemUser.setLoginName((null == request.getParameter("loginName") ? ""
				: request.getParameter("loginName")));
		systemUser.setPasswd((null == request.getParameter("passwd") ? ""
				: request.getParameter("passwd")));
		systemUser.setName((null == request.getParameter("name") ? "" : request
				.getParameter("name")));
		systemUser.setPhone((null == request.getParameter("phone") ? ""
				: request.getParameter("phone")));
		systemUser.setEmail((null == request.getParameter("email") ? ""
				: request.getParameter("email")));
		/*
		 * systemUser.setCreateDate((null == request.getParameter("createDate")
		 * ? "" : request .getParameter("createDate")));
		 */
		systemUser.setIslock((null == request.getParameter("islock") ? ""
				: request.getParameter("islock")));
		systemUser
				.setLoginTimes((null == request.getParameter("loginTimes") ? ""
						: request.getParameter("loginTimes")));
		systemUser.setLastLogin((null == request.getParameter("lastLogin") ? ""
				: request.getParameter("lastLogin")));
		return systemUser;
	}

}
