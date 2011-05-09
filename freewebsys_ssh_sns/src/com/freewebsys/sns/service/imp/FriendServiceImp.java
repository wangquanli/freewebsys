package com.freewebsys.sns.service.imp;

import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.service.CommonDaoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import com.freewebsys.sns.pojo.Friend;
import com.freewebsys.sns.service.FriendService;
import com.freewebsys.sns.service.FriendException;
import com.freewebsys.sns.pojo.UserInfo;

public class FriendServiceImp implements FriendService {

	@Autowired
	private BaseDao baseDao;

	/**
	 * Friend删除
	 */
	@Override
	@Transactional
	public void deleteFriendById(Integer userId, Integer friendId)
			throws FriendException {
		try {
			String hql = " from Friend friend where friend.userId = ? and friend.friend.id = ?";
			Friend friend = (Friend) baseDao
					.findFirstOne(hql, userId, friendId);
			baseDao.delete(friend);
		} catch (Exception e) {
			throw new FriendException("Friend删除异常");
		}
	}

	/**
	 * Friend保存
	 */
	@Override
	@Transactional
	public void saveFriend(Friend friend) throws FriendException {
		try {

			String hql = " from Friend friend where friend.userId = ? and friend.friend.id = ? ";
			Friend friendTemp = (Friend) baseDao.findFirstOne(hql,
					friend.getUserId(), friend.getFriend().getId());
			if (friendTemp == null) {// 特殊情况会提交2次。就记录一次数据。
				friend.setCreateTime(new Date());
				friend.setStatus(0);
				baseDao.save(friend);
			}
		} catch (Exception e) {
			throw new FriendException("Friend保存异常");
		}
	}

	/**
	 * Friend按ID查询
	 */
	@Override
	@Transactional
	public Friend findFriendById(Integer id) throws FriendException {
		try {
			return (Friend) baseDao.findById(Friend.class, id);
		} catch (Exception e) {
			throw new FriendException("Friend按ID查询异常");
		}
	}

	/**
	 * Friend分页
	 */
	@Override
	@Transactional
	public PageConf findFriendPageList(int start, int limit, Map map)
			throws FriendException {

		try {
			UserInfo userInfo = (UserInfo) map.get("userInfo");
			map.remove("userInfo");
			String hql = " select module from UserInfo module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			PageConf pageConf = baseDao.findPage(start, limit, hql,
					(Object[]) values[1]);
			if (pageConf != null && pageConf.getData() != null) {
				List list = pageConf.getData();
				for (int i = 0; i < list.size(); i++) {
					UserInfo friendUser = (UserInfo) list.get(i);
					System.out.println(userInfo.getId() + "/"
							+ friendUser.getId());
					String hql_2 = "select friend.status from Friend friend where friend.userId = ? and friend.friend.id = ? ";
					Integer status = (Integer) baseDao.findFirstOne(hql_2,
							userInfo.getId(), friendUser.getId());
					friendUser.setMyFriendState(status);
					System.out.println(status);
				}
			}
			return pageConf;
		} catch (Exception e) {
			throw new FriendException("Friend分页异常");
		}
	}

	/**
	 * Friend分页
	 */
	@Override
	@Transactional
	public PageConf findMyFriendPageList(int start, int limit, Map map)
			throws FriendException {
		try {
			String hql = " select module from Friend module left join fetch module.friend ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.findPage(start, limit, hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new FriendException("Friend分页异常");
		}
	}

	/**
	 * 查询Friend全部
	 */
	@Override
	@Transactional
	public List<Friend> findAllFriend(Map map) throws FriendException {
		try {
			String hql = " select module from Friend module ";
			// 通用查询匹配
			Object[] values = CommonDaoUtil.commonQuery(map);
			hql += values[0].toString();
			// Object[]需要进行强制转换.
			return baseDao.find(hql, (Object[]) values[1]);
		} catch (Exception e) {
			throw new FriendException("查询Friend全部异常");
		}
	}

	@Override
	public int findIsFriend(Integer userId, Integer friendId) {
		String hql = " from Friend friend where friend.userId = ? and friend.friend.id = ?";
		Friend friend = (Friend) baseDao.findFirstOne(hql, userId, friendId);
		if (friend == null || friend.getStatus() == null) {
			return -1;
		} else {
			return friend.getStatus().intValue();
		}
	}

}
