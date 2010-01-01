package com.freewebsys.dao;

import java.util.List;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import com.freewebsys.jdo.User;

public class UserDAO {
	public String liseUser(int start, int limit) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String xml = "";
		try {
			int size = 0;
			/** 查询最大数. */
			Query query = pm.newQuery("select count(id) from "
					+ User.class.getName());
			/** 强制转换成int */
			size = Integer.parseInt(query.execute("Smith").toString());
			/** 赋值给limit. */
			if (limit > 0) {
				/** 判断limit是否是最后. */
				limit = Math.min(start + limit, size);
			}
			/** 查询结果集. */
			query = pm.newQuery(User.class);
			/** 查询添加排序. */
			query.setRange(start, limit);
			/** 设置开始和结束. */
			List<User> results = (List<User>) query.execute("Smith");
			System.out.println(results.size());
			xml = toPageJSON(size, results);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pm.close();
		}
		System.out.println("json:[" + xml);
		return xml;
	}

	private String toPageJSON(int size, List<User> results) {
		StringBuffer json = new StringBuffer();
		// 将返回数据拼接成一个json的分页格式.
		json.append("{\"results\":\"");
		json.append(size);
		json.append("\",\"items\":[");
		for (int i = 0; i < results.size(); i++) {
			json.append(toObjectJSON(results.get(i)));
			if ((i + 1) != results.size()) {/* 不是最后一个.添加逗号. */
				json.append(",");
			}
		}
		json.append("]}");
		return json.toString();
	}

	private String toObjectJSON(User user) {
		StringBuffer json = new StringBuffer();
		json.append("{");
		json.append("\"id\":" + "\"" + user.getId() + "\",");
		json.append("\"name\":" + "\"" + user.getName() + "\",");
		json.append("\"email\":" + "\"" + user.getEmail() + "\"");
		json.append("}");
		return json.toString();
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
					User user = pm.getObjectById(User.class, new Long(tempIds[i]));
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
		return toObjectJSON(user);
	}
}
