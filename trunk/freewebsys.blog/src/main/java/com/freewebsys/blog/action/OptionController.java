package com.freewebsys.blog.action;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.freewebsys.blog.page.PageConf;
import com.freewebsys.blog.pojo.Option;
import com.freewebsys.blog.service.OptionService;

@Controller
public class OptionController extends BaseController {

	@Resource(name = "optionService")
	protected OptionService optionService;

	/**
	 * saveOption
	 */
	@RequestMapping(value = "/admin/saveOption", method = RequestMethod.POST)
	public String saveOption(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "keyName", required = true) List<String> keyNameList,
			@RequestParam(value = "valName", required = true) List<String> valNameList,
			ModelMap model) throws Exception {
		// save or update option.
		List<Option> optionList = new ArrayList<Option>();
		for (int i = 0; i < keyNameList.size(); i++) {
			String keyName = keyNameList.get(i);
			String valName = valNameList.get(i);
			System.out.println(keyName);
			Option option = new Option();
			option.setName(keyName);
			option.setValue(valName);
			optionList.add(option);
		}
		optionService.saveOption(optionList);
		return "redirect:/admin/listOption.do";
	}

	/**
	 * listOption
	 */
	@RequestMapping(value = "/admin/listOption")
	public String listOption(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		List<Option> optionList = optionService.findAllOption();
		for (Option option : optionList) {
			String html = option.getHtml();
			if (html != null && option.getValue() != null
					&& option.getName() != null) {
				html = html.replace("${value}", option.getValue());
				// key是做参数索引
				html = "<input name='keyName' type='hidden' value='"
						+ option.getName() + "'/>" + html;
			}
			option.setHtml(html);
		}
		model.addAttribute("optionList", optionList);
		return "/admin/option/optionList";
	}
}
