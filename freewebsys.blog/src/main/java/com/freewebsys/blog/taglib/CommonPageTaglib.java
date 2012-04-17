package com.freewebsys.blog.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import com.freewebsys.blog.page.PageConf;

public class CommonPageTaglib extends TagSupport {

	private String action;
	private int start;
	private int limit;
	private int total;
	private String otherValue;

	private static String buttonBegin = "<a class='prev-page' href='";
	private static String buttonEnd = "</a>";

	// 默认样式模板

	@Override
	public int doStartTag() throws JspException {

		// 设置通用宽度
		// getJspContext().setAttribute(item, s);
		// 输出标签体
		try {
			// 读取模板
			// 初始化参数.每次独立计算.否则分页有问题.
			String ctx = action;
			if (action.indexOf("?") >= 0) {// 如果存在?号用&
				ctx += "&" + findOtherValue();
			} else {// 否则用?
				ctx += "?" + findOtherValue();
			}
			ctx += "&";
			StringBuffer stringBuffer = new StringBuffer();
			stringBuffer.append("<div class='tablenav-pages'>");

			// add 1 2 3 4 like
			stringBuffer.append(genCenterButtons(start, limit, total, ctx));

			// 写到页面.
			stringBuffer.append("</div>");
			writeToPage(stringBuffer.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return super.doEndTag();
	}

	/**
	 * 发布到线上多个跳转按钮方法,如1，2，3，4，5这样的按钮跳转最大7页跳转
	 */
	/**
	 * 生成多个跳转按钮方法,如1，2，3，4，5这样的按钮跳转最大7页跳转
	 */
	private String genCenterButtons(int start, int limit, int total, String ctx) {

		// 初始化参数.每次独立计算.否则分页有问题.
		PageConf pageConf = new PageConf(start, limit, total);
		PageConf pageConfTemp1 = new PageConf(start, limit, total);
		PageConf pageConfTemp2 = new PageConf(start, limit, total);

		// 结束页
		PageConf pageConfTempLast = new PageConf(start, limit, total);
		//
		pageConfTempLast.getLast();
		// 字符串拼写.
		StringBuilder strOut = new StringBuilder();
		// 设置开始为当前页往前3页,最小1
		int begin = Math.max(1, (pageConf.getCurrentPage() + 1) - 3);
		// 设置结束为当前页往后3页,最大到总页数
		int end = Math.min((pageConf.getCurrentPage() + 1) + 3,
				pageConf.getTotalPage());
		int abs = 5 - Math.abs(pageConfTempLast.getCurrentPage()
				- pageConf.getCurrentPage());
		if (abs > 0) {
			begin = pageConf.getCurrentPage() - abs;
			begin = Math.min(begin, (pageConf.getCurrentPage() + 1) - 3);
			begin = Math.max(1, begin);
		}
		// 计算当前页和首页的距离
		abs = 7 - pageConf.getCurrentPage();
		if (abs > 0) {
			end = pageConf.getCurrentPage() + abs;
			end = Math.max((pageConf.getCurrentPage() + 1) + 3, end);
			end = Math.min(end, pageConf.getTotalPage());
		}

		strOut.append("<span class='displaying-num'> \u5171 " + pageConf.getTotal()
				+ " \u6761\u8BB0\u5F55,\u5171  " + pageConf.getTotalPage()
				+ " \u9875</span>");

		if (pageConfTemp1.hasPrevious()) {
			pageConfTemp1.getPrevious();
			strOut.append(buttonBegin + ctx + "start="
					+ pageConfTemp1.getStart() + "'\">");
			strOut.append("\u524d\u4e00\u9875</a>");// 上一页
		} else {
			strOut.append("<a class='prev-page disabled'>\u524d\u4e00\u9875</a>");
		}

		if (pageConf.getTotalPage() > 7) {// 如果大于7显示首页末页
			// 显示前一页

			if (pageConf.getCurrentPage() > 3) {
				// 显示第 1
				strOut.append(buttonBegin + ctx + "start=" + (0) + "'\">");
				strOut.append(1);
				strOut.append("</a>");
				if (pageConf.getCurrentPage() > 4) {
					// 显示第 2 页
					strOut.append(buttonBegin + ctx + "start="
							+ (0 + pageConf.getLimit()) + "'\">");
					strOut.append(2);
					strOut.append("</a>");
				}
				strOut.append("<span>\u2026</span>");
			}
		}
		// if(pageConf.getCurrentPage())
		// 循环显示数字
		for (int i = begin; i <= end; i++) {
			// 循环多个table的button
			int startTemp = (i - 1) * pageConf.getLimit();
			if (i == (pageConf.getCurrentPage() + 1)) {
				strOut.append("<span class='paging-input'><input onkeyup=\"this.value=this.value.replace(/[^0-9]/g,'')\" class='current-page' type='text' name='page_num' value='");
				strOut.append(i);// 当前页显示禁用
				strOut.append("' size='1' onchange=\"window.location.href='");
				strOut.append(ctx + "start=");
				strOut.append("'+(this.value-1)*" + pageConf.getLimit()
						+ ";\"></span>");

			} else {
				strOut.append(buttonBegin + ctx + "start=" + startTemp + "'\">");
				strOut.append(i);
				strOut.append("</a>");
			}
		}
		// 末页显示,显示最后一页和倒数第二页
		if (pageConf.getTotalPage() > 7) {// 如果大于7显示首页末页

			if (pageConf.getCurrentPage() < (pageConfTempLast.getCurrentPage() - 3)) {
				// 如果当前页是倒数第4页就不显示
				strOut.append("…");
				// System.out.println(pageConf.getCurrentPage() + "/"
				// + pageConfTempLast.getCurrentPage());
				if (pageConf.getCurrentPage() < (pageConfTempLast
						.getCurrentPage() - 4)) {
					// 如果当前页是倒数第4页就不显示倒数第2页
					strOut.append(buttonBegin
							+ ctx
							+ "start="
							+ (pageConfTempLast.getStart() - pageConf
									.getLimit()) + "'\">");
					strOut.append(pageConfTempLast.getCurrentPage());
					strOut.append("</a>");
				}
				strOut.append(buttonBegin + ctx + "start="
						+ pageConfTempLast.getStart() + "'\">");
				strOut.append(pageConfTempLast.getCurrentPage() + 1);
				strOut.append("</a>");
			}

		}

		// 显示下一页
		if (pageConfTemp2.hasNext()) {
			pageConfTemp2.getNext();
			strOut.append(buttonBegin + ctx + "start="
					+ pageConfTemp2.getStart() + "'\">");
			strOut.append("\u4e0b\u4e00\u9875</a>");// 下一页
		} else {
			strOut.append("<a class='prev-page disabled'>\u4e0b\u4e00\u9875</a>");
		}
		return strOut.toString();
	}

	/**
	 * 添加其他参数.
	 */
	private String findOtherValue() {
		String tempValue = "";
		if (otherValue != null && !"".equals(otherValue)) {
			// 将数据按照','进行分开.
			String[] values = otherValue.split(",");
			for (int i = 0; i < values.length; i++) {
				// 从request里面取得数据value.
				if (values[i] != null && !values[i].equals("")) {
					String temp = (null == pageContext.getRequest()
							.getParameter(values[i]) ? "" : pageContext
							.getRequest().getParameter(values[i]));
					if (i == 0) {// 如果是第一个.直接等于.否则就添加&
						tempValue = values[i] + "=" + temp;
					} else {
						tempValue += "&" + values[i] + "=" + temp;
					}
				}
			}
		}
		return tempValue;
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

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public String getOtherValue() {
		return otherValue;
	}

	public void setOtherValue(String otherValue) {
		this.otherValue = otherValue;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
