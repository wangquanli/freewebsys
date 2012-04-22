package com.freewebsys.blog.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.freewebsys.blog.dao.BaseDao;
import com.freewebsys.blog.page.PageConf;
import com.freewebsys.blog.pojo.Option;
import com.freewebsys.blog.service.OptionService;

public class OptionServiceImp implements OptionService {

	@Autowired
	private BaseDao baseDao;

	private static Log log = LogFactory.getLog(OptionServiceImp.class);

	/**
	 * Option保存
	 */
	@Transactional
	public void saveOption(Option option) throws Exception {
		log.info("saveOption：" + option);
		try {
			baseDao.save(option);
		} catch (Exception e) {
			log.info("Option保存异常");
			e.printStackTrace();
		}
	}

	/**
	 * 查询Option全部
	 */
	@Transactional
	public Map<String, Option> findAllOption() throws Exception {
		log.info("findAllOption：");
		try {
			String hql = " select module from Option module ";
			List<Option> tempList = baseDao.find(hql);

			// 作为数字返回值.
			Map<String, Option> tempMap = new HashMap<String, Option>();

			for (Option option : tempList) {
				if (option != null && option.getName() != null) {
					// 将名字作为key
					tempMap.put(option.getName(), option);
				}
			}
			return tempMap;
		} catch (Exception e) {
			log.info("查询Option全部异常");
			e.printStackTrace();
		}
		return null;
	}

}
