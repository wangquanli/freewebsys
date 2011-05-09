package com.freewebsys.sns.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.service.FeedService;
import com.freewebsys.sns.pojo.Feed;
import com.freewebsys.sns.pojo.UserInfo;
import com.freewebsys.sns.action.BaseSNSAction;
import com.freewebsys.core.page.PageConf;
import com.opensymphony.xwork2.ActionContext;

public class FeedAction extends BaseSNSAction {

	@Autowired
	private FeedService feedService;
	private Feed feed;
	private PageConf page;

	/**
	 * 显示动态片段
	 */
	public String viewFeedPiece() throws Exception {
		// 设定分页记录数.
		limit = 10;

		// 查询用户的分页信息
		page = feedService.findFeedPiecePageList(start, limit,
				getSessionUserInfo(), type);
		return SUCCESS;
	}

	/**
	 * 删除action.
	 */
	public String deleteFeed() throws Exception {
		feedService.deleteFeedById(id, getSessionUserInfo());
		return SUCCESS;
	}

	/** 以下是get,set方法 */
	public Feed getFeed() {
		return feed;
	}

	public void setFeed(Feed feed) {
		this.feed = feed;
	}

	public PageConf getPage() {
		return page;
	}

	public void setPage(PageConf page) {
		this.page = page;
	}

}
