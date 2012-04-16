package com.freewebsys.blog.dao.impl;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.beans.BeanUtils;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.freewebsys.blog.dao.BaseDao;
import com.freewebsys.blog.page.PageConf;

/**
 * className: BaseSSHDAO.java
 * 
 * description: 基础dao.包括对数据的查询.分页.配合标签在页面使用.
 * 
 * @author toeoso time: 2010-12-18
 */
public class HibernateBaseDao extends HibernateDaoSupport implements BaseDao {

	public void save(Object instance) {
		try {
			// 保存或更新
			getHibernateTemplate().saveOrUpdate(instance);

		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(Object instance) {
		try {
			getHibernateTemplate().delete(instance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	@SuppressWarnings("rawtypes")
	public List find(String hql, Object... values) {
		try {
			return getHibernateTemplate().find(hql, values);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Object[]> findSql(final String sql, final Object... values) {
		return getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {

				Connection conn = null;
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				List<Object[]> list = new ArrayList<Object[]>();
				try {
					conn = session.connection();
					preparedStatement = conn.prepareStatement(sql);
					for (int i = 0; values != null && i < values.length; i++) {
						// 设置value参数
						preparedStatement.setObject(i + 1, values[i]);
					}
					resultSet = preparedStatement.executeQuery();
					// System.out.println("get"
					// + resultSet.getMetaData().getColumnCount());
					// resultSet.getMetaData().getColumnCount()
					// 是查询的时候输入参数的数量如select id,name
					while (resultSet != null && resultSet.next()) {
						// 循环查询出数据记录
						Object[] column = new Object[resultSet.getMetaData()
								.getColumnCount()];
						for (int i = 0; i < resultSet.getMetaData()
								.getColumnCount(); i++) {
							// 循环列
							column[i] = resultSet.getObject(i + 1);
						}
						// 将列添加到list
						list.add(column);
					}
				} catch (Exception e) {
					System.out.println("sql查询异常" + e.getMessage());
				} finally {
					if (resultSet != null) {
						try {
							resultSet.close();
						} catch (Exception e) {
						}
					}
					if (preparedStatement != null) {
						try {
							preparedStatement.close();
						} catch (Exception e) {
						}
					}
					if (conn != null) {
						try {// 关闭连接
							conn.close();
						} catch (Exception e) {
						}
					}
				}
				return list;
			}
		});
	}

	/**
	 * 查询分页。
	 */
	public PageConf findPage(int start, int limit, String hql, Object... values) {
		try {
			String countQueryString = " select count (module) "
					+ removeSelect(removeOrders(hql));
			// 查询总数
			int total = ((Long) findFirstOne(countQueryString, values))
					.intValue();
			// System.out.println("page size:" + total);
			PageConf pageConf = new PageConf(start, limit, total);
			if (start >= total) {// 如果跳转的页数超出总页数跳到最后一页
				pageConf.getLast();
			}
			if (start <= 0) {// 如果跳转的页数为负数或0,跳转到首页
				pageConf.getFirst();
			}
			Query query = createQuery(hql, values);
			List list = query.setFirstResult((int) pageConf.getStart())
					.setMaxResults((int) pageConf.getLimit()).list();
			// 将数据放到pageConf
			pageConf.setData(list);
			return pageConf;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 查询一个数据
	 */
	public Object findById(Class clz, Serializable id) {
		try {
			return getHibernateTemplate().get(clz, id);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	/**
	 * 查询第一个数据
	 */
	public Object findFirstOne(String hql, Object... values) {
		Object obj = null;
		try {
			Query query = createQuery(hql, values);
			// 查询第一个数据.
			List list = query.setFirstResult(0).setMaxResults(1).list();
			if (list.iterator().hasNext()) {
				obj = list.iterator().next();
			}
		} catch (RuntimeException re) {
			throw re;
		}
		return obj;
	}

	public List findByMaxResults(int maxResults, String hql, Object... values) {
		Query query = createQuery(hql, values);
		return query.setMaxResults(maxResults).list();
	}

	/**
	 * 私有方法
	 */
	private Query createQuery(String hql, Object[] values) {
		Query query = getSession().createQuery(hql);
		for (int i = 0; values != null && i < values.length; i++) {
			query.setParameter(i, values[i]);
		}
		return query;
	}

	/**
	 * 除去select方法
	 */
	private String removeSelect(String hql) {
		int beginPos = hql.toLowerCase().indexOf("from");
		// 去除掉左查询语句
		return hql.substring(beginPos).replaceAll(
				"left\\s*join\\s*fetch\\s*[\\w|\\.]*", "");
	}

	/**
	 * 私有方法 去除排序
	 */
	private String removeOrders(String hql) {
		Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*",
				Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(hql);
		StringBuffer sb = new StringBuffer();
		while (m.find()) {
			m.appendReplacement(sb, "");
		}
		m.appendTail(sb);
		return sb.toString();
	}

}