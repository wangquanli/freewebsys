package com.freewebsys.common.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class EXTUtil {

	/**
	 * 返回分页的json格式.results里面是java对象.
	 */
	public static String toPageJSON(int size, List results) {
		StringBuffer json = new StringBuffer();
		// 将返回数据拼接成一个json的分页格式.
		json.append("{\n\"results\":\"");
		json.append(size);
		json.append("\",\n\"items\":[\n");
		if (results != null)// 如果结果不为空.
			for (int i = 0; i < results.size(); i++) {
				json.append(toObjectJSON(results.get(i)));
				if ((i + 1) != results.size()) {/* 不是最后一个.添加逗号. */
					json.append(",");
				}
			}
		json.append("]}");
		return json.toString();
	}

	/**
	 * 将一个对象转换成一个json的格式.
	 */
	public static String toObjectJSON(Object obj) {
		StringBuffer buffer = new StringBuffer();
		// josn records begin
		buffer.append("{\n");
		// data begin ..
		Field[] fieldlist = obj.getClass().getDeclaredFields();
		Map<String, String> tempMap = new HashMap<String, String>();
		for (int j = 0; j < fieldlist.length; j++) {
			Field fld = fieldlist[j];
			// System.out.println("name = " + fld.getName());
			// get + Id "id" :修改小写成大写.
			String strGetMethodName = "get"
					+ (fld.getName().charAt(0) + "").toUpperCase()
					+ fld.getName().substring(1);
			if (strGetMethodName.indexOf("getJdo") >= 0) {
				continue;// 去除掉一些特殊的函数.这个从jdo取得后带的.
			} else if (strGetMethodName.indexOf("getSerialVersionUID") >= 0) {
				continue;// 去除一些特殊的函数.
			}
			// 不将特殊函数放到里面.

			try {
				Method meth = obj.getClass().getMethod(strGetMethodName);
				// System.out.println(meth.getName());//得到属性的名字.
				// System.out.println(meth.getDefaultValue());
				// System.out.println(meth.invoke(obj));
				Object value = meth.invoke(obj);
				if (value == null) {
					value = "";
				} else if (value.getClass().equals(Date.class)) {
					// 对特殊类型进行出来判断是否是日期类型.然后进行格式化.
					// System.out.println(value.getClass());
					value = new java.text.SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss").format(value);
				}
				tempMap.put(fld.getName(), value + "");
				// buffer.append("\"" + value + "\"");
				// "id" : getId();
				// get value from Class
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		/* 重新进行一次循环.因为.通过jdo返回的时候有其他参数. */
		for (Iterator<Entry<String, String>> it = tempMap.entrySet().iterator(); it
				.hasNext();) {
			Entry<String, String> entry = it.next();
			buffer.append("\"" + entry.getKey() + "\":");
			buffer.append("\"" + entry.getValue() + "\"");
			// 这次循环为了判断是否在结尾.是添加逗号.还是添加回车.这个会之间影响页面是否能正常显示.
			if (it.hasNext()) {
				buffer.append(",");
			} else {
				buffer.append("\n");
			}// end of files ...
		}
		buffer.append("}\n");
		// josn records end .
		return buffer.toString();
	}

}
