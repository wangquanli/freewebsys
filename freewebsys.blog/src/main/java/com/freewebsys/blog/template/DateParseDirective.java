package com.freewebsys.blog.template;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModelException;

public class DateParseDirective implements TemplateMethodModel {

	public DateParseDirective() {
	}

	public Object exec(List args) throws TemplateModelException {
		if (null != args && 0 < args.size()) {
			// 第2位是格式.
			String formatTmp = null;
			if (args.size() >= 2) {// 有第二个参数.
				formatTmp = (String) args.get(1);
			}
			SimpleDateFormat format = null;
			if (StringUtils.isNotBlank(formatTmp)) {
				// 不为空,带入格式.
				format = new SimpleDateFormat(formatTmp);
			} else {
				format = new SimpleDateFormat("yyyy-MM-dd");
			}
			String strTmp = (String) args.get(0);
			if (strTmp != null) {
				// 去掉数字的逗号.
				strTmp = strTmp.replaceAll(",", "");
				return format.format(new Date(Long.parseLong(strTmp)));
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

}
