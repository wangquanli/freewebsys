<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- 左侧菜单 开始-->
<div id="adminmenuback"></div>
<div id="adminmenuwrap">
	<ul id="adminmenu">

		<li class="wp-not-current-submenu wp-menu-separator"><div
				class="separator"></div></li>
		<li
			class="wp-has-submenu wp-has-current-submenu wp-menu-open open-if-no-js menu-top menu-icon-post menu-top-first"
			id="menu-posts">
			<div class="wp-menu-image">
				<a
					href="./文章 ‹ freewebsys — WordPress_files/文章 ‹ freewebsys — WordPress.htm"><br></a>
			</div>
			<div class="wp-menu-arrow">
				<div></div>
			</div>
			<a
			href="./文章 ‹ freewebsys — WordPress_files/文章 ‹ freewebsys — WordPress.htm"
			class="wp-has-submenu wp-has-current-submenu wp-menu-open open-if-no-js menu-top menu-icon-post menu-top-first"
			tabindex="1">文章</a>
			<div class="wp-submenu">
				<div class="wp-submenu-wrap">
					<div class="wp-submenu-head">文章</div>
					<ul>
						<li class="wp-first-item current"><a
							href="./文章 ‹ freewebsys — WordPress_files/文章 ‹ freewebsys — WordPress.htm"
							class="wp-first-item current" tabindex="1">所有文章</a></li>
						<li><a href="http://127.0.0.1/wp-admin/post-new.php"
							tabindex="1">写文章</a></li>
						<li><a
							href="http://127.0.0.1/wp-admin/edit-tags.php?taxonomy=category"
							tabindex="1">分类目录</a></li>
						<li><a
							href="http://127.0.0.1/wp-admin/edit-tags.php?taxonomy=post_tag"
							tabindex="1">标签</a></li>
					</ul>
				</div>
			</div>
		</li>

		<li
			class="wp-has-submenu wp-not-current-submenu menu-top menu-icon-media"
			id="menu-media">
			<div class="wp-menu-image">
				<a href="http://127.0.0.1/wp-admin/upload.php"><br></a>
			</div>
			<div class="wp-menu-arrow">
				<div></div>
			</div>
			<a href="http://127.0.0.1/wp-admin/upload.php"
			class="wp-has-submenu wp-not-current-submenu menu-top menu-icon-media"
			tabindex="1" aria-haspopup="true">媒体</a>
			<div class="wp-submenu">
				<div class="wp-submenu-wrap">
					<div class="wp-submenu-head">媒体</div>
					<ul>
						<li class="wp-first-item"><a
							href="http://127.0.0.1/wp-admin/upload.php" class="wp-first-item"
							tabindex="1">媒体库</a></li>
						<li><a href="http://127.0.0.1/wp-admin/media-new.php"
							tabindex="1">添加</a></li>
					</ul>
				</div>
			</div>
		</li>

		<li class="wp-not-current-submenu wp-menu-separator"><div
				class="separator"></div></li>

		<li id="collapse-menu" class="hide-if-no-js"><div
				id="collapse-button">
				<div></div>
			</div>
			<span>收起菜单</span></li>
	</ul>
</div>
<!-- 左侧菜单 结束 -->