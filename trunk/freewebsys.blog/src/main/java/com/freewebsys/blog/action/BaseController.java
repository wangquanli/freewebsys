package com.freewebsys.blog.action;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class BaseController {

	protected Log log = LogFactory.getLog(this.getClass());

	/**
	 * 直接将 ajax 输入到页面
	 */
	protected void writeToPage(HttpServletResponse response, String str) {
		try {
			if (response != null) {// 在junit测试的时候会不显示.
				response.setHeader("Pragma", "No-cache");
				response.setHeader("Cache-Control", "no-cache");
				response.setDateHeader("Expires", 0);
				response.setContentType("text/plain;charset=UTF-8");
				PrintWriter writer = null;
				writer = response.getWriter();
				writer.write(str);
			}
		} catch (IOException e) {
		} finally {
		}

	}

}
