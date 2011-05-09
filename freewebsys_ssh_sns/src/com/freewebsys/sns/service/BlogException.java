package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class BlogException extends Exception {

	public BlogException(String message) {
		super(message);
		System.out.println("Blog Exception:"+message);
	}
}
