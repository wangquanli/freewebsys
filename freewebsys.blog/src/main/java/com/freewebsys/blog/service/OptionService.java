package com.freewebsys.blog.service;

import java.util.List;
import java.util.Map;
import java.util.Date;
import com.freewebsys.blog.page.PageConf;
import com.freewebsys.blog.pojo.Option;

public interface OptionService {
	/**
	 * @Description: 保存
	 */
	void saveOption(List<Option> optionList) throws Exception;

	/**
	 * @Description: 查询全部
	 */
	List<Option> findAllOption() throws Exception;

	/**
	 * @Description: 更新系统配置文件.
	 */
	void updateGlobalConf() throws Exception;
}
