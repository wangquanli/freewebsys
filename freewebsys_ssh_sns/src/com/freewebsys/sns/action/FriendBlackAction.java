package com.freewebsys.sns.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.service.FriendBlackService;
import com.freewebsys.sns.pojo.FriendBlack;
import com.freewebsys.sns.action.BaseSNSAction;
import com.freewebsys.core.page.PageConf;

public class FriendBlackAction extends BaseSNSAction {
	
	@Autowired
	private FriendBlackService friendBlackService;
	private FriendBlack friendBlack;
	private PageConf page;
	
	/**
	 * 分页.查询.排序.
	 */
	public String listFriendBlack() throws Exception {
		// 设定分页记录数.
		limit = 10;
		Map map = new HashMap<String, Object>();
		//匹配查询参数.
		if (friendBlack != null) {
			map.put("module.id,Integer,=", friendBlack.getId());
			map.put("module.userId,Integer,=", friendBlack.getUserId());
			map.put("module.friendId,Integer,=", friendBlack.getFriendId());
		}
		page = friendBlackService.findFriendBlackPageList(start, limit, map);
		return SUCCESS;
	}

	/**
	 * 增加,修改action.
	 */
	public String addFriendBlack() throws Exception {
		if(id != null){
			friendBlack = friendBlackService.findFriendBlackById(id);
		}
		return  INPUT;
	}

	/**
	 * 删除action.
	 */
	public String deleteFriendBlack() throws Exception {
		for (int i = 0; ids != null && i < ids.length; i++) {//删除多个.
			friendBlackService.deleteFriendBlackById(ids[i]);
		}
		return  SUCCESS;
	}

	
	/**
	 * 保存action.
	 */
	public String saveFriendBlack() throws Exception {
		friendBlackService.saveFriendBlack(friendBlack);
		return  SUCCESS;
	}

	/**
	 * 查看aciton.
	 */
	public String viewFriendBlack() throws Exception {
		friendBlack = friendBlackService.findFriendBlackById(id);
		return  SUCCESS;
	}
	/**以下是get,set方法*/
	public FriendBlack getFriendBlack() {
		return friendBlack;
	}

	public void setFriendBlack(FriendBlack friendBlack) {
		this.friendBlack = friendBlack;
	}
	
	public PageConf getPage() {
		return page;
	}

	public void setPage(PageConf page) {
		this.page = page;
	}

}
