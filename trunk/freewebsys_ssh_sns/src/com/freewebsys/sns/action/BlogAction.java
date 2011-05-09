package com.freewebsys.sns.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.service.BlogService;
import com.freewebsys.sns.pojo.Blog;
import com.freewebsys.sns.pojo.BlogCategory;
import com.freewebsys.sns.action.BaseSNSAction;
import com.freewebsys.core.page.PageConf;

public class BlogAction extends BaseSNSAction {

	@Autowired
	private BlogService blogService;
	private Blog blog;
	private PageConf page;
	// 博客分类
	private BlogCategory blogCategory;
	private List<BlogCategory> blogCategoryList;

	/**
	 * 分页.查询.排序.
	 */
	public String listBlog() throws Exception {
		// 设定分页记录数.
		limit = 10;
		page = blogService.findBlogPageList(start, limit, getSessionUserInfo(),
				type);
		return SUCCESS;
	}

	/**
	 * 增加,修改action.
	 */
	public String addBlog() throws Exception {
		if (id != null) {
			blog = blogService.findBlogById(id);
		}
		return INPUT;
	}

	/**
	 * 删除action.
	 */
	public String deleteBlog() throws Exception {
		for (int i = 0; ids != null && i < ids.length; i++) {// 删除多个.
			blogService.deleteBlogById(ids[i]);
		}
		return SUCCESS;
	}

	/**
	 * 保存action.
	 */
	public String saveBlog() throws Exception {
		// blog.set
		blog.setUserInfo(getSessionUserInfo());
		blogService.saveBlog(blog);
		return SUCCESS;
	}

	/**
	 * 查看aciton.
	 */
	public String viewBlog() throws Exception {
		// 设定分页记录数.
		limit = 1;
		if (id != null) {
			page = blogService.findBlogPageList(start, limit,
					getSessionUserInfo(), type, id);
		} else {
			page = blogService.findBlogPageList(start, limit,
					getSessionUserInfo(), type);
		}

		return SUCCESS;
	}

	/** 以下是get,set方法 */
	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public PageConf getPage() {
		return page;
	}

	public void setPage(PageConf page) {
		this.page = page;
	}

	public BlogCategory getBlogCategory() {
		return blogCategory;
	}

	public void setBlogCategory(BlogCategory blogCategory) {
		this.blogCategory = blogCategory;
	}

	public List<BlogCategory> getBlogCategoryList() {
		return blogCategoryList;
	}

	public void setBlogCategoryList(List<BlogCategory> blogCategoryList) {
		this.blogCategoryList = blogCategoryList;
	}

}
