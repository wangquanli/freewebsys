package com.freewebsys.blog.template;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static freemarker.template.ObjectWrapper.DEFAULT_WRAPPER;

import com.freewebsys.blog.common.GlobalConf;
import com.freewebsys.blog.dao.BaseDao;
import com.freewebsys.blog.pojo.Post;

import freemarker.core.Environment;
import freemarker.template.Template;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 使用自定义 模板 <@PostList limit=10 type=all page=true> ${status.isLast}
 * ${status.index}....${post.id} .. ${post.title} </@PostList>
 */
public class PostListDirective implements TemplateDirectiveModel {

	// 数据库查询dao。
	private BaseDao baseDao;
	// 生成分页的时候使用的模板.
	private Template temp;

	public PostListDirective(Template temp, BaseDao baseDao) {
		super();
		this.baseDao = baseDao;
		this.temp = temp;
	}

	public void execute(Environment env, Map params, TemplateModel[] model,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		int limit = 10;// 默认10条记录.
		try {// 会有异常
			limit = Integer.parseInt(params.get("limit").toString());
		} catch (Exception e) {
		}
		boolean page = false;// 默认不分页.
		try {// 会有异常
			page = Boolean.parseBoolean(params.get("page").toString());
		} catch (Exception e) {
		}

		if (!page) {// 如果不分页.查询 limit
			String hql = " from Post post where post.status = 1 order by post.createDate desc ";
			List<Post> postList = baseDao.findByMaxResults(limit, hql);
			IteratorStatus.StatusState state = new IteratorStatus.StatusState();

			for (int i = 0; i < postList.size(); i++) {
				Post post = postList.get(i);
				if (i == (postList.size() - 1)) {// 设置最后一页.
					state.setLast(true);
				}
				// 设置变量
				env.setVariable("status",
						DEFAULT_WRAPPER.wrap(new IteratorStatus(state)));
				env.setVariable("post", DEFAULT_WRAPPER.wrap(post));
				body.render(env.getOut());
				// 迭代器往后.
				state.next();

				String prevUrl = null;
				String nextUrl = null;
				if (i != 0) {
					// 前一个url.
					Post postTemp = postList.get(i - 1);
					prevUrl = postTemp.getUrl();
				}
				if (i != (postList.size() - 1)) {
					// 后一个url.
					Post postTemp = postList.get(i + 1);
					nextUrl = postTemp.getUrl();
				}
				Map<String, Object> rootPost = new HashMap<String, Object>();
				rootPost.put("prevUrl", prevUrl);
				rootPost.put("nextUrl", nextUrl);
				// 使用自定义模板postList
				rootPost.put("post", post);
				rootPost.put("DateParse", new DateParseDirective());
				rootPost.put("blogPath", GlobalConf.BLOG_PATH);

				// 生成每一个文章.
				CommonTemplateService.genPostByTemplate(baseDao, rootPost);
			}
		}

	}

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

}
