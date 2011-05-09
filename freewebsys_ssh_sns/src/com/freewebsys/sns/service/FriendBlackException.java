package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class FriendBlackException extends Exception {

	public FriendBlackException(String message) {
		super(message);
		System.out.println("FriendBlack Exception:"+message);
	}
}
