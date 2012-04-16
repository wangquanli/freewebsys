package com.freewebsys.blog.dao;

import java.io.Serializable;
import java.util.List;
import com.freewebsys.blog.page.PageConf;

public interface BaseDao {

	/**
	 * 保存
	 */
	public void save(Object instance);

	/**
	 * 删除
	 */
	public void delete(Object instance);

	/**
	 * 查找
	 */
	public List find(String hql, Object... values);

	/**
	 * 使用 sql 查询
	 */
	public List<Object[]> findSql(String sql, Object... values);

	/**
	 * 查询分页
	 */
	public PageConf findPage(int start, int limit, String hql, Object... values);

	/**
	 * 按id查询
	 */
	public Object findById(Class clz, Serializable id);

	/**
	 * 查询第一个
	 */
	public Object findFirstOne(String hql, Object... values);

	/**
	 * 查询最大
	 */
	public List findByMaxResults(int maxResults, String hql, Object... values);

}