package com.freewebsys.sns.client;

import com.google.gwt.user.client.ui.DecoratedTabPanel;
import com.google.gwt.user.client.ui.DecoratorPanel;
import com.google.gwt.user.client.ui.FlexTable;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.VerticalPanel;

public class CenterPanel extends DecoratorPanel {
	
	public final static FlexTable layout = new FlexTable();
	//中心面板的布局.设置成公告函数.让其他类进行访问.

	public CenterPanel() {
		
		layout.setCellSpacing(6);
		//设置里面单元格的距离.
		layout.setWidth((GWT_SNS_Main.mainWidth * 0.85)+"px");
		//由main来进行控制.
		
		layout.setWidget(0, 0, new HTML("日志"));
		//设置标题.
		
		DecoratedTabPanel tabPanel = new DecoratedTabPanel();
		//设置面板切换.
		tabPanel.setAnimationEnabled(true);

		// Add a home tab
		HTML homeText = new HTML("标签可通过 CSS 实现高度自定义化。01");
		tabPanel.add(homeText, "好友的日志");

		// Add a tab with an image
		HTML vPanel = new HTML("标签可通过 CSS 实现高度自定义化。02");
		tabPanel.add(vPanel, "我的日志");

		// Add a tab
		HTML moreInfo = new HTML("标签可通过 CSS 实现高度自定义化。03");
		tabPanel.add(moreInfo, "大家的日志");
		
		HTML moreInfo2 = new HTML("标签可通过 CSS 实现高度自定义化。03");
		tabPanel.add(moreInfo2, "发表日志");

		// Return the content
		tabPanel.selectTab(0);
		
		tabPanel.setWidth((GWT_SNS_Main.mainWidth * 0.85 - 6 * 2)+"px");
		
		layout.setWidget(1, 0, tabPanel);
		
		
		add(layout);
	}
}
