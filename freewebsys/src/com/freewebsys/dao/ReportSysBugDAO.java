package com.freewebsys.dao;

import java.util.Date;
import java.util.List;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import com.freewebsys.common.util.EXTUtil;
import com.freewebsys.jdo.ReportSysBug;

public class ReportSysBugDAO {

	/**
	 * 分页,查询,排序.
	 */
	public String liseReportSysBug(int start, int limit, String sort,
			String dir, ReportSysBug reportSysBug) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String json = "";
		try {
			/************ 下面是查询总记录数. ***********/
			int size = 0;
			/** 查询最大数. */
			Query query = pm.newQuery("select count(id) from "
					+ ReportSysBug.class.getName());
			/** 条件查询总数. */
			query = commonListQuery(query, reportSysBug);
			/** 强制转换成int */
			System.out.println("JDO pageSize:\t"+query.toString());
			size = Integer.parseInt(query.execute("Smith").toString());
			/** 赋值给limit. */
			/************ 下面是查询结果集. ***********/
			if (limit > 0) {
				/** 判断limit是否是最后. */
				limit = Math.min(start + limit, size);
			}
			query = pm.newQuery(ReportSysBug.class);
			/** 查询添加排序.sort是排序字段.dir是顺序还是倒序. */
			if (!sort.equals("")) {
				query.setOrdering(sort + " " + dir);
			}
			/** 条件查询结果集. */
			query = commonListQuery(query, reportSysBug);
			/** 设置开始和结束. */
			query.setRange(start, limit);
			System.out.println("JDO pageList:\t"+query.toString());
			List<ReportSysBug> results = (List<ReportSysBug>) query
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
	 * 通用查询.注意检查非字符串类型.比如Long和Date类型.
	 */
	private Query commonListQuery(Query query, ReportSysBug reportSysBug) {
		System.out.println("begin:\t" + reportSysBug);
		if (reportSysBug != null) {

			if (null != reportSysBug.getContactName()
					&& !"".equals(reportSysBug.getContactName())) {
				query.setFilter(" contactName == '"
						+ reportSysBug.getContactName() + "' ");
			}
			if (null != reportSysBug.getContactEmail()
					&& !"".equals(reportSysBug.getContactEmail())) {
				query.setFilter(" contactEmail == '"
						+ reportSysBug.getContactEmail() + "' ");
			}
			if (null != reportSysBug.getTittle()
					&& !"".equals(reportSysBug.getTittle())) {
				query.setFilter(" tittle == '" + reportSysBug.getTittle()
						+ "' ");
			}
			if (null != reportSysBug.getBugDesc()
					&& !"".equals(reportSysBug.getBugDesc())) {
				query.setFilter(" bugDesc == '" + reportSysBug.getBugDesc()
						+ "' ");
			}
			if (null != reportSysBug.getSuggest()
					&& !"".equals(reportSysBug.getSuggest())) {
				query.setFilter(" suggest == '" + reportSysBug.getSuggest()
						+ "' ");
			}
		}
		return query;
	}

	/**
	 * 保存数据.
	 */
	public String saveReportSysBug(ReportSysBug reportSysBug) {
		String isSuccess = "true";
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			if (reportSysBug.getId() == null) {
				System.out.println("[[[[" + reportSysBug);
				reportSysBug.setCreateDate(new Date());
				pm.makePersistent(reportSysBug);
			} else {
				ReportSysBug tempReportSysBug = pm.getObjectById(
						ReportSysBug.class, reportSysBug.getId());

				tempReportSysBug.setContactName(reportSysBug.getContactName());
				tempReportSysBug
						.setContactEmail(reportSysBug.getContactEmail());
				// tempReportSysBug.setCreateDate(reportSysBug.getCreateDate());
				tempReportSysBug.setTittle(reportSysBug.getTittle());
				tempReportSysBug.setBugDesc(reportSysBug.getBugDesc());
				tempReportSysBug.setSuggest(reportSysBug.getSuggest());
				pm.makePersistent(tempReportSysBug);
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
	public String deleteReportSysBug(String ids) {
		String isSuccess = "true";
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			String[] tempIds = ids.split(",");
			if (tempIds != null) {
				for (int i = 0; i < tempIds.length; i++) {
					ReportSysBug reportSysBug = pm.getObjectById(
							ReportSysBug.class, new Long(tempIds[i]));
					pm.deletePersistent(reportSysBug);
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
	public String getReportSysBug(String id) {
		String isSuccess = "true";
		PersistenceManager pm = PMF.get().getPersistenceManager();
		ReportSysBug reportSysBug = new ReportSysBug();
		try {
			reportSysBug = pm.getObjectById(ReportSysBug.class, new Long(id));
		} catch (Exception e) {
			isSuccess = "false";
			e.printStackTrace();
		} finally {
			pm.close();
		}
		return "{success:\"" + isSuccess + "\",data:"
				+ EXTUtil.toObjectJSON(reportSysBug) + "}";
	}
}
