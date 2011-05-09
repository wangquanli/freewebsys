package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class UserInfoException extends Exception {

	public UserInfoException(String message) {
		super(message);
		System.out.println("UserInfo Exception:"+message);
	}
}
