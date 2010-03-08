package com.freewebsys.sns.client;

import com.google.gwt.user.client.ui.Composite;
import com.google.gwt.user.client.ui.DecoratorPanel;
import com.google.gwt.user.client.ui.FlexTable;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HasHorizontalAlignment;
import com.google.gwt.user.client.ui.HasVerticalAlignment;
import com.google.gwt.user.client.ui.FlexTable.FlexCellFormatter;

public class GWT_SNS_Main extends Composite {
	
	public static int mainWidth = 800; 
	//定义公告的宽度变量.
	/**
	 * 
	 */
	public GWT_SNS_Main() {
		//
		FlexTable layout = new FlexTable();
		layout.setCellSpacing(6);
		layout.setWidth(mainWidth+"px");
		FlexCellFormatter cellFormatter = layout.getFlexCellFormatter();
		//layout.setBorderWidth(1);
		
	    
	    cellFormatter.setColSpan(0, 0, 2);
	    //将第一行合并成一行.
	    cellFormatter.setHorizontalAlignment(0, 1,
	    		HasHorizontalAlignment.ALIGN_CENTER);
	    //设置第一行的对齐是.中心对齐.
		layout.setWidget(0, 0, new TopPanel());
		
		//设置面板中间的部分.中间的部分是包括一个左菜单.和一个center.
		cellFormatter.setWidth(1, 0, (mainWidth * 0.15 )+"px" );
		cellFormatter.setWidth(1, 1, (mainWidth * 0.85 )+"px" );
		cellFormatter.setHorizontalAlignment(1, 0,
				HasHorizontalAlignment.ALIGN_CENTER);
		cellFormatter.setVerticalAlignment(1, 0,
				HasVerticalAlignment.ALIGN_TOP);
		cellFormatter.setHorizontalAlignment(1, 1,
				HasHorizontalAlignment.ALIGN_CENTER);
		cellFormatter.setVerticalAlignment(1, 1,
				HasVerticalAlignment.ALIGN_TOP);
		
		
		layout.setWidget(1, 0, new LeftPanel());
		layout.setWidget(1, 1, new CenterPanel());
		initWidget(layout);

	}

}
