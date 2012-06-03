package com.freewebsys.blog.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Date;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.io.output.FileWriterWithEncoding;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.freewebsys.blog.common.GlobalConf;
import com.freewebsys.blog.dao.BaseDao;
import com.freewebsys.blog.page.PageConf;
import com.freewebsys.blog.pojo.Option;
import com.freewebsys.blog.service.OptionService;
import com.freewebsys.blog.template.FreemakerTemplateEngine;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.Dom4JDriver;

public class OptionServiceImp implements OptionService {

	static final String OPTION_CONF_FILE = "/WEB-INF/classes/Option.cfg.xml";

	private static final Map<String, Option> OPTION_DEFAULT_MAP = new HashMap<String, Option>();

	static {
		{
			final Option option = new Option();
			option.setName("blogName");
			option.setCnName("博客名称");
			option.setHtml("<input type='text' name='valName' value='${value}' style='width: 500px;'>");
			option.setValue("test");
			option.setOrderId(1);
			// 设置数组
			OPTION_DEFAULT_MAP.put(option.getName(), option);
		}
		{
			final Option option = new Option();
			option.setName("blogDesc");
			option.setCnName("博客描述");
			option.setHtml("<textarea name='valName' style='width:500px;height:50px;'>${value}</textarea>");
			option.setValue("test");
			option.setOrderId(2);
			// 设置数组
			OPTION_DEFAULT_MAP.put(option.getName(), option);
		}
		{
			final Option option = new Option();
			option.setName("analyticsJs");
			option.setCnName("统计js代码如 google analytics");
			option.setHtml("<textarea name='valName' style='width:500px;height:200px;'>${value}</textarea>");
			option.setValue("<script type='text/javascript'></script>");
			option.setOrderId(3);
			// 设置数组
			OPTION_DEFAULT_MAP.put(option.getName(), option);
		}
		// optionMap.put("blogName", "test");
		// optionMap.put("blogNameDesc", "test");
		// optionMap.put("isDebug", "false");// 默认是否进行开发。
	}

	private static Log log = LogFactory.getLog(OptionServiceImp.class);

	/**
	 * Option保存
	 */
	@Transactional
	public void saveOption(List<Option> optionList) throws Exception {
		log.info("saveOption：" + optionList);
		try {
			XStream xStream = new XStream(new Dom4JDriver());
			xStream.alias("Option", Option.class);

			Map<String, Option> optionMap = new HashMap<String, Option>();
			// 循环数组.
			for (Option option : optionList) {
				// 循环数组，放到map里面.
				Option optionTmp = OPTION_DEFAULT_MAP.get(option.getName());
				option.setCnName(optionTmp.getCnName());
				option.setHtml(optionTmp.getHtml());
				option.setOrderId(optionTmp.getOrderId());
				optionMap.put(option.getName(), option);
			}
			// 保存到xml里面.
			File confFile = new File(FreemakerTemplateEngine.WEBAPP_PATH
					+ OPTION_CONF_FILE);
			xStream.toXML(optionMap, new FileWriterWithEncoding(confFile,
					"utf-8"));
			// baseDao.save(option);
			// 更新配置文件.
			updateGlobalConf();
		} catch (Exception e) {
			log.info("Option保存异常");
			e.printStackTrace();
		}
	}

	/**
	 * 查询Option全部
	 */
	@Transactional
	public List<Option> findAllOption() throws Exception {
		log.info("findAllOption：");
		try {
			List<Option> tempList = new ArrayList<Option>();
			// 读取xml文件.
			File confFile = new File(FreemakerTemplateEngine.WEBAPP_PATH
					+ OPTION_CONF_FILE);
			XStream xStream = new XStream(new Dom4JDriver());
			xStream.alias("Option", Option.class);
			Map<String, Option> optionMap = new HashMap<String, Option>();
			// 如果文件存在.
			if (confFile.exists()) {
				optionMap = (Map<String, Option>) xStream.fromXML(confFile);
			}
			// 拼接返回结果.
			for (Option option : OPTION_DEFAULT_MAP.values()) {
				// 如果配置文件里面有配置,使用配置文件.
				if (optionMap.containsKey(option.getName())) {
					tempList.add(optionMap.get(option.getName()));
				} else {// 使用默认配置.
					Option optionTmp = new Option();
					// 拷贝属性
					// optionTmp.setName(option.getName());
					// optionTmp.setCnName(option.getCnName());
					// optionTmp.setHtml(option.getHtml());
					// optionTmp.setValue(option.getValue());
					BeanUtils.copyProperties(option, optionTmp);
					tempList.add(optionTmp);
				}
			}
			// 使用orderId排序.
			Collections.sort(tempList);
			return tempList;
		} catch (Exception e) {
			log.info("查询Option全部异常");
			e.printStackTrace();
		}
		return null;
	}

	public void updateGlobalConf() throws Exception {
		log.info("updateGlobalConf：");
		try {
			List<Option> optionList = findAllOption();
			Map<String, String> optionMap = new HashMap<String, String>();
			// 循环数组.
			for (Option option : optionList) {
				// 循环数组，放到map里面.
				optionMap.put(option.getName(), option.getValue());
			}
			GlobalConf.options = optionMap;
		} catch (Exception e) {
			log.info("Option保存异常");
			e.printStackTrace();
		}
	}
}
