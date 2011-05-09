package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class MiniException extends Exception {

	public MiniException(String message) {
		super(message);
		System.out.println("Mini Exception:"+message);
	}
}
