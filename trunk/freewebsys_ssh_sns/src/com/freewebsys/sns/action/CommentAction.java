package com.freewebsys.sns.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.service.CommentService;
import com.freewebsys.sns.pojo.Comment;
import com.freewebsys.sns.action.BaseSNSAction;
import com.freewebsys.core.page.PageConf;

public class CommentAction extends BaseSNSAction {

	@Autowired
	private CommentService commentService;
	private PageConf page;
	private Integer parentId;
	private String appType;
	private Integer appId;
	private String commentContent;

	/**
	 * 分页.查询.排序.
	 */
	public String listComment() throws Exception {
		System.out.println("listComment," + appType + "," + appId);
		// 设定分页记录数.
		limit = 10;
		Map map = new HashMap<String, Object>();
		// 匹配查询参数.
		map.put("module.appType,String,=", appType);
		map.put("module.appId,Integer,=", appId);
		map.put("module.parentId,Integer,=", 0);
		
		page = commentService.findCommentPageList(start, limit, map);
		return SUCCESS;
	}

	/**
	 * 分页.查询.排序.
	 */
	public String listSubComment() throws Exception {
		System.out.println("listSubComment," + appType + "," + appId);
		// 设定分页记录数.
		limit = 8;
		Map map = new HashMap<String, Object>();
		// 匹配查询参数.
		map.put("module.appType,String,=", appType);
		map.put("module.appId,Integer,=", appId);
		map.put("module.parentId,Integer,=", parentId);
		
		page = commentService.findCommentPageList(start, limit, map);
		return SUCCESS;
	}

	/**
	 * 删除action.
	 */
	public void deleteComment() throws Exception {
		try {
			commentService.deleteCommentById(id);
		} catch (Exception e) {
			writeToPage("0");// 失败
		}
		writeToPage("1");// 成功
	}

	/**
	 * 保存action.
	 */
	public void saveComment() throws Exception {
		System.out.println("saveComment," + appType + "," + appId);
		try {
			Comment comment = new Comment();
			comment.setAppType(appType);
			comment.setAppId(appId);
			comment.setParentId(parentId);
			comment.setCreateTime(new Date());
			comment.setComment(commentContent);
			commentService.saveComment(comment);
		} catch (Exception e) {
			writeToPage("0");// 失败
		}
		writeToPage("1");// 成功
	}

	/** 以下是get,set方法 */
	public PageConf getPage() {
		return page;
	}

	public void setPage(PageConf page) {
		this.page = page;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getAppType() {
		return appType;
	}

	public void setAppType(String appType) {
		this.appType = appType;
	}

	public Integer getAppId() {
		return appId;
	}

	public void setAppId(Integer appId) {
		this.appId = appId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

}
