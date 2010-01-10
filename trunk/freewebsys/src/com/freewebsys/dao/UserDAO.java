package com.freewebsys.dao;

import java.util.List;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import com.freewebsys.common.util.EXTUtil;
import com.freewebsys.jdo.User;

public class UserDAO {
	public String liseUser(int start, int limit, String sort, String dir,
			User user) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String json = "";
		try {
			int size = 0;
			/** 查询最大数. */
			Query query = pm.newQuery("select count(id) from "
					+ User.class.getName());
			/** 条件查询总数. */
			if (user != null) {
				if (!"".equals(user.getName())) {
					query.setFilter(" name == '" + user.getName() + "' ");
				}
				if (!"".equals(user.getEmail()))
					query.setFilter(" email == '" + user.getEmail() + "' ");
			}
			/** 强制转换成int */
			size = Integer.parseInt(query.execute("Smith").toString());
			/** 赋值给limit. */
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
			if (user != null) {
				if (!"".equals(user.getName())) {
					query.setFilter(" name == '" + user.getName() + "' ");
				}
				if (!"".equals(user.getEmail()))
					query.setFilter(" email == '" + user.getEmail() + "' ");
			}
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
		// System.out.println("json:[" + json);
		return json;
	}

	public void saveUser(User user) {
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
			e.printStackTrace();
		} finally {
			pm.close();
		}
	}

	public void deleteUser(String ids) {
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
			e.printStackTrace();
		} finally {
			pm.close();
		}
	}

	public String getUser(String id) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		User user = new User();
		try {
			user = pm.getObjectById(User.class, new Long(id));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pm.close();
		}
		return "{success:\"true\",data:" + EXTUtil.toObjectJSON(user) + "}";
	}
}
