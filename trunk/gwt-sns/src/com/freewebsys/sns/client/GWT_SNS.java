package com.freewebsys.sns.client;

import com.freewebsys.test.client.TestGWTUI_1;
import com.freewebsys.test.client.TestGWTUI_2;
import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.event.logical.shared.ValueChangeEvent;
import com.google.gwt.event.logical.shared.ValueChangeHandler;
import com.google.gwt.user.client.History;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.RootPanel;

public class GWT_SNS implements EntryPoint {

	@Override
	public void onModuleLoad() {
		GWT_SNS_Main gwtSNSMain = new GWT_SNS_Main();
		int left = (Window.getClientWidth() - gwtSNSMain.mainWidth) / 2;
		RootPanel.get().add(new GWT_SNS_Main(),left,0);
		
		
		// 创建历史记录修改时候的函数.
		final ValueChangeHandler<String> historyHandler = new ValueChangeHandler<String>() {
			public void onValueChange(ValueChangeEvent<String> event) {
				// 每次当历史记录改变的时候切换面板.
				System.out.println("得到历史记录.:\t" + event.getValue());
				if ("CenterPanel".equals(event.getValue())) {
					// 判断历史记录是否是TestGWTUI_1
					CenterPanel.layout.setWidget(0, 0, new HTML(event.getValue()));
					//直接将center panel的面板里面的元素进行修改.
					
				} else if ("TestGWTUI_2".equals(event.getValue())) {
					CenterPanel.layout.setWidget(0, 0, new HTML(event.getValue()));
					//直接将center panel的面板里面的元素进行修改.
				} else {
					CenterPanel.layout.setWidget(0, 0, new HTML(event.getValue()));
					//直接将center panel的面板里面的元素进行修改.
				}
			}
		};
		History.addValueChangeHandler(historyHandler);
		
	}
	
}
