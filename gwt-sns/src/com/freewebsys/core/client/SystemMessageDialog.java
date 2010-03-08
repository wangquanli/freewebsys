package com.freewebsys.core.client;

import com.freewebsys.core.client.image.XImages;
import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.FlexTable;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HasHorizontalAlignment;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.Image;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.FlexTable.FlexCellFormatter;

public class SystemMessageDialog extends DialogBox {

	public static final XImages images = (XImages) GWT.create(XImages.class);

	// 取消按钮.都是进行关闭操作的.

	public interface OnButtonAlert {
		void alertEvent();
	}

	public interface OnButtonConfirm {
		void confirmEvent(boolean yesOrNo);
	}

	public interface OnButtonPrompt {
		void promptEvent(String value);
	}

	public interface OnButtonInfo {
		void info();
	}

	public SystemMessageDialog(String title) {
		setText(title);
		setGlassEnabled(true);
		setAnimationEnabled(false);
		// setPixelSize(300, 150);
	}

	private static FlexTable getCommonLayout(int showType, String msg) {

		FlexTable layout = new FlexTable();
		layout.setCellSpacing(6);
		layout.setWidth("260px");
		// layout.setBorderWidth(1);
		switch (showType) {
			case 0:
				layout.setWidget(0, 0, new Image(images.warning()));
				break;
			case 1:
				layout.setWidget(0, 0, new Image(images.question()));
				break;
			case 2:
				layout.setWidget(0, 0, new Image(images.question()));
				break;
		}

		layout.setWidget(0, 1, new HTML(msg));
		FlexCellFormatter cellFormatter = layout.getFlexCellFormatter();
		cellFormatter.setHorizontalAlignment(0, 1,
				HasHorizontalAlignment.ALIGN_CENTER);
		cellFormatter.setColSpan(1, 0, 2);
		cellFormatter.setColSpan(2, 0, 2);
		cellFormatter.setWidth(0, 0, "15%");
		cellFormatter.setWidth(0, 1, "85%");
		cellFormatter.setHorizontalAlignment(1, 0,
				HasHorizontalAlignment.ALIGN_CENTER);
		cellFormatter.setHorizontalAlignment(2, 0,
				HasHorizontalAlignment.ALIGN_CENTER);
		return layout;
	}

	public static void alert(String msg, final OnButtonAlert callback) {
		final SystemMessageDialog dialog = new SystemMessageDialog("提示窗口.");

		FlexTable layout = getCommonLayout(0, msg);
		// 得到通用的布局.

		HorizontalPanel buttonPanel = new HorizontalPanel();
		// 添加button布局.
		buttonPanel.setHorizontalAlignment(HorizontalPanel.ALIGN_CENTER);

		Button okButton = new Button("确定");
		okButton.addClickHandler(new ClickHandler() {
			@Override
			public void onClick(ClickEvent event) {
				callback.alertEvent();
				dialog.hide();
			}
		});

		buttonPanel.add(okButton);

		// 设置成中心对齐.
		layout.setWidget(1, 0, buttonPanel);

		dialog.add(layout);
		dialog.center2();
		dialog.show();

	}

	public static void confirm(String msg, final OnButtonConfirm callback) {
		final SystemMessageDialog dialog = new SystemMessageDialog("提示窗口.");

		FlexTable layout = getCommonLayout(1, msg);
		// 得到通用的布局.

		HorizontalPanel buttonPanel = new HorizontalPanel();
		// 添加button布局.
		buttonPanel.setHorizontalAlignment(HorizontalPanel.ALIGN_CENTER);

		Button yesButton = new Button("&nbsp;是&nbsp;");
		yesButton.addClickHandler(new ClickHandler() {
			@Override
			public void onClick(ClickEvent event) {
				callback.confirmEvent(true);
				dialog.hide();
			}
		});
		Button noButton = new Button("&nbsp;否&nbsp;");
		noButton.addClickHandler(new ClickHandler() {
			@Override
			public void onClick(ClickEvent event) {
				callback.confirmEvent(false);
				dialog.hide();
			}
		});

		buttonPanel.add(yesButton);
		buttonPanel.add(new HTML("&nbsp;&nbsp;&nbsp;"));
		buttonPanel.add(noButton);

		// 设置成中心对齐.
		layout.setWidget(1, 0, buttonPanel);

		dialog.add(layout);
		dialog.center2();
		dialog.show();

	}

	public static void prompt(String msg, final OnButtonPrompt callback) {
		final SystemMessageDialog dialog = new SystemMessageDialog("提示窗口.");

		FlexTable layout = getCommonLayout(2, msg);
		// 得到通用的布局.
		final TextBox textBox = new TextBox();
		layout.setWidget(1, 0, textBox);
		HorizontalPanel buttonPanel = new HorizontalPanel();
		// 添加button布局.
		buttonPanel.setHorizontalAlignment(HorizontalPanel.ALIGN_CENTER);

		Button okButton = new Button("确定");
		okButton.addClickHandler(new ClickHandler() {
			@Override
			public void onClick(ClickEvent event) {
				callback.promptEvent(textBox.getValue());
				dialog.hide();
			}
		});

		Button cancelButton = new Button("取消");
		cancelButton.addClickHandler(new ClickHandler() {
			@Override
			public void onClick(ClickEvent event) {
				dialog.hide();
			}
		});
		buttonPanel.add(okButton);
		buttonPanel.add(new HTML("&nbsp;&nbsp;&nbsp;"));
		buttonPanel.add(cancelButton);

		// 设置成中心对齐.
		layout.setWidget(2, 0, buttonPanel);

		dialog.add(layout);
		dialog.center2();
		dialog.show();
	}

	public static void info(String msg, final OnButtonInfo callback) {
		final SystemMessageDialog dialog = new SystemMessageDialog("提示窗口.");

		FlexTable layout = getCommonLayout(0, msg);
		// 得到通用的布局.

		HorizontalPanel buttonPanel = new HorizontalPanel();
		// 添加button布局.
		buttonPanel.setHorizontalAlignment(HorizontalPanel.ALIGN_CENTER);

		Button okButton = new Button("确定");
		okButton.addClickHandler(new ClickHandler() {
			@Override
			public void onClick(ClickEvent event) {
				callback.info();
			}
		});

		Button cancelButton = new Button("取消");
		cancelButton.addClickHandler(new ClickHandler() {
			@Override
			public void onClick(ClickEvent event) {
				dialog.hide();
			}
		});
		buttonPanel.add(okButton);
		buttonPanel.add(new HTML("&nbsp;&nbsp;&nbsp;"));
		buttonPanel.add(cancelButton);

		// 设置成中心对齐.
		layout.setWidget(1, 0, buttonPanel);

		dialog.add(layout);
		dialog.center2();
		dialog.show();
	}

	public void center2() {
		int left = (Window.getClientWidth() - 260) / 2;
		int top = (Window.getClientHeight() - 260) / 2;
		setPopupPosition(Math.max(Window.getScrollLeft() + left, 0), Math.max(
				Window.getScrollTop() + top, 0));
	}
}
