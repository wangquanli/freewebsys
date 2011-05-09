package com.freewebsys.sns.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.service.MiniService;
import com.freewebsys.sns.pojo.Mini;
import com.freewebsys.sns.action.BaseSNSAction;
import com.freewebsys.core.page.PageConf;

public class MiniAction extends BaseSNSAction {

	@Autowired
	private MiniService miniService;
	private Mini mini;
	private PageConf page;

	/**
	 * 分页.查询.排序.
	 */
	public String listMini() throws Exception {
		// 设定分页记录数.
		limit = 10;
		page = miniService.findMiniPageList(start, limit, getSessionUserInfo(),
				type);
		return SUCCESS;
	}

	/**
	 * 增加,修改action.
	 */
	public String addMini() throws Exception {
		if (id != null) {
			mini = miniService.findMiniById(id);
		}
		return INPUT;
	}

	/**
	 * 删除action.
	 */
	public String deleteMini() throws Exception {
		for (int i = 0; ids != null && i < ids.length; i++) {// 删除多个.
			miniService.deleteMiniById(ids[i]);
		}
		return SUCCESS;
	}

	/**
	 * 保存action.
	 */
	public String saveMini() throws Exception {
		// 设置用户session
		mini.setUserInfo(getSessionUserInfo());
		miniService.saveMini(mini);
		return SUCCESS;
	}

	/**
	 * 查看aciton.
	 */
	public String viewMini() throws Exception {
		mini = miniService.findMiniById(id);
		return SUCCESS;
	}

	/** 以下是get,set方法 */
	public Mini getMini() {
		return mini;
	}

	public void setMini(Mini mini) {
		this.mini = mini;
	}

	public PageConf getPage() {
		return page;
	}

	public void setPage(PageConf page) {
		this.page = page;
	}

}
