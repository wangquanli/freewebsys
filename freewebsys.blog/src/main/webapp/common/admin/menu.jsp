<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	//设置action url.
	pageContext.setAttribute("requestUri",
			request.getAttribute("javax.servlet.forward.request_uri"));
%>
<!-- 左侧菜单 开始-->
<div id="adminmenuback"></div>
<div id="adminmenuwrap">
	<ul id="adminmenu">

		<li class="wp-not-current-submenu wp-menu-separator"><div
				class="separator"></div></li>

		<li class="wp-has-submenu wp-has-current-submenu wp-menu-open"
			id="menu-posts">
			<div class="wp-menu-image">
				<a><br></a>
			</div>
			<div class="wp-menu-arrow">
				<div></div>
			</div> <a href="#"
			class="wp-has-submenu wp-has-current-submenu wp-menu-open menu-top">首页</a>
			<div class="wp-submenu">
				<div class="wp-submenu-wrap">
					<ul>
						<li
							class="wp-first-item <c:if test="${requestUri == '/admin/userMain.do'}">current</c:if>"><a
							href="/admin/userMain.do"
							class="wp-first-item <c:if test="${requestUri == '/admin/userMain.do'}">current</c:if>">欢迎页</a></li>
					</ul>
				</div>
			</div>
		</li>

		<li class="wp-has-submenu wp-has-current-submenu wp-menu-open"
			id="menu-posts">
			<div class="wp-menu-image">
				<a><br></a>
			</div>
			<div class="wp-menu-arrow">
				<div></div>
			</div> <a href="#"
			class="wp-has-submenu wp-has-current-submenu wp-menu-open menu-top">文章</a>
			<div class="wp-submenu">
				<div class="wp-submenu-wrap">
					<ul>
						<li
							class="wp-first-item <c:if test="${requestUri == '/admin/userMain.do?id=2'}">current</c:if>"><a
							href="/admin/userMain.do?id=2"
							class="wp-first-item <c:if test="${requestUri == '/admin/userMain2.do?id=2'}">current</c:if>">欢迎页</a></li>
					</ul>
				</div>
			</div>
		</li>

		<li class="wp-has-submenu wp-has-current-submenu wp-menu-open"
			id="menu-posts">
			<div class="wp-menu-image">
				<a><br></a>
			</div>
			<div class="wp-menu-arrow">
				<div></div>
			</div> <a href="#"
			class="wp-has-submenu wp-has-current-submenu wp-menu-open menu-top">用户管理</a>
			<div class="wp-submenu">
				<div class="wp-submenu-wrap">
					<ul>
						<li
							class="wp-first-item <c:if test="${requestUri == '/admin/addUserInfo.do'}">current</c:if>"><a
							href="/admin/addUserInfo.do"
							class="wp-first-item <c:if test="${requestUri == '/admin/addUserInfo.do'}">current</c:if>">新增用户列</a></li>
						<li
							class="wp-first-item <c:if test="${requestUri == '/admin/listUserInfo.do'}">current</c:if>"><a
							href="/admin/listUserInfo.do"
							class="wp-first-item <c:if test="${requestUri == '/admin/listUserInfo.do'}">current</c:if>">用户列表管理</a></li>
					</ul>
				</div>
			</div>
		</li>
		
		<li class="wp-has-submenu wp-has-current-submenu wp-menu-open"
			id="menu-posts">
			<div class="wp-menu-image">
				<a><br></a>
			</div>
			<div class="wp-menu-arrow">
				<div></div>
			</div> <a href="#"
			class="wp-has-submenu wp-has-current-submenu wp-menu-open menu-top">系统配置</a>
			<div class="wp-submenu">
				<div class="wp-submenu-wrap">
					<ul>
						<li
							class="wp-first-item <c:if test="${requestUri == '/admin/listOption.do'}">current</c:if>"><a
							href="/admin/listOption.do"
							class="wp-first-item <c:if test="${requestUri == '/admin/listOption.do'}">current</c:if>">系统配置</a></li>
					</ul>
				</div>
			</div>
		</li>

		<li class="wp-not-current-submenu wp-menu-separator"><div
				class="separator"></div></li>

	</ul>
</div>
<!-- 左侧菜单 结束 -->