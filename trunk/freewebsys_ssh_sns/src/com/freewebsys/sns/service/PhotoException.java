package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class PhotoException extends Exception {

	public PhotoException(String message) {
		super(message);
		System.out.println("Photo Exception:"+message);
	}
}
