package com.freewebsys.blog;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.output.FileWriterWithEncoding;
import com.freewebsys.blog.pojo.Option;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.Dom4JDriver;

public class TestXMLConf {

	public static class TestObjType {
		private String id;
		private String name;

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
	}

	public static class TestObj {

		private String name;

		private String value;

		private TestObjType type;

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getValue() {
			return value;
		}

		public void setValue(String value) {
			this.value = value;
		}

		public TestObjType getType() {
			return type;
		}

		public void setType(TestObjType type) {
			this.type = type;
		}

	}

	/**
	 * @param args
	 * @throws IOException
	 * @throws ConfigurationException
	 */
	public static void main(String[] args) throws IOException {

		XStream xStream = new XStream(new Dom4JDriver());
		xStream.alias("TestObj", TestObj.class);
		Map<String, TestObj> list = new HashMap<String, TestObj>();
		{
			TestObj testObj = new TestObj();
			testObj.setName("aa");
			testObj.setValue("val");
			TestObjType objType = new TestObjType();
			objType.setId("1111");
			objType.setName("name001");
			testObj.setType(objType);
			list.put("0001", testObj);
		}
		{
			TestObj testObj = new TestObj();
			testObj.setName("a222a");
			testObj.setValue("<![CDATA[<value>val中文</value>]]>");
			TestObjType objType = new TestObjType();
			objType.setId("2222");
			objType.setName("name0022");
			testObj.setType(objType);
			list.put("0002", testObj);
		}
		String out = xStream.toXML(list);
		System.out.println(out);
		xStream.toXML(list, new FileWriterWithEncoding(
				new File("testconf.xml"), "utf-8"));

		Map<String, TestObj> list2 = (Map<String, TestObj>) xStream
				.fromXML(new File("testconf.xml"));
		for (Map.Entry<String, TestObj> TestObj : list2.entrySet()) {
			System.out.println(TestObj.getValue().getName() + ":"
					+ TestObj.getValue().getValue());
		}
	}
}
