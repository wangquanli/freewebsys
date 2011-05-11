package com.freewebsys.sns.service.imp;

import java.util.List;
import java.util.Map;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.service.CommonDaoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.pojo.Mini;
import com.freewebsys.sns.service.MiniService;
import com.freewebsys.sns.service.MiniException;
import com.freewebsys.sns.pojo.UserInfo;

public class MiniServiceImp implements MiniService {

	@Autowired
	private BaseDao baseDao;

	/**
	 * Mini删除
	 */
	@Override
	@Transactional
	public void deleteMiniById(Integer id) throws MiniException {
		try {
			Mini mini = (Mini) baseDao.findById(Mini.class, id);
			baseDao.delete(mini);
		} catch (Exception e) {
			throw new MiniException("Mini删除异常");
		}
	}

	/**
	 * Mini保存
	 */
	@Override
	@Transactional
	public void saveMini(Mini mini) throws MiniException {
		try {
			// <img src='/sns/common/js/kindeditor/plugins/emoticons/5.gif'
			// alt='' border='0'/>
			HttpServletRequest request = ServletActionContext.getRequest();

			mini.setContent(mergeSmell(request.getContextPath(),
					mini.getContent()));
			// 设置评论数量
			mini.setCommentCount(0);
			mini.setFeedId(0);
			mini.setCreateTime(new Date());
			baseDao.save(mini);
		} catch (Exception e) {
			throw new MiniException("Mini保存异常");
		}
	}

	private static final String strBegin = "{img";
	private static final String strEnd = "}";

	/**
	 * 替换字符串
	 */
	public static String mergeSmell(String ctx, String str) {
		String strImgBegin = "<img src='" + ctx
				+ "/common/js/kindeditor/plugins/emoticons/";
		String strImgEnd = ".gif' alt='' border='0'/>";
		if (str == null) {
			str = "";
		} else {
			// 内容的 ##[id]##进行查找
			while (StringUtils.substringBetween(str, strBegin, strEnd) != null) {
				// 取得中间字符串
				String numberStr = StringUtils.substringBetween(str, strBegin,
						strEnd);
				// 替换字符串重新继续循环
				str = str.replace(strBegin + numberStr + strEnd, strImgBegin
						+ numberStr + strImgEnd);
 				//str = str.substring(str.indexOf(strImgBegin + numberStr
				//		+ strImgEnd) + 1);
			}
		}
		return str;
	}

	/**
	 * Mini按ID查询
	 */
	@Override
	@Transactional
	public Mini findMiniById(Integer id) throws MiniException {
		try {
			return (Mini) baseDao.findById(Mini.class, id);
		} catch (Exception e) {
			throw new MiniException("Mini按ID查询异常");
		}
	}

	/**
	 * Mini分页
	 */
	@Override
	@Transactional
	public PageConf findMiniPageList(int start, int limit, UserInfo userInfo,
			String type) throws MiniException {
		try {
			String hql = " select module from Mini module left join fetch module.userInfo ";
			// 通用查询匹配
			if (type != null && userInfo != null) {
				if (type.equals("friend")) {
					hql += " where exists ( select friend.friend.id from Friend friend "
							+ " where friend.friend.id = module.userInfo.id and friend.userId = ? ) "
							+ " order by module.createTime desc ";
					return baseDao
							.findPage(start, limit, hql, userInfo.getId());
				} else if (type.equals("my")) {
					// 查询我自己的日志
					hql += " where module.userInfo.id = ? order by module.createTime desc ";
					return baseDao
							.findPage(start, limit, hql, userInfo.getId());
				} else if (type.equals("all")) {
					//
					hql += " order by module.createTime desc ";
					return baseDao.findPage(start, limit, hql);
				} else {
					return null;
				}
			} else {
				return null;
			}
		} catch (Exception e) {
			throw new MiniException("Mini分页异常");
		}
	}

	/**
	 * 查询Mini全部
	 */
	@Override
	@Transactional
	public List<Mini> findAllMini(Map map) throws MiniException {
		try {
			String hql = " select module from Mini module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.find(hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new MiniException("查询Mini全部异常");
		}
	}

}
