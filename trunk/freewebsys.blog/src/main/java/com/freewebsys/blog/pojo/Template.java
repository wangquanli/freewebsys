package com.freewebsys.blog.pojo;

public class Template implements java.io.Serializable {

	private Long id;

	private String name;// name

	private String path;// 路径

	private String content;// 内容

	public Template() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "Template [id=" + id + ", name=" + name + ", path=" + path + "]";
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}