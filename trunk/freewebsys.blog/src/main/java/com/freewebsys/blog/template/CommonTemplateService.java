package com.freewebsys.blog.template;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;

import com.freewebsys.blog.common.GlobalConf;
import com.freewebsys.blog.dao.BaseDao;
import com.freewebsys.blog.pojo.Post;

import freemarker.template.Template;

public class CommonTemplateService {

	/**
	 * 生成首页，html.同时生成文章
	 */
	public static void genHtmlByTemplate(BaseDao baseDao) {
		Template temp;
		try {
			temp = FreemakerTemplateEngine
					.getTemplateByName("/theme/default/index.ftl");

			Map<String, Object> root = new HashMap<String, Object>();
			// 使用自定义模板postList
			root.put("PostList", new PostListDirective(temp, baseDao));
			root.put("DateParse", new DateParseDirective());
			root.put("blogPath", GlobalConf.BLOG_PATH);
			String indexhtml = FreemakerTemplateEngine.writeTemp(temp, root);

			System.out.println(FreemakerTemplateEngine.WEBAPP_PATH);
			String indexFile = FreemakerTemplateEngine.WEBAPP_PATH
					+ GlobalConf.BLOG_PATH + "/index.html";

			// 生成首页index.html文件.
			FileUtils.writeStringToFile(new File(indexFile), indexhtml,
					GlobalConf.ENCODING);

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/**
	 * 生成首页函数(genHtmlByTemplate)调用，其他地方不需要调用.
	 */
	public static void genPostByTemplate(BaseDao baseDao,
			Map<String, Object> root) {
		Template temp;
		try {
			// 文章的模板.
			temp = FreemakerTemplateEngine
					.getTemplateByName("/theme/default/article.ftl");

			String postHtml = FreemakerTemplateEngine.writeTemp(temp, root);
			// System.out.println(FreemakerTemplateEngine.WEBAPP_PATH);
			Post post = (Post) root.get("post");
			if (post != null && post.getUrl() != null) {
				String fileName = post.getUrl().substring(
						post.getUrl().lastIndexOf("/") + 1);
				// 生成文件的决定路径.
				String filePath = FreemakerTemplateEngine.WEBAPP_PATH
						+ post.getUrl().substring(0,
								post.getUrl().lastIndexOf("/") + 1);
				File file = new File(filePath);
				if (!file.exists()) {
					file.mkdirs();
				}
				// 生成首页index.html文件.
				FileUtils.writeStringToFile(new File(filePath + fileName),
						postHtml, GlobalConf.ENCODING);
				System.out.println(filePath + fileName);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {
		// genHtmlByTemplate(null);
		String str = "/blog/2012/05/06/article_6.html";
		// 文件扩展名
		String fileName = str.substring(str.lastIndexOf("/") + 1);
		String filePath = str.substring(0, str.lastIndexOf("/") + 1);
		System.out.println(fileName);
		System.out.println(filePath);

	}
}
