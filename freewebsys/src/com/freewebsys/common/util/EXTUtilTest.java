package com.freewebsys.common.util;

import static org.junit.Assert.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.junit.Test;
import com.freewebsys.jdo.User;

public class EXTUtilTest {

	@Test
	public void testPageSize() {
		System.out.println("only test.");
	}

	@Test
	public void testPageList() {

	}

	@Test
	public void testDeleteObjectByIds() {

	}

	@Test
	public void testToPageJSON() {
		List<User> list = new ArrayList<User>();
		{
			User user = new User();
			user.setId(1234L);
			user.setEmail("testEmail");
			user.setCreateDate(new Date());
			user.setLoginName("abcdefg");
			list.add(user);
		}
		{
			User user = new User();
			user.setId(1234L);
			user.setEmail("testEmail");
			user.setCreateDate(new Date());
			user.setLoginName("abcdefg");
			list.add(user);
		}
		{
			User user = new User();
			user.setId(1234L);
			user.setEmail("testEmail");
			user.setCreateDate(new Date());
			user.setLoginName("abcdefg");
			list.add(user);
		}
		System.out.println(EXTUtil.toPageJSON(1,list));
	}

	@Test
	public void testToObjectJSON() {
		User user = new User();
		user.setId(1234L);
		user.setEmail("testEmail");
		user.setCreateDate(new Date());
		user.setLoginName("abcdefg");
		System.out.println(EXTUtil.toObjectJSON(user));
		user.setCreateDate(null);
		System.out.println(EXTUtil.toObjectJSON(user));
	}

}
