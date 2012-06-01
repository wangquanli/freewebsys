package com.freewebsys.blog.rss;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;

import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

/**
 * http://www.javaworld.com/javaworld/jw-11-2007/jw-11-rome.html
 */
public class TestRssRead {

	/**
	 * @param args
	 * @throws IOException
	 * @throws FeedException
	 * @throws IllegalArgumentException
	 */
	public static void main(String[] args) throws IllegalArgumentException,
			FeedException, IOException {
		// http://tech.163.com/mobile/special/001144R8/mobile163.xml
		URL url = new URL(
				"http://tech.163.com/mobile/special/001144R8/mobile163.xml");
		XmlReader reader = null;

		try {

			reader = new XmlReader(url);
			SyndFeed feed = new SyndFeedInput().build(reader);
			System.out.println("Feed Title: " + feed.getAuthor());

			for (Iterator i = feed.getEntries().iterator(); i.hasNext();) {
				SyndEntry entry = (SyndEntry) i.next();
				System.out.println(entry.getTitle());
			}
		} finally {
			if (reader != null)
				reader.close();
		}
	}

}
