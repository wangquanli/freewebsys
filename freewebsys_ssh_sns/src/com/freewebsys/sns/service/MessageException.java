package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class MessageException extends Exception {

	public MessageException(String message) {
		super(message);
		System.out.println("Message Exception:"+message);
	}
}
