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
import com.freewebsys.blog.pojo.Post;
import com.freewebsys.blog.service.PostService;

@Controller
public class PostController extends BaseController {

	@Resource(name = "postService")
	protected PostService postService;

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
			postService.savePost(post);
		}
		return "redirect:/admin/listPost.do";
	}

	/**
	 * deletePost
	 */
	@RequestMapping(value = "/admin/deletePost")
	public String deletePost(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "id", required = true) Long id,
			ModelMap model) throws Exception {
		// save or update post.
		postService.deletePostById(id);
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
		PageConf pageConf = postService.findPostPageList(start, limit,
				null);

		model.addAttribute("pageConf", pageConf);
		model.addAttribute("start", start);
		return "/admin/post/postList";
	}

}
