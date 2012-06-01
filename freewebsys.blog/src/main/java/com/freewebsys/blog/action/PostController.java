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
import com.freewebsys.blog.pojo.Post;
import com.freewebsys.blog.pojo.PostType;
import com.freewebsys.blog.service.PostService;
import com.freewebsys.blog.service.PostTypeService;

@Controller
public class PostController extends BaseController {

	@Resource(name = "postService")
	protected PostService postService;

	@Resource(name = "postTypeService")
	protected PostTypeService postTypeService;

	private static final int limit = 10;

	/**
	 * addPost
	 */
	@RequestMapping(value = "/admin/addPost")
	public String addPost(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "id", required = false) Long id,
			ModelMap model) throws Exception {
		if (id != null) {
			Post post = postService.findPostById(id);
			model.addAttribute("postAttribute", post);
		} else {
			model.addAttribute("postAttribute", new Post());
		}
		// 查询全部.
		List<PostType> postTypeList = postTypeService.findAllPostType();
		model.addAttribute("postTypeList", postTypeList);
		return "/admin/post/postForm";
	}

	/**
	 * savePost
	 */
	@RequestMapping(value = "/admin/savePost", method = RequestMethod.POST)
	public String savePost(HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("postAttribute") Post post, ModelMap model)
			throws Exception {
		// save or update post.
		if (post != null) {
			postService.savePost(post, request);
		}
		return "redirect:/admin/listPost.do";
	}

	/**
	 * deletePost
	 */
	@RequestMapping(value = "/admin/deletePost")
	public String deletePost(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "id", required = true) Long id, ModelMap model)
			throws Exception {
		// save or update post.
		postService.deletePostById(id, request);
		return "redirect:/admin/listPost.do";
	}

	/**
	 * listPost
	 */
	@RequestMapping(value = "/admin/listPost")
	public String listPost(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "start", required = false) Integer start,
			ModelMap model) throws Exception {
		if (start == null) {
			start = 0;
		}
		PageConf pageConf = postService.findPostPageList(start, limit, null);

		model.addAttribute("pageConf", pageConf);
		model.addAttribute("start", start);
		// 查询全部.
		List<PostType> postTypeList = postTypeService.findAllPostType();
		model.addAttribute("postTypeList", postTypeList);
		return "/admin/post/postList";
	}

}
