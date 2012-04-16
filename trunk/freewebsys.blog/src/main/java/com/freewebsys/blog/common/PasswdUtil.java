package com.freewebsys.blog.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswdUtil {

	private static String KEY = "SHA";// 使用SHA 比MD5更安全.

	/**
	 * 密码 SHA(Secure Hash Algorithm，安全散列算法）， 数字签名等密码学应用中重要的工具，被广泛地应用于电子商务等信息安全领域
	 * 。虽然，SHA与MD5通过碰撞法都被破解了， 但是SHA仍然是公认的安全加密算法，较之MD5更为安全。
	 */
	public static String crypt(String str) {
		byte[] btInput = str.getBytes();
		MessageDigest mdInst = null;
		try {
			mdInst = MessageDigest.getInstance(KEY);
		} catch (NoSuchAlgorithmException e) {
			System.out.println("NoSuchAlgorithmException");
			e.printStackTrace();
			return "";
		}
		mdInst.update(btInput);
		byte[] md = mdInst.digest();
		StringBuffer sb = new StringBuffer();
		for (byte i = 0; i < md.length; i++) {
			int val = ((int) md[i]) & 0xff;
			if (val < 16)
				sb.append("0");
			sb.append(Integer.toHexString(val));
		}
		return sb.toString();
	}

	public static void main(String[] args) {
		System.out.println(crypt("111111"));
	}
}
