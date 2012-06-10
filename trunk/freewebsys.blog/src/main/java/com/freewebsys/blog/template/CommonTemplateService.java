package com.freewebsys.blog.template;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.freewebsys.blog.common.GlobalConf;
import com.freewebsys.blog.dao.BaseDao;
import com.freewebsys.blog.pojo.Comment;
import com.freewebsys.blog.pojo.Post;
import com.freewebsys.blog.pojo.PostType;
import com.freewebsys.blog.service.PostService;
import com.freewebsys.blog.service.PostTypeService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import freemarker.template.Template;

public class CommonTemplateService {

	/**
	 * 生成首页，html.同时生成文章
	 */
	public static void genHtmlByTemplate(HttpServletRequest request) {

		int pageSize = 10;
		ApplicationContext applicationContext = WebApplicationContextUtils
				.getWebApplicationContext(request.getSession()
						.getServletContext());
		PostTypeService postTypeService = (PostTypeService) applicationContext
				.getBean("postTypeService");
		PostService postService = (PostService) applicationContext
				.getBean("postService");
		List<Post> postList = null;
		List<PostType> postTypeList = null;
		try {
			postList = postService.findAllPost();
			postTypeList = postTypeService.findAllPostType();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// 设置分类数组.
		Map<Long, List<Post>> postTypeMap = new HashMap<Long, List<Post>>();
		for (PostType postType : postTypeList) {
			postTypeMap.put(postType.getId(), new ArrayList<Post>());
		}

		// 找到分类数据.
		for (int i = 0; i < postList.size(); i++) {
			Post post = postList.get(i);
			if (post.getPostTypeId() != null) {
				// 将分类增加到map里面.
				postTypeMap.get(post.getPostTypeId()).add(post);
			}
			// 生成每一个文章页面.
			Map<String, Object> postMap = new HashMap<String, Object>();
			// 文章分类数据
			postMap.put("postTypeList", postTypeList);
			postMap.put("DateParse", new DateParseDirective());
			postMap.put("post", post);
			postMap.put("blogPath", GlobalConf.BLOG_PATH);
			postMap.put("options", GlobalConf.options);
			genPostByTemplate(postMap);
		}

		// 首页的分页
		genHtmlByPage(pageSize, postList, postTypeList, "");
		// 分类的分页
		for (Map.Entry<Long, List<Post>> entry : postTypeMap.entrySet()) {
			// 每一个分类按照id生成目录.
			genHtmlByPage(pageSize, entry.getValue(), postTypeList, "/type/"
					+ entry.getKey().longValue());
		}

	}

	/**
	 * @param pageSize
	 * @param postList
	 * @param postTypeList
	 * @param path
	 *            通用生成分页方法,首页或是分类的分页.
	 */
	private static void genHtmlByPage(int pageSize, List<Post> postList,
			List<PostType> postTypeList, String path) {

		// 循环展示页面.
		String filePath = FreemakerTemplateEngine.WEBAPP_PATH
				+ GlobalConf.BLOG_PATH + path;
		// 如果文件夹不存在,创建.
		File fileDir = new File(filePath + "/json");
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}

		// gen page.
		System.out.println("postList.size():" + postList.size());
		int allPage = (int) Math.ceil((double) postList.size()
				/ (double) pageSize);
		System.out.println("allPage" + allPage);
		if (allPage == 0) {
			// 如果总页数是0,分页数1.
			allPage = 1;
		}
		// 创建数组.
		List<Post>[] postListTmp = new ArrayList[allPage];
		for (int j = 0; j < postListTmp.length; j++) {
			// 初始化数组.
			postListTmp[j] = new ArrayList<Post>();
		}
		// 增加son转换分页.
		Gson gson = new Gson();
		// 循环.
		for (int i = 0; i < postList.size(); i++) {
			// 增加首页分页.
			int loopPage = (int) Math.floor(i / pageSize);
			System.out.println("loopPage:" + loopPage);
			Post post = postList.get(i);
			postListTmp[loopPage].add(post);
			// 增加每一个文章的生成.
			String prevUrl = null;
			String nextUrl = null;
			if (i != 0) {
				// 前一个url.
				Post postTemp = postList.get(i - 1);
				prevUrl = postTemp.getUrl();
			}
			if (i != (postList.size() - 1)) {
				// 后一个url.
				Post postTemp = postList.get(i + 1);
				nextUrl = postTemp.getUrl();
			}
			// 增加类型分页参数.
			if (StringUtils.isNotBlank(path) && StringUtils.isNotBlank(prevUrl)) {
				prevUrl += "?type=" + path;
			}
			if (StringUtils.isNotBlank(path) && StringUtils.isNotBlank(nextUrl)) {
				nextUrl += "?type=" + path;
			}
			JsonObject object = new JsonObject();
			object.addProperty("prevUrl", prevUrl);
			object.addProperty("nextUrl", nextUrl);

			String json = filePath + "/json/article_" + post.getId() + ".json";
			// 生成对文章的json字符串.
			try {
				FileUtils.writeStringToFile(new File(json),
						gson.toJson(object), GlobalConf.ENCODING);
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		Template temp = null;
		try {
			temp = FreemakerTemplateEngine
					.getTemplateByName("/theme/default/index.ftl");
		} catch (Exception e) {
		}

		for (int j = 0; j < postListTmp.length; j++) {
			try {

				Map<String, Object> root = new HashMap<String, Object>();
				// 使用自定义模板postList
				root.put("postList", postListTmp[j]);
				root.put("postTypeList", postTypeList);
				root.put("DateParse", new DateParseDirective());
				root.put("allPage", allPage);
				root.put("currentPage", (j + 1));
				root.put("blogPath", GlobalConf.BLOG_PATH);
				root.put("options", GlobalConf.options);
				// 分类路径.如果没有就是首页.
				root.put("typePath", path);
				String indexhtml = FreemakerTemplateEngine
						.writeTemp(temp, root);

				String indexFile = filePath + "/index_" + (j + 1) + ".html";
				// 生成首页index.html文件.
				FileUtils.writeStringToFile(new File(indexFile), indexhtml,
						GlobalConf.ENCODING);

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 生成文章函数(genPostByTemplate)调用，其他地方不需要调用.
	 */
	public static void genPostByTemplate(Map<String, Object> root) {
		Template articleTemp;
		try {
			// 文章的模板.
			articleTemp = FreemakerTemplateEngine
					.getTemplateByName("/theme/default/article.ftl");

			String postHtml = FreemakerTemplateEngine.writeTemp(articleTemp,
					root);
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

	/**
	 * @param pageSize
	 * @param commentList
	 * @param postTypeList
	 * @param path
	 *            通用生成分页方法,首页或是分类的分页.
	 */
	public static void genCommentByPage(int pageSize,
			List<Comment> commentList, String path) {

		// gen page.
		System.out.println("postList.size():" + commentList.size());
		int allPage = (int) Math.ceil((double) commentList.size()
				/ (double) pageSize);
		System.out.println("allPage" + allPage);
		if (allPage == 0) {
			// 如果总页数是0,分页数1.
			allPage = 1;
		}
		// 创建数组.
		List<Comment>[] commentListTmp = new ArrayList[allPage];
		for (int j = 0; j < commentListTmp.length; j++) {
			// 初始化数组.
			commentListTmp[j] = new ArrayList<Comment>();
		}
		// 增加son转换分页.
		Gson gson = new Gson();
		// 循环.
		for (int i = 0; i < commentList.size(); i++) {
			// 增加首页分页.
			int loopPage = (int) Math.floor(i / pageSize);
			System.out.println("loopPage:" + loopPage);
			Comment comment = commentList.get(i);
			commentListTmp[loopPage].add(comment);
		}
		Template temp = null;
		try {
			temp = FreemakerTemplateEngine
					.getTemplateByName("/theme/default/commentList.ftl");
		} catch (Exception e) {
		}

		for (int j = 0; j < commentListTmp.length; j++) {
			try {

				Map<String, Object> root = new HashMap<String, Object>();
				// 使用自定义模板postList
				root.put("commentList", commentListTmp[j]);
				root.put("DateParse", new DateParseDirective());
				root.put("allPage", allPage);
				root.put("currentPage", (j + 1));
				root.put("blogPath", GlobalConf.BLOG_PATH);
				root.put("options", GlobalConf.options);
				// 分类路径.如果没有就是首页.
				String commentListHtml = FreemakerTemplateEngine.writeTemp(
						temp, root);
				// 生成文件.
				String indexFile = path + "comment_list_" + (j + 1) + ".html";
				System.out.println("genFile:" + indexFile);
				// 生成首页comment_list_?.html文件.
				FileUtils.writeStringToFile(new File(indexFile),
						commentListHtml, GlobalConf.ENCODING);

			} catch (IOException e) {
				e.printStackTrace();
			}
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
		System.out.println((int) Math.ceil(128.0 / 10));
	}
}
