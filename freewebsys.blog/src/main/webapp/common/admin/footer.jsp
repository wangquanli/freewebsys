<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--底部 分页 开始-->


<div id="footer">
	<p id="footer-left" class="alignleft">
		<span id="footer-thankyou">感谢使用 <a
			href="http://freewebsys.com/">FreeWebSys Blog</a>系统
		</span>
	</p>
	<p id="footer-upgrade" class="alignright">0.0.1 版本</p>
	<div class="clear"></div>
</div>


<!-- 顶部黑色导航条 开始-->
<div id="wpadminbar">
	<div class="quicklinks">
		<ul id="wp-admin-bar-root-default" class="ab-top-menu">
			<li id="wp-admin-bar-site-name" class="menupop"><a
				class="ab-item" href="/"
				target="_blank">freewebsys首页</a></li>
			<li id="wp-admin-bar-new-content" class="menupop"><a
				class="ab-item" href="javascript:$('#show_create').toggle();"
				title=""><span class="ab-icon"></span><span class="ab-label">新建</span></a>
				<div class="ab-sub-wrapper" id="show_create">
					<ul id="wp-admin-bar-new-content-default" class="ab-submenu">
						<li id="wp-admin-bar-new-post" class=""><a class="ab-item"
							href="/admin/addPost.do">文章</a></li>
						<li id="wp-admin-bar-new-link" class=""><a class="ab-item"
							href="/admin/addLink.do">链接</a></li>
					</ul>
				</div></li>
		</ul>
		<ul id="wp-admin-bar-top-secondary"
			class="ab-top-secondary ab-top-menu">
			<li id="wp-admin-bar-my-account" class="menupop with-avatar"><a
				class="ab-item" href="${ctx}/admin/userLogout.do"
				title="退出系统">退出系统</a></li>
			<li id="wp-admin-bar-my-account" class="menupop with-avatar"><a
				class="ab-item" href="#"
				title="我的账户">您好，admin</a></li>
		</ul>
	</div>
</div>
<!-- 顶部黑色导航条 结束-->