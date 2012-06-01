package com.freewebsys.blog.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.freewebsys.blog.pojo.Template;
import com.freewebsys.blog.template.FreemakerTemplateEngine;

@Controller
public class TemplateController extends BaseController {

	static final String THEME_PATH = "/WEB-INF/theme/";

	/**
	 * addTemplate
	 */
	@RequestMapping(value = "/admin/addTemplate")
	public String addTemplate(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "path", required = true) String path,
			ModelMap model) throws Exception {

		Template template = new Template();
		template.setName(name);
		template.setPath(path);

		File theme = new File(FreemakerTemplateEngine.WEBAPP_PATH + THEME_PATH
				+ path + "/" + name);
		String content = FileUtils.readFileToString(theme, "utf-8");
		template.setContent(content);
		// 将内容放到表单里面
		model.addAttribute("templateAttribute", template);
		return "/admin/template/templateForm";
	}

	/**
	 * saveTemplate
	 */
	@RequestMapping(value = "/admin/saveTemplate", method = RequestMethod.POST)
	public String saveTemplate(HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("templateAttribute") Template template,
			ModelMap model) throws Exception {
		// save or update template.
		if (template != null && StringUtils.isNotBlank(template.getName())
				&& StringUtils.isNotBlank(template.getPath())) {
			// templateService.saveTemplate(template);
			File theme = new File(FreemakerTemplateEngine.WEBAPP_PATH
					+ THEME_PATH + template.getPath() + "/"
					+ template.getName());
			// 保存文件.
			FileUtils.writeStringToFile(theme, template.getContent(), "utf-8");
		}
		return "redirect:/admin/listTemplate.do";
	}

	/**
	 * listTemplate
	 */
	@RequestMapping(value = "/admin/listTemplate")
	public String listTemplate(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "start", required = false) Integer start,
			ModelMap model) throws Exception {
		if (start == null) {
			start = 0;
		}
		model.addAttribute("templateList", getTempList("default"));
		model.addAttribute("start", start);
		return "/admin/template/templateList";
	}

	/**
	 * 得到一个主题下面的全部模板.
	 */
	public static List<Template> getTempList(String themeName) {
		List<Template> tempList = new ArrayList<Template>();
		File themeDir = new File(FreemakerTemplateEngine.WEBAPP_PATH
				+ THEME_PATH + themeName);
		for (File file : themeDir.listFiles()) {
			if (!file.getName().equals(".svn")
					&& file.getName().indexOf(".ftl") > 0) {
				Template template = new Template();
				template.setName(file.getName());
				template.setPath(file.getParentFile().getName());
				System.out.println(template);
				// 增加模板文件.
				tempList.add(template);
			}
		}
		return tempList;
	}

	public static void main(String[] args) {
		System.out.println(FreemakerTemplateEngine.WEBAPP_PATH + THEME_PATH);
		getTempList("default");
	}

}
