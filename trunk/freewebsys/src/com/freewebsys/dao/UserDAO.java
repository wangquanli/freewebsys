package com.freewebsys.dao;

import java.util.List;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import com.freewebsys.common.util.EXTUtil;
import com.freewebsys.jdo.User;

public class UserDAO {

	/**
	 * 分页,查询,排序.
	 */
	public String liseUser(int start, int limit, String sort, String dir,
			User user) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String json = "";
		try {
			/************ 下面是查询总记录数. ***********/
			int size = 0;
			/** 查询最大数. */
			Query query = pm.newQuery("select count(id) from "
					+ User.class.getName());
			/** 条件查询总数. */
			query = commonListQuery(query, user);
			/** 强制转换成int */
			size = Integer.parseInt(query.execute("Smith").toString());
			/** 赋值给limit. */
			/************ 下面是查询结果集. ***********/
			if (limit > 0) {
				/** 判断limit是否是最后. */
				limit = Math.min(start + limit, size);
			}
			query = pm.newQuery(User.class);
			/** 查询添加排序.sort是排序字段.dir是顺序还是倒序. */
			if (!sort.equals("")) {
				query.setOrdering(sort + " " + dir);
			}
			/** 条件查询结果集. */
			query = commonListQuery(query, user);
			/** 设置开始和结束. */
			query.setRange(start, limit);
			List<User> results = (List<User>) query.execute("Smith");
			System.out.println("results size:[\t" + results.size());
			json = EXTUtil.toPageJSON(size, results);// 将结果转换成json格式.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pm.close();
		}
		return json;
	}

	/**
	 * 通用查询.
	 */
	private Query commonListQuery(Query query, User user) {
		if (user != null) {
			if (!"".equals(user.getLoginName())) {
				query.setFilter(" loginName == '" + user.getLoginName() + "' ");
			}
			if (!"".equals(user.getEmail()))
				query.setFilter(" email == '" + user.getEmail() + "' ");
		}
		return query;
	}

	/**
	 * 保存数据.
	 */
	public String saveUser(User user) {
		String isSuccess = "true";
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			if (user.getId() == null) {
				pm.makePersistent(user);
			} else {
				User tempUser = pm.getObjectById(User.class, user.getId());
				tempUser.setName(user.getName());
				tempUser.setEmail(user.getEmail());
				pm.makePersistent(tempUser);
			}
		} catch (Exception e) {
			isSuccess = "false";
			e.printStackTrace();
		} finally {
			pm.close();
		}
		return "{success:\"" + isSuccess + "\"}";
	}

	/**
	 * 删除多条数据.
	 */
	public String deleteUser(String ids) {
		String isSuccess = "true";
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			String[] tempIds = ids.split(",");
			if (tempIds != null) {
				for (int i = 0; i < tempIds.length; i++) {
					User user = pm.getObjectById(User.class, new Long(
							tempIds[i]));
					pm.deletePersistent(user);
				}
			}
		} catch (Exception e) {
			isSuccess = "false";
			e.printStackTrace();
		} finally {
			pm.close();
		}
		return "{success:\"" + isSuccess + "\"}";
	}

	/**
	 * 按照ID查询数据.
	 */
	public String getUser(String id) {
		String isSuccess = "true";
		PersistenceManager pm = PMF.get().getPersistenceManager();
		User user = new User();
		try {
			user = pm.getObjectById(User.class, new Long(id));
		} catch (Exception e) {
			isSuccess = "false";
			e.printStackTrace();
		} finally {
			pm.close();
		}
		return "{success:\"" + isSuccess + "\",data:"
				+ EXTUtil.toObjectJSON(user) + "}";
	}
}
