package com.freewebsys.sns.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.service.BlogCategoryService;
import com.freewebsys.sns.pojo.BlogCategory;
import com.freewebsys.sns.action.BaseSNSAction;
import com.freewebsys.core.page.PageConf;

public class BlogCategoryAction extends BaseSNSAction {
	
	@Autowired
	private BlogCategoryService blogCategoryService;
	private BlogCategory blogCategory;
	private PageConf page;
	
	/**
	 * 分页.查询.排序.
	 */
	public String listBlogCategory() throws Exception {
		// 设定分页记录数.
		limit = 10;
		Map map = new HashMap<String, Object>();
		//匹配查询参数.
		if (blogCategory != null) {
			map.put("module.id,Integer,=", blogCategory.getId());
			map.put("module.name,String,=", blogCategory.getName());
			map.put("module.userId,Integer,=", blogCategory.getUserId());
		}
		page = blogCategoryService.findBlogCategoryPageList(start, limit, map);
		return SUCCESS;
	}

	/**
	 * 增加,修改action.
	 */
	public String addBlogCategory() throws Exception {
		if(id != null){
			blogCategory = blogCategoryService.findBlogCategoryById(id);
		}
		return  INPUT;
	}

	/**
	 * 删除action.
	 */
	public String deleteBlogCategory() throws Exception {
		for (int i = 0; ids != null && i < ids.length; i++) {//删除多个.
			blogCategoryService.deleteBlogCategoryById(ids[i]);
		}
		return  SUCCESS;
	}

	
	/**
	 * 保存action.
	 */
	public String saveBlogCategory() throws Exception {
		blogCategoryService.saveBlogCategory(blogCategory);
		return  SUCCESS;
	}

	/**
	 * 查看aciton.
	 */
	public String viewBlogCategory() throws Exception {
		blogCategory = blogCategoryService.findBlogCategoryById(id);
		return  SUCCESS;
	}
	/**以下是get,set方法*/
	public BlogCategory getBlogCategory() {
		return blogCategory;
	}

	public void setBlogCategory(BlogCategory blogCategory) {
		this.blogCategory = blogCategory;
	}
	
	public PageConf getPage() {
		return page;
	}

	public void setPage(PageConf page) {
		this.page = page;
	}

}
