package com.freewebsys.sns.service;

public interface MailService {

	public void systemSendMail(String toUser, String subject, String text);

	public void sendMail(String toUser, String fromUser, String subject,
			String text);
}
