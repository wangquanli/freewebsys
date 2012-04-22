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

	private static final Map<String, String> optionMap = new HashMap<String, String>();

	static {
		optionMap.put("isDebug", "false");// 默认是否进行开发。
	}

	private static final int limit = 10;

	/**
	 * saveOption
	 */
	@RequestMapping(value = "/admin/saveOption", method = RequestMethod.POST)
	public String saveOption(HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("optionAttribute") Option option, ModelMap model)
			throws Exception {
		// save or update option.
		if (option != null) {
			optionService.saveOption(option);
		}
		return "redirect:/admin/listOption.do";
	}

	/**
	 * listOption
	 */
	@RequestMapping(value = "/admin/listOption")
	public String listOption(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		Map<String, Option> allOption = optionService.findAllOption();
		List<Option> showOptionList = new ArrayList<Option>();
		for (Map.Entry<String, String> entry : optionMap.entrySet()) {
			// 如果包含就显示.
			if (allOption.containsKey(entry.getKey())) {
				showOptionList.add(allOption.get(entry.getKey()));
			} else {
				// 设置属性.
				Option option = new Option();
				option.setName(entry.getKey());
				option.setValue(entry.getValue());
				showOptionList.add(option);
			}
		}
		model.addAttribute("optionList", showOptionList);
		return "/admin/option/optionList";
	}
}
