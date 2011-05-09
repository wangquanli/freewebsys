package com.freewebsys.sns.service;

@SuppressWarnings("serial")
public class PhotoAlbumException extends Exception {

	public PhotoAlbumException(String message) {
		super(message);
		System.out.println("PhotoAlbum Exception:"+message);
	}
}
