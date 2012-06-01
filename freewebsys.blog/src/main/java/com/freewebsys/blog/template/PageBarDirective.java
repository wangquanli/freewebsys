package com.freewebsys.blog.template;

import java.util.List;

import com.freewebsys.blog.page.PageConf;

import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModelException;

public class PageBarDirective implements TemplateMethodModel {

	public PageBarDirective() {
	}

	public Object exec(List args) throws TemplateModelException {
		String str = "";
		if (null != args && args.size() == 2) {
			// 第1位是格式.

		}
		return str;
	}

	private static String buttonBegin = "<a class=\"pageNum\" href=\"";

	/**
	 * 发布到线上多个跳转按钮方法,如1，2，3，4，5这样的按钮跳转最大7页跳转
	 */
	/**
	 * 生成多个跳转按钮方法,如1，2，3，4，5这样的按钮跳转最大7页跳转
	 */
	public static String genCenterButtons(int start, int limit, int total,
			String baseUrl) {

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

		if (pageConfTemp1.hasPrevious()) {
			pageConfTemp1.getPrevious();
			strOut.append(buttonBegin + "start=" + pageConfTemp1.getStart()
					+ "'\">");
			strOut.append("\u524d\u4e00\u9875</a>");// 上一页
		} else {
			strOut.append("<a class='prev-page disabled'>\u524d\u4e00\u9875</a>");
		}

		if (pageConf.getTotalPage() > 7) {// 如果大于7显示首页末页
			// 显示前一页

			if (pageConf.getCurrentPage() > 3) {
				// 显示第 1
				strOut.append(buttonBegin + baseUrl + "index.html'\">");
				strOut.append(1);
				strOut.append("</a>");
				if (pageConf.getCurrentPage() > 4) {
					// 显示第 2 页
					strOut.append(buttonBegin + baseUrl + "index"
							+ pageConf.getCurrentPage() + ".html" + "\">");
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
				strOut.append("start=");
				strOut.append("'+(this.value-1)*" + pageConf.getLimit()
						+ ";\"></span>\n");

			} else {
				strOut.append(buttonBegin + "start=" + startTemp + "'\">");
				strOut.append(i);
				strOut.append("</a>\n");
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
							+ "start="
							+ (pageConfTempLast.getStart() - pageConf
									.getLimit()) + "'\">");
					strOut.append(pageConfTempLast.getCurrentPage());
					strOut.append("</a>\n");
				}
				strOut.append(buttonBegin + "start="
						+ pageConfTempLast.getStart() + "'\">");
				strOut.append(pageConfTempLast.getCurrentPage() + 1);
				strOut.append("</a>\n");
			}

		}

		// 显示下一页
		if (pageConfTemp2.hasNext()) {
			pageConfTemp2.getNext();
			strOut.append(buttonBegin + "start=" + pageConfTemp2.getStart()
					+ "'\">");
			strOut.append("\u4e0b\u4e00\u9875</a>\n");// 下一页
		} else {
			strOut.append("<a class='prev-page disabled'>\u4e0b\u4e00\u9875</a>\n");
		}
		return strOut.toString();
	}

	public static void main(String[] args) {
		System.out.println(genCenterButtons(0, 10, 128, "/blog/"));
	}

}
