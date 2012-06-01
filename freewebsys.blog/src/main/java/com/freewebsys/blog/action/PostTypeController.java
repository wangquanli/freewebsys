package com.freewebsys.blog.action;

import java.util.List;

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
import com.freewebsys.blog.pojo.PostType;
import com.freewebsys.blog.service.PostTypeService;

@Controller
public class PostTypeController extends BaseController {

	@Resource(name = "postTypeService")
	protected PostTypeService postTypeService;

	/**
	 * addPostType
	 */
	@RequestMapping(value = "/admin/addPostType")
	public String addPostType(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "id", required = false) Long id,
			ModelMap model) throws Exception {
		if (id != null) {
			PostType postType = postTypeService.findPostTypeById(id);
			model.addAttribute("postTypeAttribute", postType);
		} else {
			model.addAttribute("postTypeAttribute", new PostType());
		}
		return "/admin/postType/postTypeForm";
	}

	/**
	 * savePostType
	 */
	@RequestMapping(value = "/admin/savePostType", method = RequestMethod.POST)
	public String savePostType(HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("postTypeAttribute") PostType postType,
			ModelMap model) throws Exception {
		// save or update postType.
		if (postType != null) {
			if (postType.getIsHome() == null) {
				// 如果没有默认是0,系统会自动生成一个带1的
				postType.setIsHome(0);
			}
			postTypeService.savePostType(postType);
		}
		return "redirect:/admin/listPostType.do";
	}

	/**
	 * deletePostType
	 */
	@RequestMapping(value = "/admin/deletePostType")
	public String deletePostType(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "id", required = true) Long id, ModelMap model)
			throws Exception {
		// save or update postType.
		postTypeService.deletePostTypeById(id);
		return "redirect:/admin/listPostType.do";
	}

	/**
	 * listPostType
	 */
	@RequestMapping(value = "/admin/listPostType")
	public String listPostType(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "start", required = false) Integer start,
			ModelMap model) throws Exception {
		if (start == null) {
			start = 0;
		}
		// 查询全部.
		List<PostType> postTypeList = postTypeService.findAllPostType();
		model.addAttribute("postTypeList", postTypeList);
		return "/admin/postType/postTypeList";
	}

}
