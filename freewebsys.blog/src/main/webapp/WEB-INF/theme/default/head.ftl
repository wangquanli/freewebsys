	<!-- header Begin. -->
	<header id="branding">
			<hgroup>
				<h1 id="site-title"><span><a href="${blogPath}/index_1.html" title="test" rel="home">
					<#if options??><#if options.blogName??>${options.blogName}</#if></#if>
				</a></span></h1>
				<h2 id="site-description">
					<#if options??><#if options.blogDesc??>${options.blogDesc}</#if></#if>
				</h2>
			</hgroup>
			<form method="get" id="searchform" action="">
				<label for="s" class="assistive-text">搜索</label>
				<input type="text" class="field" name="s" id="s" placeholder="搜索">
				<input type="submit" class="submit" name="submit" id="searchsubmit" value="搜索">
			</form>
			<nav id="access">
				
				<div class="menu">
					<ul>
					<#list postTypeList as postType>
						<li class="current_page_item">
							<#if postType.isHome == 0>
								<a id="postType_${postType.id}" href="${blogPath}/type/${postType.id}/index_1.html" title="${postType.name}">${postType.name}</a>
							<#else>
								<a id="postType_0" href="${blogPath}/index_1.html" title="${postType.name}">${postType.name}</a>
							</#if>
						</li>
					</#list>
					</ul>
				</div>
			</nav><!-- #access -->
	</header>
	<!-- header End. -->