package com.freewebsys.sns.client;

import com.freewebsys.sns.client.image.XImages;
import com.google.gwt.core.client.GWT;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.DecoratorPanel;
import com.google.gwt.user.client.ui.FlexTable;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.Hyperlink;
import com.google.gwt.user.client.ui.Image;
import com.google.gwt.user.client.ui.VerticalPanel;

public class LeftPanel extends DecoratorPanel {

	public static final XImages images = (XImages) GWT.create(XImages.class);

	public LeftPanel() {
		VerticalPanel leftPanel = new VerticalPanel();
		leftPanel.setWidth((GWT_SNS_Main.mainWidth * 0.15) + "px");

		FlexTable layout = new FlexTable();
		layout.setCellSpacing(10);
		//设置里面单元格的距离.
		
		layout.setWidth((GWT_SNS_Main.mainWidth * 0.15) + "px");
		// layout.setBorderWidth(1);
		{// 日志菜单.
			layout.setWidget(0, 0, new Image(images.blog()));
			layout.setWidget(0, 1, getHyperlink(CenterPanel.class, "日志"));
		}
		{// 分享菜单.
			layout.setWidget(1, 0, new Image(images.share()));
			layout.setWidget(1, 1, getHyperlink(LeftPanel.class, "分享"));
		}
		{// 心情菜单.
			layout.setWidget(2, 0, new Image(images.feeling()));
			layout.setWidget(2, 1, getHyperlink(LeftPanel.class, "心情"));
		}
		{// 群组菜单.
			layout.setWidget(3, 0, new Image(images.group()));
			layout.setWidget(3, 1, getHyperlink(LeftPanel.class, "群组"));
		}
		{// 投票菜单.
			layout.setWidget(4, 0, new Image(images.vote()));
			layout.setWidget(4, 1, getHyperlink(LeftPanel.class, "投票"));
		}
		{// 礼物菜单.
			layout.setWidget(5, 0, new Image(images.gift()));
			layout.setWidget(5, 1, getHyperlink(LeftPanel.class, "礼物"));
		}
		{// 活动菜单.
			layout.setWidget(6, 0, new Image(images.activities()));
			layout.setWidget(6, 1, getHyperlink(LeftPanel.class, "活动"));
		}

		add(layout);
	}

	/**
	 * Get a {@link Hyperlink} to a section based on the name of the
	 * {@link ContentWidget} example.
	 * 
	 * @param cwClass
	 *            the {@link ContentWidget} class
	 * @param name
	 *            the name to display for the link
	 * @return a {@link Hyperlink}
	 */
	private Hyperlink getHyperlink(Class<?> cwClass, String name) {
		// Get the class name of the content widget
		String className = cwClass.getName();
		className = className.substring(className.lastIndexOf('.') + 1);
		// Convert to a hyper link
		Hyperlink link = new Hyperlink(name, className);
		//link.ensureDebugId("cwHyperlink-" + className);
		return link;
	}
}
