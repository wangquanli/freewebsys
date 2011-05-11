package com.freewebsys.sns.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.service.MessageService;
import com.freewebsys.sns.pojo.Message;
import com.freewebsys.core.action.BaseAction;
import com.freewebsys.core.page.PageConf;

public class MessageAction extends BaseSNSAction {

	@Autowired
	private MessageService messageService;
	private Message message;
	private PageConf page;

	/**
	 * 分页.查询.排序.
	 */
	public String listMessage() throws Exception {
		// 设定分页记录数.
		limit = 10;
		page = messageService.findMessagePageList(start, limit,
				getSessionUserInfo(), type);
		return SUCCESS;
	}

	/**
	 * 增加,修改action.
	 */
	public String addMessage() throws Exception {
		if (id != null) {
			message = messageService.findMessageById(id);
		}
		return INPUT;
	}

	/**
	 * 删除action.
	 */
	public String deleteMessage() throws Exception {
		for (int i = 0; ids != null && i < ids.length; i++) {// 删除多个.
			messageService.deleteMessageById(ids[i]);
		}
		return SUCCESS;
	}

	/**
	 * 保存action.
	 */
	public String saveMessage() throws Exception {
		if (message.getToUserIds() != null) {
			// 取出掉I称之间的空格
			message.setToUserIds(message.getToUserIds().replaceAll(" ", ""));
		}
		String[] findUsers = messageService.findUserByIds(message
				.getToUserIds());
		if (findUsers[0].trim().equals(message.getToUserIds().trim())) {
			message.setToUserNames(findUsers[1]);
			messageService.saveMessage(message, getSessionUserInfo());
		} else {
			addActionError("未找到收件人.");
			return INPUT;
		}
		return SUCCESS;
	}

	/**
	 * 查看aciton.
	 */
	public String viewMessage() throws Exception {
		message = messageService.findMessageById(id);
		return SUCCESS;
	}

	/** 以下是get,set方法 */
	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public PageConf getPage() {
		return page;
	}

	public void setPage(PageConf page) {
		this.page = page;
	}

	public static void main(String[] args) {
		String str = "java, test, ..aa ";
		System.out.println(str.replaceAll(" ", ""));
		System.out.println(StringUtils.trim("java, test, ..aa "));
	}

}
