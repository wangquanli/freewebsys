package com.freewebsys.blog.template;

import java.io.IOException;
import java.util.Map;

import static freemarker.template.ObjectWrapper.DEFAULT_WRAPPER;

import com.freewebsys.blog.dao.BaseDao;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

public class ArticleDirective implements TemplateDirectiveModel {

	
	// 数据库查询dao。
	private BaseDao baseDao;
	
	
	public ArticleDirective(BaseDao baseDao) {
		super();
		this.baseDao = baseDao;
	}

	public void execute(Environment arg0, Map arg1, TemplateModel[] arg2,
			TemplateDirectiveBody arg3) throws TemplateException, IOException {
		
	}

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

}
