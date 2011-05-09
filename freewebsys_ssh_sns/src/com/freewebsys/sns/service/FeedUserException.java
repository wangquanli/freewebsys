package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class FeedUserException extends Exception {

	public FeedUserException(String message) {
		super(message);
		System.out.println("FeedUser Exception:"+message);
	}
}
