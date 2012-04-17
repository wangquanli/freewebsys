package com.freewebsys.blog.taglib;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * 时间long 转换成日期格式化类。
 */
@SuppressWarnings("serial")
public class CommonHeadSortTaglib extends TagSupport {

	private String sortName;
	private String action;

	@Override
	public int doStartTag() throws JspException {
		try {

			HttpServletRequest httpRequest = (HttpServletRequest) pageContext
					.getRequest();
			// 获得url地址。
			String webUrl = (String) httpRequest
					.getAttribute("javax.servlet.forward.request_uri");
		} catch (Exception e) {
			// 如果报错返回空字符串。
			e.printStackTrace();
			writeToPage("");
		}
		return super.doEndTag();
	}

	@Override
	public int doEndTag() throws JspException {
		try {
			// 读取模板
			// writeToPage("<!--GridPanelPage结束-->");// 完成一个h3不读取模板
		} catch (Exception e) {
			e.printStackTrace();
		}
		return super.doEndTag();
	}

	private void writeToPage(String strOut) {
		try {
			pageContext.getOut().print(strOut);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

}
