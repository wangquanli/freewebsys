package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class UserVisitorException extends Exception {

	public UserVisitorException(String message) {
		super(message);
		System.out.println("UserVisitor Exception:"+message);
	}
}
