package com.freewebsys.blog.action;

import java.util.Date;

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
import com.freewebsys.blog.pojo.Comment;
import com.freewebsys.blog.service.CommentService;

@Controller
public class CommentController extends BaseController {

	@Resource(name = "commentService")
	protected CommentService commentService;

	private static final int limit = 10;

	/**
	 * 前端保存评论。url不同。不进行过滤。
	 */
	@RequestMapping(value = "/web/saveComment", method = RequestMethod.POST)
	public void webSaveComment(HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("commentAttribute") Comment comment, ModelMap model)
			throws Exception {
		// save or update comment.
		if (comment != null) {
			// 设置用户ip.
			String ip = request.getLocalAddr();
			comment.setAuthorIp(ip);
			// 设置时间.
			comment.setCreateDate(new Date().getTime());
			// 设置显示.
			comment.setStatus(1);
			// 没有子评论.
			comment.setParentId(0L);
			commentService.saveComment(comment);
		}
		// ajax评论.
		writeToPage(response, "ok");
	}

	/**
	 * addComment
	 */
	@RequestMapping(value = "/admin/addComment")
	public String addComment(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "id", required = false) Long id,
			ModelMap model) throws Exception {
		if (id != null) {
			Comment comment = commentService.findCommentById(id);
			model.addAttribute("commentAttribute", comment);
		} else {
			model.addAttribute("commentAttribute", new Comment());
		}
		return "/admin/comment/commentForm";
	}

	/**
	 * saveComment
	 */
	@RequestMapping(value = "/admin/saveComment", method = RequestMethod.POST)
	public String saveComment(HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("commentAttribute") Comment comment, ModelMap model)
			throws Exception {
		// save or update comment.
		if (comment != null) {
			commentService.saveComment(comment);
		}
		return "redirect:/admin/listComment.do";
	}

	/**
	 * deleteComment
	 */
	@RequestMapping(value = "/admin/deleteComment")
	public String deleteComment(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "id", required = true) Long id, ModelMap model)
			throws Exception {
		// save or update comment.
		commentService.deleteCommentById(id);
		return "redirect:/admin/listComment.do";
	}

	/**
	 * listComment
	 */
	@RequestMapping(value = "/admin/listComment")
	public String listComment(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "start", required = false) Integer start,
			ModelMap model) throws Exception {
		if (start == null) {
			start = 0;
		}
		PageConf pageConf = commentService.findCommentPageList(start, limit,
				null);

		model.addAttribute("pageConf", pageConf);
		model.addAttribute("start", start);
		return "/admin/comment/commentList";
	}

}
