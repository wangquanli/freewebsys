package com.freewebsys.blog.pojo;

public class Option implements java.io.Serializable, Comparable<Option> {

	private String name;// 配置名称

	private String cnName;// 配置中文名称

	private String value;// 配置值

	private String html;// web设置html代码，可以是input，select等.

	private int orderId;// 设置排序号码.

	public Option() {
	}

	/**
	 * 排序方法.
	 */
	public int compareTo(Option o) {
		// return this.orderId = o.orderId;
		if (this.orderId > o.orderId) {
			return 1;
		} else if (this.orderId < o.orderId) {
			return -1;
		} else {
			return 0;
		}
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
	}

	public String getCnName() {
		return cnName;
	}

	public void setCnName(String cnName) {
		this.cnName = cnName;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

}