package com.freewebsys.dao;

import java.util.Date;
import java.util.List;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import com.freewebsys.common.util.EXTUtil;
import com.freewebsys.jdo.SystemUser;

public class SystemUserDAO {

	/**
	 * 分页,查询,排序.
	 */
	public String liseSystemUser(int start, int limit, String sort, String dir,
			SystemUser systemUser) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String json = "";
		try {
			/************ 下面是查询总记录数. ***********/
			int size = 0;
			/** 查询最大数. */
			Query query = pm.newQuery("select count(id) from "
					+ SystemUser.class.getName());
			/** 条件查询总数. */
			query = commonListQuery(query, systemUser);
			/** 强制转换成int */
			size = Integer.parseInt(query.execute("Smith").toString());
			/** 赋值给limit. */
			/************ 下面是查询结果集. ***********/
			if (limit > 0) {
				/** 判断limit是否是最后. */
				limit = Math.min(start + limit, size);
			}
			query = pm.newQuery(SystemUser.class);
			/** 查询添加排序.sort是排序字段.dir是顺序还是倒序. */
			if (!sort.equals("")) {
				query.setOrdering(sort + " " + dir);
			}
			/** 条件查询结果集. */
			query = commonListQuery(query, systemUser);
			/** 设置开始和结束. */
			query.setRange(start, limit);
			List<SystemUser> results = (List<SystemUser>) query
					.execute("Smith");
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
	private Query commonListQuery(Query query, SystemUser systemUser) {
		if (systemUser != null) {

			if (!"".equals(systemUser.getLoginName())) {
				query.setFilter(" loginName == '" + systemUser.getLoginName()
						+ "' ");
			}
			if (!"".equals(systemUser.getPasswd())) {
				query.setFilter(" passwd == '" + systemUser.getPasswd() + "' ");
			}
			if (!"".equals(systemUser.getName())) {
				query.setFilter(" name == '" + systemUser.getName() + "' ");
			}
			if (!"".equals(systemUser.getPhone())) {
				query.setFilter(" phone == '" + systemUser.getPhone() + "' ");
			}
			if (!"".equals(systemUser.getEmail())) {
				query.setFilter(" email == '" + systemUser.getEmail() + "' ");
			}
			/**
			 * if (!"".equals(systemUser.getCreateDate())) {
			 * query.setFilter(" createDate == '" + systemUser.getCreateDate() +
			 * "' "); }
			 */
			if (!"".equals(systemUser.getIslock())) {
				query.setFilter(" islock == '" + systemUser.getIslock() + "' ");
			}
			if (!"".equals(systemUser.getLoginTimes())) {
				query.setFilter(" loginTimes == '" + systemUser.getLoginTimes()
						+ "' ");
			}
			if (!"".equals(systemUser.getLastLogin())) {
				query.setFilter(" lastLogin == '" + systemUser.getLastLogin()
						+ "' ");
			}
		}
		return query;
	}

	/**
	 * 保存数据.
	 */
	public String saveSystemUser(SystemUser systemUser) {
		String isSuccess = "true";
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			if (systemUser.getId() == null) {
				systemUser.setCreateDate(new Date());
				pm.makePersistent(systemUser);
			} else {
				SystemUser tempSystemUser = pm.getObjectById(SystemUser.class,
						systemUser.getId());
				tempSystemUser.setLoginName(systemUser.getLoginName());
				tempSystemUser.setPasswd(systemUser.getPasswd());
				tempSystemUser.setName(systemUser.getName());
				tempSystemUser.setPhone(systemUser.getPhone());
				tempSystemUser.setEmail(systemUser.getEmail());
				tempSystemUser.setIslock(systemUser.getIslock());
				tempSystemUser.setLoginTimes(systemUser.getLoginTimes());
				tempSystemUser.setLastLogin(systemUser.getLastLogin());
				pm.makePersistent(tempSystemUser);
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
	public String deleteSystemUser(String ids) {
		String isSuccess = "true";
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			String[] tempIds = ids.split(",");
			if (tempIds != null) {
				for (int i = 0; i < tempIds.length; i++) {
					SystemUser systemUser = pm.getObjectById(SystemUser.class,
							new Long(tempIds[i]));
					pm.deletePersistent(systemUser);
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
	public String getSystemUser(String id) {
		String isSuccess = "true";
		PersistenceManager pm = PMF.get().getPersistenceManager();
		SystemUser systemUser = new SystemUser();
		try {
			systemUser = pm.getObjectById(SystemUser.class, new Long(id));
		} catch (Exception e) {
			isSuccess = "false";
			e.printStackTrace();
		} finally {
			pm.close();
		}
		return "{success:\"" + isSuccess + "\",data:"
				+ EXTUtil.toObjectJSON(systemUser) + "}";
	}
}
