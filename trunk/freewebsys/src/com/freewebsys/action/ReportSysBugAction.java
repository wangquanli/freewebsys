package com.freewebsys.action;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.freewebsys.dao.ReportSysBugDAO;
import com.freewebsys.jdo.ReportSysBug;

public class ReportSysBugAction {

	ReportSysBugDAO reportSysBugDAO = new ReportSysBugDAO();

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
				reportSysBugDAO.liseReportSysBug(start, limit, sort, dir,
						getReportSysBug(request)));
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
				reportSysBugDAO.saveReportSysBug(getReportSysBug(request)));
		return null;
	}

	/**
	 * 删除.
	 */
	public String delete() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter()
				.write(
						reportSysBugDAO.deleteReportSysBug(request
								.getParameter("ids")));
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
				reportSysBugDAO.getReportSysBug(request.getParameter("id")));
		return null;
	}

	/**
	 * 从request得到POJO类.
	 */
	private ReportSysBug getReportSysBug(HttpServletRequest request) {
		ReportSysBug reportSysBug = new ReportSysBug();
		String id = (null == request.getParameter("id") ? "" : request
				.getParameter("id"));
		if (!"".equals(id))
			reportSysBug.setId(Long.parseLong(id));

		reportSysBug.setContactName((null == request
				.getParameter("contactName") ? "" : request
				.getParameter("contactName")));
		reportSysBug.setContactEmail((null == request
				.getParameter("contactEmail") ? "" : request
				.getParameter("contactEmail")));
		// reportSysBug.setCreateDate((null ==
		// request.getParameter("createDate") ? "" : request
		// .getParameter("createDate")));//
		reportSysBug.setTittle((null == request.getParameter("tittle") ? ""
				: request.getParameter("tittle")));
		reportSysBug.setBugDesc((null == request.getParameter("bugDesc") ? ""
				: request.getParameter("bugDesc")));
		reportSysBug.setSuggest((null == request.getParameter("suggest") ? ""
				: request.getParameter("suggest")));
		return reportSysBug;
	}

}
