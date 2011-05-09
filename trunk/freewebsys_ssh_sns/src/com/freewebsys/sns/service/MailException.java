package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class MailException extends Exception {

	public MailException(String message) {
		super(message);
		System.out.println("Photo Exception:"+message);
	}
}
