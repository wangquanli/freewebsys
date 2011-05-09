package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class FriendException extends Exception {

	public FriendException(String message) {
		super(message);
		System.out.println("Friend Exception:"+message);
	}
}
