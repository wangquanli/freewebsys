package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class FeedTemplateException extends Exception {

	public FeedTemplateException(String message) {
		super(message);
		System.out.println("FeedTemplate Exception:"+message);
	}
}
