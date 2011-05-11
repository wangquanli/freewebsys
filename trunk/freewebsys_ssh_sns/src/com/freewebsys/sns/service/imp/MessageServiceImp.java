package com.freewebsys.sns.service.imp;

import java.util.List;
import java.util.Map;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.service.CommonDaoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.pojo.Message;
import com.freewebsys.sns.pojo.MessageLog;
import com.freewebsys.sns.pojo.UserInfo;
import com.freewebsys.sns.service.MessageService;
import com.freewebsys.sns.service.MessageException;

public class MessageServiceImp implements MessageService {

	@Autowired
	private BaseDao baseDao;

	/**
	 * Message删除
	 */
	@Override
	@Transactional
	public void deleteMessageById(Integer id) throws MessageException {
		try {
			Message message = (Message) baseDao.findById(Message.class, id);
			baseDao.delete(message);
		} catch (Exception e) {
			throw new MessageException("Message删除异常");
		}
	}

	/**
	 * Message保存
	 */
	@Override
	@Transactional
	public void saveMessage(Message message, UserInfo fromUserInfo)
			throws MessageException {
		try {
			baseDao.save(message);// 保存信息
			String[] userIds = message.getToUserIds().split(",");
			for (String userId : userIds) {
				MessageLog messageLog = new MessageLog();
				// 设置消息Id
				messageLog.setMessageId(message.getId());
				// 设置时间
				messageLog.setCreateTime(new Date());
				// 设置用户
				messageLog.setUserId(new Integer(userId));
				// 设置阅读状态
				messageLog.setIsRead(0);
				// 设置信箱状态-收件箱
				messageLog.setStatus(3);

				baseDao.save(messageLog);
			}

			MessageLog messageLogMe = new MessageLog();
			// 设置消息Id
			messageLogMe.setMessageId(message.getId());
			// 设置时间
			messageLogMe.setCreateTime(new Date());
			// 设置我自己的发件箱
			messageLogMe.setUserId(fromUserInfo.getId());
			// 设置阅读状态已读
			messageLogMe.setIsRead(1);
			// 设置信箱状态-发件箱
			messageLogMe.setStatus(2);

			baseDao.save(messageLogMe);
		} catch (Exception e) {
			throw new MessageException("Message保存异常");
		}
	}

	/**
	 * Message按ID查询
	 */
	@Override
	@Transactional
	public Message findMessageById(Integer id) throws MessageException {
		try {
			return (Message) baseDao.findById(Message.class, id);
		} catch (Exception e) {
			throw new MessageException("Message按ID查询异常");
		}
	}

	/**
	 * Message分页
	 */
	@Override
	@Transactional
	public PageConf findMessagePageList(int start, int limit,
			UserInfo myUserInfo, String type) throws MessageException {
		try {
			if (StringUtils.isNumeric(type)) {// 判断是否是数字
				String hql = " select module from MessageLog module left join fetch module.message "
						+ " where module.parentId is null and module.userId = ? and module.status = ? ";

				// Object[]需要进行强制转换.
				return baseDao.findPage(start, limit, hql, new Object[] {
						myUserInfo.getId(), new Integer(type) });
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new MessageException("Message分页异常");
		}
	}

	/**
	 * 查询Message全部
	 */
	@Override
	@Transactional
	public List<Message> findAllMessage(Map map) throws MessageException {
		try {
			String hql = " select module from Message module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.find(hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new MessageException("查询Message全部异常");
		}
	}

	/**
	 * 按照UserIds进行查询,判断UserIds是否存在，并返回UserIds,UserNames
	 */
	@Override
	public String[] findUserByIds(String toUserIds) throws MessageException {
		if (toUserIds == null || toUserIds.equals("")) {
			return new String[] { "", "" };
		} else {
			String[] userIds = toUserIds.split(",");
			String tempIds = "";// 累加Id
			String tempNames = "";// 累加用户名

			// 是否是第一个
			boolean isFirst = true;
			for (String userId : userIds) {
				// 按照用户名称查询用户
				if (StringUtils.isNumeric(userId)) {// 判断是否是数字
					String hql = " from UserInfo module where module.id = ? ";
					UserInfo userInfo = (UserInfo) baseDao.findFirstOne(hql,
							new Integer(userId));
					if (userInfo != null) {// 如果用户存在就累加
						if (isFirst) {// 如果是第一个不添加','
							tempIds = userId;
							tempNames = userInfo.getName() + "";
							isFirst = false;
						} else {// 累加
							tempIds += "," + userId;
							tempNames += "," + userInfo.getName();
						}
					}
				}
			}
			return new String[] { tempIds, tempNames };
		}
	}

	public static void main(String[] args) {
		System.out.println(StringUtils.isNumeric("111"));
		System.out.println(StringUtils.isNumeric("111.1"));
	}
}
