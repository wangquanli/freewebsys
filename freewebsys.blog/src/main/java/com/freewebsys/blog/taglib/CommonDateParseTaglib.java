package com.freewebsys.blog.taglib;

import java.util.Date;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * 时间long 转换成日期格式化类。
 */
@SuppressWarnings("serial")
public class CommonDateParseTaglib extends TagSupport {

	private String date;
	private String format;

	@Override
	public int doStartTag() throws JspException {
		try {
			if (format == null || format.equals("")) {
				format = "yyyy-MM-dd HH:mm";
			}
			// 创建一个临时的时间类
			Date dateTemp = new Date();
			// 设置时间
			dateTemp.setTime(Long.parseLong(date));
			// 格式化时间。
			String strTemp = new java.text.SimpleDateFormat(format)
					.format(dateTemp);
			writeToPage(strTemp);

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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

}
