package com.freewebsys.sns.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import com.freewebsys.sns.service.MailService;

public class MailServiceImp implements MailService {

	@Autowired
	private JavaMailSender javaMailSender;

	@Override
	public void systemSendMail(String toUser, String subject, String text) {
		// 调用内部类
		MailServiceThread mailServiceThread = new MailServiceThread(toUser,
				"test_mail@163.com", subject, text);
		mailServiceThread.start();
	}

	@Override
	public void sendMail(String toUser, String fromUser, String subject,
			String text) {
		// 调用内部类
		MailServiceThread mailServiceThread = new MailServiceThread(toUser,
				fromUser, subject, text);
		mailServiceThread.start();
	}

	// 定义内部类单独执行一个线程
	class MailServiceThread extends Thread {
		private String toUser;
		private String fromUser;
		private String subject;
		private String text;

		public MailServiceThread(String toUser, String fromUser,
				String subject, String text) {
			super();
			this.toUser = toUser;
			this.fromUser = fromUser;
			this.subject = subject;
			this.text = text;
		}

		@Override
		public void run() {
			System.out.println("开始发送邮件");
			SimpleMailMessage mail = new SimpleMailMessage(); 
			// 注意SimpleMailMessage只能用来发送text格式的邮件

			try {
				mail.setTo(toUser);// 接受者
				mail.setFrom(fromUser);// 发送者,这里还可以另起Email别名，不用和xml里的username一致
				mail.setSubject(subject);// 主题
				mail.setText(text);// 邮件内容
				javaMailSender.send(mail);
			} catch (Exception e) {
				System.out.println("发送邮件异常！");
				e.printStackTrace();
			}
		}
	}
}
