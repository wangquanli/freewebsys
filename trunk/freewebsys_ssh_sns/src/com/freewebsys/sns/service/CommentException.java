package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class CommentException extends Exception {

	public CommentException(String message) {
		super(message);
		System.out.println("Blog Exception:"+message);
	}
}
