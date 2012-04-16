package com.freewebsys.blog.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.freewebsys.blog.common.GlobalConf;
import com.freewebsys.blog.page.PageConf;
import com.freewebsys.blog.pojo.UserInfo;
import com.freewebsys.blog.service.UserInfoService;

@Controller
public class UserInfoController extends BaseController {

	@Resource(name = "userInfoService")
	protected UserInfoService userInfoService;

	private static final int limit = 10;

	/**
	 * 用户登录页面
	 */
	@RequestMapping(value = "/admin/userLogin", method = RequestMethod.GET)
	public String userLoginGet(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("userInfoAttribute", new UserInfo());
		return "/admin/userInfo/userInfoLogin";
	}

	/**
	 * 用户登录action.
	 */
	@RequestMapping(value = "/admin/userLogin", method = RequestMethod.POST)
	public String userLoginPost(HttpServletRequest request,
			@ModelAttribute("userInfoAttribute") UserInfo userInfo,
			HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("userInfoAttribute", new UserInfo());

		if (StringUtils.isEmpty(userInfo.getLoginName())
				|| StringUtils.isEmpty(userInfo.getPasswd())) {// 如果用户名密码是空.
			model.addAttribute("errorMsg",
					"\u8bf7\u8f93\u5165\u7528\u6237\u540d\u5bc6\u7801.");
			return "/admin/userInfo/userInfoLogin";
		}
		UserInfo userInfoTemp = userInfoService.getUserInfoByLogin(
				userInfo.getLoginName(), userInfo.getPasswd());

		if (userInfoTemp == null) {
			model.addAttribute("errorMsg",
					"\u7528\u6237\u540d\u5bc6\u7801\u9519\u8bef.");
			return "/admin/userInfo/userInfoLogin";
		} else {
			request.getSession()
					.setAttribute(GlobalConf.USER_SESSION, userInfo);
			// 跳转到。管理后台首页
			return "redirect:/admin/userMain.do";
		}

	}

	/**
	 * 登出
	 */
	@RequestMapping(value = "/admin/userLogout")
	public String userLogout(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("userInfoAttribute", new UserInfo());
		model.addAttribute("infoMsg", "\u60a8\u5df2\u767b\u51fa\u3002");
		return "/admin/userInfo/userInfoLogin";
	}

	/**
	 * 管理后台首页
	 */
	@RequestMapping(value = "/admin/userMain")
	public String userMain(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("userInfoAttribute", new UserInfo());
		model.addAttribute("infoMsg", "\u60a8\u5df2\u767b\u51fa\u3002");
		return "/admin/userInfo/userInfoMain";
	}

	/**
	 * addUserInfo
	 */
	@RequestMapping(value = "/admin/addUserInfo")
	public String addUserInfo(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "id", required = false) Long id,
			ModelMap model) throws Exception {
		if (id != null) {
			UserInfo userInfo = userInfoService.findUserInfoById(id);
			model.addAttribute("userInfoAttribute", userInfo);
		} else {
			model.addAttribute("userInfoAttribute", new UserInfo());
		}
		return "/admin/userInfo/userInfoForm";
	}

	/**
	 * saveUserInfo
	 */
	@RequestMapping(value = "/admin/saveUserInfo", method = RequestMethod.POST)
	public String saveUserInfo(HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("userInfoAttribute") UserInfo userInfo,
			ModelMap model) throws Exception {
		// save or update userInfo.
		if (userInfo != null) {
			userInfoService.saveUserInfo(userInfo);
		}
		return "redirect:/admin/listUserInfo.do";
	}

	/**
	 * deleteUserInfo
	 */
	@RequestMapping(value = "/admin/deleteUserInfo")
	public String deleteUserInfo(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "id", required = true) Long id, ModelMap model)
			throws Exception {
		// save or update userInfo.
		userInfoService.deleteUserInfoById(id);
		return "redirect:/admin/listUserInfo.do";
	}

	/**
	 * listUserInfo
	 */
	@RequestMapping(value = "/admin/listUserInfo")
	public String listUserInfo(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "start", required = false) Integer start,
			ModelMap model) throws Exception {
		if (start == null) {
			start = 0;
		}
		PageConf pageConf = userInfoService.findUserInfoPageList(start, limit,
				null);

		model.addAttribute("pageConf", pageConf);
		model.addAttribute("start", start);
		return "/admin/userInfo/userInfoList";
	}

}
