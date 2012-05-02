package com.freewebsys.blog.template;

import java.io.*;
import java.util.*;
import javax.servlet.jsp.PageContext;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreemakerTemplateEngine {

	private static final Map<String, freemarker.template.Template> templates = new HashMap<String, freemarker.template.Template>();

	private static final boolean freemarkerCaching = false;

	private static final Configuration cfg = new Configuration();

	static {
		/* Create and adjust the configuration 初始化配置 */
		// ServletContext context = ServletActionContext.getServletContext();
		// 取得运行时路径
		// System.out.println(context);
		try {
			String basePath = FreemakerTemplateEngine.class.getResource("/")
					.toString().replace("file:", "");
			/* Create and adjust the configuration 初始化配置 */
			// 加载模板
			File filePathTemp = new File(basePath).getParentFile();
			System.out.println("filePath:" + filePathTemp);
			cfg.setDirectoryForTemplateLoading(filePathTemp);
		} catch (IOException e) {
			// TODO Auto-generated catch block
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

		for (Iterator<String> it = templates.keySet().iterator(); it.hasNext();) {
			String tempName = it.next();
			// System.out.println(tempName);
			if (freemarkerCaching && tempName != null && tempName.equals(name)) {
				// 使用缓存 if freemarkerCaching
				// System.out.println("have");
				template = templates.get(name);
				break;
			}
		}

		if (template == null) {// 如果是null从文件读取
			try {

				// template = cfg.getTemplate(name, "UTF-8");
				InputStream ins = FreemakerTemplateEngine.class
						.getClassLoader().getParent()
						.getResourceAsStream("theme/default/" + name);
				BufferedReader bufferedReader = new BufferedReader(
						new InputStreamReader(ins, "UTF-8"));
				// System.out.println(IOUtils.toString(ins));
				// e.printStackTrace();
				template = new Template(name, bufferedReader, cfg, "UTF-8");
			} catch (Exception e) {// 读取文件异常
				System.out.println("原文件读取异常,使用资源读取");
			}
			templates.put(name, template);
		}
		return template;
	}

	/**
	 * 将模板写到页面
	 */
	public static void writeTempToPage(Template temp, PageContext pageContext,
			Map values) {
		Writer writer = pageContext.getOut();
		final Writer wrapped = writer;
		writer = new Writer() {
			public void write(char cbuf[], int off, int len) throws IOException {
				wrapped.write(cbuf, off, len);
			}

			public void flush() throws IOException {
				// nothing!
			}

			public void close() throws IOException {
				wrapped.close();
			}
		};
		try {
			temp.process(values, writer);
			writer.flush();
			pageContext.pushBody(writer);
		} catch (TemplateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void main(String[] args) throws IOException {
		FreemakerTemplateEngine.getTemplateByName("index.ftl");
	}

}
