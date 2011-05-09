package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class FriendGroupException extends Exception {

	public FriendGroupException(String message) {
		super(message);
		System.out.println("FriendGroup Exception:"+message);
	}
}
