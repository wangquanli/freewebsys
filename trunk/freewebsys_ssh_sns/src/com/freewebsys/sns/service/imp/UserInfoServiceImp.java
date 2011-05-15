package com.freewebsys.sns.service.imp;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;
import com.freewebsys.core.dao.BaseDao;
import com.freewebsys.core.page.PageConf;
import com.freewebsys.core.service.CommonDaoUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.freewebsys.sns.service.MailService;
import com.freewebsys.sns.pojo.UserInfo;
import com.freewebsys.sns.service.UserInfoService;
import com.freewebsys.sns.service.UserInfoException;

public class UserInfoServiceImp implements UserInfoService {

	@Autowired
	private BaseDao baseDao;

	@Autowired
	private MailService mailService;

	/**
	 * UserInfo保存
	 */
	@Override
	@Transactional
	public UserInfo saveUserRegister(UserInfo userInfo)
			throws UserInfoException {
		try {

			UserInfo userInfoTemp = findUserInfoByEmail(userInfo.getEmail());
			if (userInfoTemp != null) {// 已经保存的数据
				System.out.println("重复提交数据！" + userInfo.getEmail());
				return userInfoTemp;
			}
			userInfo.setPasswd(md5(userInfo.getPasswd()));// 将密码设置MD5加密
			userInfo.setActive(0);// 帐号未激活
			userInfo.setActiveCode(md5(userInfo.getEmail()));// 用帐号作MD5加密做激活码
			baseDao.save(userInfo);// 保存用户
			String content = "恭喜您注册成功。<br/>"
					+ "<a href='http://www.freewebsys.com/activeUser.htm?ac="
					+ userInfo.getActiveCode() + "'>激活帐号</a>";
			// System.out.println(content);

			mailService.systemSendMail(userInfo.getEmail(), content, "code");// 发送邮件
			return userInfo;
		} catch (Exception e) {
			throw new UserInfoException("UserInfo保存异常");
		}
	}

	/**
	 * UserInfo按ID查询
	 */
	@Override
	@Transactional
	public UserInfo findUserInfoById(Integer id) throws UserInfoException {
		try {
			return (UserInfo) baseDao.findById(UserInfo.class, id);
		} catch (Exception e) {
			throw new UserInfoException("UserInfo按ID查询异常");
		}
	}

	/**
	 * UserInfo按email查询
	 */
	@Override
	@Transactional
	public UserInfo findUserInfoByEmail(String email) throws UserInfoException {
		try {
			String hql = "from UserInfo userInfo where userInfo.email = ? ";
			return (UserInfo) baseDao.findFirstOne(hql, email);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new UserInfoException("UserInfo按email查询异常");
		}
	}

	/**
	 * UserInfo按email和密码查询
	 */
	@Override
	public UserInfo findUserInfoByEmailPasswd(String email, String passwd)
			throws UserInfoException {
		try {
			String hql = "from UserInfo userInfo where userInfo.email = ? and userInfo.passwd = ? ";
			return (UserInfo) baseDao.findFirstOne(hql, email, md5(passwd));
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new UserInfoException("UserInfo按email,密码查询异常");
		}
	}

	/**
	 * 通过激活码激活帐号
	 */
	@Override
	public UserInfo saveActiveUser(String ac) {
		try {
			String hql = " from UserInfo userInfo where userInfo.activeCode = ? ";
			UserInfo userInfo = (UserInfo) baseDao.findFirstOne(hql, ac);
			if (userInfo != null) {
				userInfo.setActive(1);// 激活帐号
				baseDao.save(userInfo);
				// 成功激活帐号
			}
			return userInfo;
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * MD5生成密码
	 */
	public final static String md5(String str) {
		byte[] btInput = str.getBytes();
		MessageDigest mdInst = null;
		try {
			mdInst = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			System.out.println("NoSuchAlgorithmException:md5");
			e.printStackTrace();
			return "";
		}
		mdInst.update(btInput);
		byte[] md = mdInst.digest();
		StringBuffer sb = new StringBuffer();
		for (byte i = 0; i < md.length; i++) {
			int val = ((int) md[i]) & 0xff;
			if (val < 16)
				sb.append("0");
			sb.append(Integer.toHexString(val));
		}
		return sb.toString();
	}

}
