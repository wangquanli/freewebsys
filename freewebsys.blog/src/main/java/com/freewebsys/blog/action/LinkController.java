package com.freewebsys.blog.action;

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
import com.freewebsys.blog.pojo.Link;
import com.freewebsys.blog.service.LinkService;

@Controller
public class LinkController extends BaseController {

	@Resource(name = "linkService")
	protected LinkService linkService;

	private static final int limit = 10;

	/**
	 * addLink
	 */
	@RequestMapping(value = "/admin/addLink")
	public String addLink(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "id", required = false) Long id,
			ModelMap model) throws Exception {
		if (id != null) {
			Link link = linkService.findLinkById(id);
			model.addAttribute("linkAttribute", link);
		} else {
			model.addAttribute("linkAttribute", new Link());
		}
		return "/admin/link/linkForm";
	}

	/**
	 * saveLink
	 */
	@RequestMapping(value = "/admin/saveLink", method = RequestMethod.POST)
	public String saveLink(HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("linkAttribute") Link link, ModelMap model)
			throws Exception {
		// save or update link.
		if (link != null) {
			linkService.saveLink(link);
		}
		return "redirect:/admin/listLink.do";
	}

	/**
	 * deleteLink
	 */
	@RequestMapping(value = "/admin/deleteLink")
	public String deleteLink(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "id", required = true) Long id,
			ModelMap model) throws Exception {
		// save or update link.
		linkService.deleteLinkById(id);
		return "redirect:/admin/listLink.do";
	}

	/**
	 * listLink
	 */
	@RequestMapping(value = "/admin/listLink")
	public String listLink(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "start", required = false) Integer start,
			ModelMap model) throws Exception {
		if (start == null) {
			start = 0;
		}
		PageConf pageConf = linkService.findLinkPageList(start, limit,
				null);

		model.addAttribute("pageConf", pageConf);
		model.addAttribute("start", start);
		return "/admin/link/linkList";
	}

}
