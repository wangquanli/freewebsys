<#list commentList as comment>
<li class="comment even thread-even depth-1">
	<article class="comment">
		<footer class="comment-meta">
			<div class="comment-author vcard">
				<span style="color:#90D5D5;font-weight: bold;">${comment.authorName}</span>在
				<time>${DateParse(comment.createDate,'yyyy-MM-dd HH:mm:ss')}</time><span class="says">说：</span>
			</div>
		</footer>
		<div class="comment-content"><p>${comment.content}</p></div>
	</article><!-- #comment-## -->
</li>
</#list>