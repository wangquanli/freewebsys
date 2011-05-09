package com.freewebsys.sns.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.service.FriendGroupService;
import com.freewebsys.sns.pojo.FriendGroup;
import com.freewebsys.sns.action.BaseSNSAction;
import com.freewebsys.core.page.PageConf;

public class FriendGroupAction extends BaseSNSAction {
	
	@Autowired
	private FriendGroupService friendGroupService;
	private FriendGroup friendGroup;
	private PageConf page;
	
	/**
	 * 分页.查询.排序.
	 */
	public String listFriendGroup() throws Exception {
		// 设定分页记录数.
		limit = 10;
		Map map = new HashMap<String, Object>();
		//匹配查询参数.
		if (friendGroup != null) {
			map.put("module.id,Integer,=", friendGroup.getId());
			map.put("module.userId,Integer,=", friendGroup.getUserId());
			map.put("module.name,String,=", friendGroup.getName());
		}
		page = friendGroupService.findFriendGroupPageList(start, limit, map);
		return SUCCESS;
	}

	/**
	 * 增加,修改action.
	 */
	public String addFriendGroup() throws Exception {
		if(id != null){
			friendGroup = friendGroupService.findFriendGroupById(id);
		}
		return  INPUT;
	}

	/**
	 * 删除action.
	 */
	public String deleteFriendGroup() throws Exception {
		for (int i = 0; ids != null && i < ids.length; i++) {//删除多个.
			friendGroupService.deleteFriendGroupById(ids[i]);
		}
		return  SUCCESS;
	}

	
	/**
	 * 保存action.
	 */
	public String saveFriendGroup() throws Exception {
		friendGroupService.saveFriendGroup(friendGroup);
		return  SUCCESS;
	}

	/**
	 * 查看aciton.
	 */
	public String viewFriendGroup() throws Exception {
		friendGroup = friendGroupService.findFriendGroupById(id);
		return  SUCCESS;
	}
	/**以下是get,set方法*/
	public FriendGroup getFriendGroup() {
		return friendGroup;
	}

	public void setFriendGroup(FriendGroup friendGroup) {
		this.friendGroup = friendGroup;
	}
	
	public PageConf getPage() {
		return page;
	}

	public void setPage(PageConf page) {
		this.page = page;
	}

}
