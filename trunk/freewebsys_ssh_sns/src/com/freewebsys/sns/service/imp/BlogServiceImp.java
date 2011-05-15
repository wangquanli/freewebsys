package com.freewebsys.sns.service.imp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.service.CommonDaoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.pojo.Blog;
import com.freewebsys.sns.service.BlogService;
import com.freewebsys.sns.service.BlogException;
import com.freewebsys.sns.service.FeedService;
import com.freewebsys.sns.pojo.UserInfo;

public class BlogServiceImp implements BlogService {

	@Autowired
	private BaseDao baseDao;

	@Autowired
	private FeedService feedService;

	/**
	 * Blog删除
	 */
	@Override
	@Transactional
	public void deleteBlogById(Integer id) throws BlogException {
		try {
			Blog blog = (Blog) baseDao.findById(Blog.class, id);
			baseDao.delete(blog);
		} catch (Exception e) {
			throw new BlogException("Blog删除异常");
		}
	}

	/**
	 * Blog保存
	 */
	@Override
	@Transactional
	public void saveBlog(Blog blog) throws BlogException {
		try {
			blog.setCreateTime(new Date());
			blog.setCommentCount(0);
			blog.setReadCount(0);

			baseDao.save(blog);

			feedService.saveFeed(blog);
		} catch (Exception e) {
			throw new BlogException("Blog保存异常");
		}
	}

	/**
	 * Blog按ID查询
	 */
	@Override
	@Transactional
	public Blog findBlogById(Integer id) throws BlogException {
		try {
			return (Blog) baseDao.findById(Blog.class, id);
		} catch (Exception e) {
			throw new BlogException("Blog按ID查询异常");
		}
	}

	/**
	 * Blog分页
	 */
	@Override
	@Transactional
	public PageConf findBlogPageList(int start, int limit, UserInfo userInfo,
			String type) throws BlogException {
		try {
			String hql = " select module from Blog module left join fetch module.userInfo left join fetch module.blogCategory ";
			// 通用查询匹配
			if (type != null) {
				if (type.equals("friend") && userInfo != null) {
					hql += " where exists ( select friend.friend.id from Friend friend "
							+ " where friend.friend.id = module.userInfo.id and friend.userId = ? ) "
							+ " order by module.createTime desc ";
					return baseDao
							.findPage(start, limit, hql, userInfo.getId());
				} else if (type.equals("my") && userInfo != null) {
					// 查询我自己的日志
					hql += " where module.userInfo.id = ? order by module.createTime desc ";
					return baseDao
							.findPage(start, limit, hql, userInfo.getId());
				} else if (type.equals("all")) {
					//
					hql += " order by module.createTime desc ";
					return baseDao.findPage(start, limit, hql);
				} else {
					return null;
				}
			} else {
				return null;
			}
		} catch (Exception e) {
			throw new BlogException("Blog分页异常");
		}
	}

	/**
	 * Blog分页
	 */
	@Override
	@Transactional
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public PageConf findBlogPageList(int start, int limit, UserInfo userInfo,
			String type, Integer blogId) throws BlogException {
		try {
			String sql = " select temp_0.rowno from (select @rowno := @rowno + 1 as rowno , module.id as id from Blog as module "
					+ " , (select @rowno := 0 ) as t_rowno ";
			// 通用查询匹配
			if (type != null) {

				// 找到blogId所在位置
				Long indexStart = 0L;
				if (type.equals("friend") && userInfo != null) {
					sql += " and exists ( select friend.friend.id from Friend friend "
							+ " where friend.friend.id = module.userInfo.id and friend.userId = ? ) "
							+ " order by module.createTime desc ";
					System.out.println(sql);
					List<Object[]> countList = baseDao.findSql(sql, blogId);
					if (countList.iterator().hasNext()) {
						Object[] obj = countList.iterator().next();
						indexStart = (Long) obj[0];
					}
					System.out.println(indexStart);
				} else if (type.equals("my") && userInfo != null) {
					// 查询我自己的日志
					sql += " where module.userId = ? order by module.createTime desc ) as temp_0 where temp_0.id = ? ";
					System.out.println(sql);
					List<Object[]> countList = baseDao.findSql(sql,
							userInfo.getId(), blogId);
					if (countList.iterator().hasNext()) {
						Object[] obj = countList.iterator().next();
						indexStart = ((Double) obj[0]).longValue();
					}
					System.out.println(indexStart);
				} else if (type.equals("all")) {
					//
					sql += " order by module.createTime desc ) as temp_0 where temp_0.id = ? ";
					System.out.println(sql);
					List<Object[]> countList = baseDao.findSql(sql, blogId);
					if (countList.iterator().hasNext()) {
						Object[] obj = countList.iterator().next();
						indexStart = ((Double) obj[0]).longValue();
					}
					System.out.println(indexStart);
				}
				// 再次进行分页查询
				// 分页是从0开始所以-1
				// 处理第一篇文章
				return findBlogPageList(indexStart.intValue() - 1, limit,
						userInfo, type);

			} else {
				return null;
			}
		} catch (Exception e) {
			throw new BlogException("Blog分页异常");
		}
	}

	/**
	 * 查询Blog全部
	 */
	@Override
	@Transactional
	public List<Blog> findAllBlog(Map map) throws BlogException {
		try {
			String hql = " select module from Blog module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.find(hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new BlogException("查询Blog全部异常");
		}
	}

}
