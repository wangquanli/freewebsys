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

	/**
	 * @param args
	 * @throws IOException
	 * @throws ConfigurationException
	 */
	public static void main(String[] args) throws IOException {

		XStream xStream = new XStream(new Dom4JDriver());
		xStream.alias("Option", Option.class);
		Map<String, Option> list = new HashMap<String, Option>();
		{
			Option option = new Option();
			option.setName("aa");
			option.setValue("val");
			list.put("0001", option);
		}
		{
			Option option = new Option();
			option.setName("aa");
			option.setValue("<value>val</value>");
			list.put("0002", option);
		}
		String out = xStream.toXML(list);
		System.out.println(out);
		xStream.toXML(list, new FileWriterWithEncoding(new File(
				"testconf.xml"), "utf-8"));

		Map<String, Option> list2 = (Map<String, Option>) xStream
				.fromXML(new File("testconf.xml"));
		for (Map.Entry<String, Option> option : list2.entrySet()) {
			System.out.println(option.getValue().getName() + ":"
					+ option.getValue().getValue());
		}
	}
}
