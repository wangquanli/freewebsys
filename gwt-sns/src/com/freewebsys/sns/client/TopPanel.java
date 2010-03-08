package com.freewebsys.sns.client;


import com.freewebsys.sns.client.image.XImages;
import com.google.gwt.core.client.GWT;
import com.google.gwt.uibinder.client.UiBinder;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.ui.DecoratorPanel;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.Image;
import com.google.gwt.user.client.ui.MenuBar;
import com.google.gwt.user.client.ui.MenuItem;
import com.google.gwt.user.client.ui.Widget;

public class TopPanel extends DecoratorPanel {
	
	
	public static final XImages images = (XImages) GWT.create(XImages.class);
	public static int logoWith = 160;
	public TopPanel() {
		HorizontalPanel top = new HorizontalPanel();
		top.setStyleName("");
		top.setVerticalAlignment(HorizontalPanel.ALIGN_BOTTOM);
		top.add(new Image(images.logo()));
		//添加顶部logo.
		
		
		MenuBar menu = new MenuBar();
	    menu.setAutoOpen(true);
	    menu.setWidth((GWT_SNS_Main.mainWidth - logoWith + 17) +"px");
	    //menu.setStyleName("gwt_sns_main_top_panel_menu");
	    menu.setAnimationEnabled(true);

	    // Create a sub menu of recent documents
	   
	    menu.addItem("   首页       ",new MenuBar());
	    menu.addSeparator();
	    
	    //添加个人空间菜单.
	    MenuBar recentDocsMenu = new MenuBar(true);
	    recentDocsMenu.setTitle("abc");
	    for(int i = 0; i < 3; i ++){
	    	MenuItem item = new MenuItem("abc"+i, new Command() {
				@Override
				public void execute() {
					// TODO Auto-generated method stub
				}
			});
	    	recentDocsMenu.addItem(item);
	    }
	    menu.addItem("   个人空间      ",recentDocsMenu);
	    menu.addSeparator();
	    
	    menu.addItem("   好友      ",new MenuBar(false));
	    menu.addSeparator();
	    
	    menu.addItem("   消息     ",new MenuBar(false));
	    menu.addSeparator();
	    
	    menu.addItem("   管理     ",new MenuBar(false));
	    menu.addSeparator();
	    
	    menu.addItem("   邀请     ",new MenuBar(false));
	    menu.addSeparator();
	    
	    menu.addItem("   帐号     ",new MenuBar(false));
	    menu.addSeparator();
	    
	    menu.addItem("   退出     ",new MenuBar(false));
	    menu.addSeparator();

	    // Create the file menu
	    MenuBar fileMenu = new MenuBar(true);
	    

	    // Create the edit menu
	    MenuBar editMenu = new MenuBar(true);
	    

	    
		top.add(menu);
		add(top);
	}
}
