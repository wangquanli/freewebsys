package com.freewebsys.sns.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.service.UserVisitorService;
import com.freewebsys.sns.pojo.UserVisitor;
import com.freewebsys.sns.action.BaseSNSAction;
import com.freewebsys.core.page.PageConf;

public class UserVisitorAction extends BaseSNSAction {
	
	@Autowired
	private UserVisitorService userVisitorService;
	private UserVisitor userVisitor;
	private PageConf page;
	
	/**
	 * 分页.查询.排序.
	 */
	public String listUserVisitor() throws Exception {
		// 设定分页记录数.
		limit = 10;
		Map map = new HashMap<String, Object>();
		//匹配查询参数.
		if (userVisitor != null) {
			map.put("module.id,Integer,=", userVisitor.getId());
			map.put("module.createTime,Date,=", userVisitor.getCreateTime());
			map.put("module.userId,Integer,=", userVisitor.getUserId());
			map.put("module.visitorId,Integer,=", userVisitor.getVisitorId());
			map.put("module.visitorName,String,=", userVisitor.getVisitorName());
		}
		page = userVisitorService.findUserVisitorPageList(start, limit, map);
		return SUCCESS;
	}

	/**
	 * 增加,修改action.
	 */
	public String addUserVisitor() throws Exception {
		if(id != null){
			userVisitor = userVisitorService.findUserVisitorById(id);
		}
		return  INPUT;
	}

	/**
	 * 删除action.
	 */
	public String deleteUserVisitor() throws Exception {
		for (int i = 0; ids != null && i < ids.length; i++) {//删除多个.
			userVisitorService.deleteUserVisitorById(ids[i]);
		}
		return  SUCCESS;
	}

	
	/**
	 * 保存action.
	 */
	public String saveUserVisitor() throws Exception {
		userVisitorService.saveUserVisitor(userVisitor);
		return  SUCCESS;
	}

	/**
	 * 查看aciton.
	 */
	public String viewUserVisitor() throws Exception {
		userVisitor = userVisitorService.findUserVisitorById(id);
		return  SUCCESS;
	}
	/**以下是get,set方法*/
	public UserVisitor getUserVisitor() {
		return userVisitor;
	}

	public void setUserVisitor(UserVisitor userVisitor) {
		this.userVisitor = userVisitor;
	}
	
	public PageConf getPage() {
		return page;
	}

	public void setPage(PageConf page) {
		this.page = page;
	}

}
