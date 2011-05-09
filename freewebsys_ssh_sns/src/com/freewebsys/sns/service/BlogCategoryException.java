package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class BlogCategoryException extends Exception {

	public BlogCategoryException(String message) {
		super(message);
		System.out.println("BlogCategory Exception:"+message);
	}
}
