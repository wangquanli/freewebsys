package com.freewebsys.sns.service.imp;

import java.util.List;
import java.util.Map;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.pojo.Blog;
import com.freewebsys.sns.pojo.Feed;
import com.freewebsys.sns.pojo.FeedUser;
import com.freewebsys.sns.service.FeedService;
import com.freewebsys.sns.service.FeedException;
import com.freewebsys.sns.pojo.UserInfo;
import com.opensymphony.xwork2.ActionContext;

public class FeedServiceImp implements FeedService {

	@Autowired
	private BaseDao baseDao;

	/**
	 * Feed删除
	 */
	@Override
	@Transactional
	public void deleteFeedById(Integer id, UserInfo userInfo)
			throws FeedException {
		try {
			FeedUser feedUser = (FeedUser) baseDao.findById(FeedUser.class, id);
			baseDao.delete(feedUser);
		} catch (Exception e) {
			throw new FeedException("Feed删除异常");
		}
	}

	@Override
	@Transactional
	public PageConf findFeedPiecePageList(int start, int limit,
			UserInfo userInfo, String type) throws FeedException {
		try {
			PageConf conf = null;
			if (type != null && !type.equals("all")) {
				String hql = " select module from FeedUser module left join fetch module.feed where module.userId = ? and module.feedType = ? ";
				// 通用查询匹配
				conf = baseDao.findPage(start, limit, hql, userInfo.getId(),
						type);
			} else {// 查询全部
				String hql = " select module from FeedUser module left join fetch module.feed where module.userId = ? ";
				// 通用查询匹配
				conf = baseDao.findPage(start, limit, hql, userInfo.getId());
			}
			return conf;
		} catch (Exception e) {
			throw new FeedException("查询Feed全部异常");
		}
	}

	/**
	 * Feed保存 使用线程后台执行
	 */
	@Override
	@Transactional
	public void saveFeed(Object obj) throws FeedException {
		try {
			HttpServletRequest request = (HttpServletRequest) ActionContext
					.getContext().get(ServletActionContext.HTTP_REQUEST);
			UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
					UserInfo.USER_SESSION);
			// 调用内部类
			FeedServiceThread feedServiceThread = new FeedServiceThread(obj,
					userInfo);
			feedServiceThread.start();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 定义内部类单独执行一个线程
	class FeedServiceThread extends Thread {

		private Object obj;
		private UserInfo userInfo;

		public FeedServiceThread(Object obj, UserInfo userInfo) {
			super();
			this.obj = obj;
			this.userInfo = userInfo;
		}

		@Override
		public void run() {

			System.out.println("开始记录动态.");
			Feed feed = new Feed();// 动态

			feed.setCreateTime(new Date());// 设置时间
			feed.setUserId(this.userInfo.getId());// 用户Id
			feed.setUserName(this.userInfo.getName());// 用户名

			if (this.obj instanceof Blog) {// 当类型是日志
				feed.setFeedType("blog");
				Blog blog = (Blog) this.obj;
				feed.setTitleData(blog.getTitle());
				String html = "";
				if (blog.getContent() != null
						&& blog.getContent().length() > 200) {
					// 取前200 个字符
					html = blog.getContent().substring(0, 200);
				} else if (blog.getContent() != null) {
					html = blog.getContent();
				}
				feed.setContentData(html);
				baseDao.save(feed);
			}

			// 保存用户的好友
			FeedUser feedUser = new FeedUser();
			feedUser.setFeedType("blog");
			feedUser.setFeed(feed);
			feedUser.setUserId(this.userInfo.getId());

			baseDao.save(feedUser);

			try {
			} catch (Exception e) {
				System.out.println("动态记录异常！");
				e.printStackTrace();
			}
		}
	}

}
