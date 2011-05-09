package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class FeedException extends Exception {

	public FeedException(String message) {
		super(message);
		System.out.println("Feed Exception:"+message);
	}
}
