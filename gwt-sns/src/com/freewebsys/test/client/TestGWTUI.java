package com.freewebsys.test.client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.event.logical.shared.ValueChangeEvent;
import com.google.gwt.event.logical.shared.ValueChangeHandler;
import com.google.gwt.user.client.History;
import com.google.gwt.user.client.ui.FlexTable;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.Hyperlink;
import com.google.gwt.user.client.ui.Image;
import com.google.gwt.user.client.ui.LazyPanel;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.TreeItem;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.client.ui.Widget;

public class TestGWTUI implements EntryPoint {

	class ContentWidget extends LazyPanel {

		@Override
		protected Widget createWidget() {
			// TODO Auto-generated method stub
			return null;
		}

	}

	@Override
	public void onModuleLoad() {
		// TODO Auto-generated method stub
		final FlexTable layout = new FlexTable();
		layout.setCellSpacing(6);
		layout.setWidth("260px");
		// layout.setBorderWidth(1);

		// 创建历史记录修改时候的函数.
		final ValueChangeHandler<String> historyHandler = new ValueChangeHandler<String>() {
			public void onValueChange(ValueChangeEvent<String> event) {
				// 每次当历史记录改变的时候切换面板.
				System.out.println("得到历史记录.:\t" + event.getValue());
				if ("TestGWTUI_1".equals(event.getValue())) {
					// 判断历史记录是否是TestGWTUI_1
					layout.setWidget(0, 0, new TestGWTUI_1());
				} else if ("TestGWTUI_2".equals(event.getValue())) {
					// 判断历史记录是否是TestGWTUI_2
					layout.setWidget(0, 0, new TestGWTUI_2());
				} else {
					layout.setWidget(0, 0, new HTML("程序初始化..."));
				}
			}
		};
		History.addValueChangeHandler(historyHandler);
		// 添加历史记录.

		// 添加面板.
		layout.setWidget(1, 0, getHyperlink(TestGWTUI_1.class, "测试.1"));
		layout.setWidget(2, 0, getHyperlink(TestGWTUI_2.class, "测试.1"));
		RootPanel.get().add(layout);
	}

	private Hyperlink getHyperlink(Class<?> cwClass, String name) {
		// Get the class name of the content widget
		String className = cwClass.getName();
		className = className.substring(className.lastIndexOf('.') + 1);
		// Convert to a hyper link
		Hyperlink link = new Hyperlink(name, className);
		// link.ensureDebugId("cwHyperlink-" + className);
		return link;
	}
}
