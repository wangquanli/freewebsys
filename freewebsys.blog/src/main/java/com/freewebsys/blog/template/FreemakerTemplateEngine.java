package com.freewebsys.blog.template;

import java.io.*;
import java.util.*;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreemakerTemplateEngine {

	private static final Configuration cfg = new Configuration();

	public static File WEBAPP_PATH = null;

	static {
		try {
			// 取得运行时路径
			String basePath = FreemakerTemplateEngine.class.getResource("/")
					.toString().replace("file:", "");
			/* 初始化配置 */
			// 加载模板
			WEBAPP_PATH = new File(basePath).getParentFile();
			System.out.println("filePath:" + WEBAPP_PATH);
			cfg.setDirectoryForTemplateLoading(WEBAPP_PATH);
			// 上一级目录是webapp目录.
			WEBAPP_PATH = WEBAPP_PATH.getParentFile();
		} catch (IOException e) {
			e.printStackTrace();
		}
		cfg.setObjectWrapper(new DefaultObjectWrapper());
	}

	/**
	 * 通过模板名称读取模板，设置缓存
	 * 
	 * @throws IOException
	 */
	public static Template getTemplateByName(String name) throws IOException {
		Template template = null;
		try {
			template = cfg.getTemplate(name, "UTF-8");
		} catch (Exception e) {// 读取文件异常
			System.out.println("原文件读取异常");
		}
		return template;
	}

	/**
	 * 将模板写到页面
	 */
	public static String writeTemp(Template temp, Map<String, Object> root) {

		StringWriter writer = new StringWriter();
		try {
			temp.process(root, writer);
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String tempOut = writer.toString();
		return tempOut;

	}

	public static void main(String[] args) throws IOException {
		Template temp = FreemakerTemplateEngine
				.getTemplateByName("/theme/default/index.ftl");
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("testDate", new Date().toString());
		System.out.println(FreemakerTemplateEngine.writeTemp(temp, root));
	}

}
