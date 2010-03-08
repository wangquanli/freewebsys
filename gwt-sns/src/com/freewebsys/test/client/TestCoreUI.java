package com.freewebsys.test.client;

import com.freewebsys.core.client.SystemMessageDialog;
import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.uibinder.client.UiBinder;
import com.google.gwt.uibinder.client.UiField;
import com.google.gwt.uibinder.client.UiHandler;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.Composite;
import com.google.gwt.user.client.ui.Widget;

public class TestCoreUI extends Composite {

	private static TestCoreUIUiBinder uiBinder = GWT
			.create(TestCoreUIUiBinder.class);

	interface TestCoreUIUiBinder extends UiBinder<Widget, TestCoreUI> {
	}


	public TestCoreUI() {
		initWidget(uiBinder.createAndBindUi(this));
		button01.setText("测试弹出alert()");
		button02.setText("测试弹出confirm()");
		button03.setText("测试弹出prompt()");
		button01.setText("测试弹出alert()");
	}

	@UiField
	Button button01;
	@UiHandler("button01")
	void onClickButton1(ClickEvent e) {
		SystemMessageDialog.alert("测试信息.",new SystemMessageDialog.OnButtonAlert() {
			@Override
			public void alertEvent() {
				Window.alert("弹出成功");
			}
		});
	}
	
	@UiField
	Button button02;
	@UiHandler("button02")
	void onClickButton2(ClickEvent e) {
		SystemMessageDialog.confirm("测试信息.",new SystemMessageDialog.OnButtonConfirm() {
			@Override
			public void confirmEvent(boolean yesOrNo) {
				Window.alert(""+yesOrNo);
			}
		});
	}
	
	@UiField
	Button button03;
	@UiHandler("button03")
	void onClickButton3(ClickEvent e) {
		SystemMessageDialog.prompt("测试信息.",new SystemMessageDialog.OnButtonPrompt() {
			
			@Override
			public void promptEvent(String value) {
				Window.alert(""+value);
			}
		});
	}

}
