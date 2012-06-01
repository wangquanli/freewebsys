package com.freewebsys.blog.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "blog_post_type")
public class PostType implements java.io.Serializable {

	private Long id;

	private String name;// 分类名

	private Long parentId;// 父节点

	private Integer isHome;// 是否首页

	private Long orderId;// 排序号

	public PostType() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "name", unique = false, nullable = true, length = 200)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "parent_id", unique = false, nullable = true)
	public Long getParentId() {
		return this.parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	@Column(name = "is_home", unique = false, nullable = true)
	public Integer getIsHome() {
		return this.isHome;
	}

	public void setIsHome(Integer isHome) {
		this.isHome = isHome;
	}
	
	@Column(name = "order_id", unique = false, nullable = true)
	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

}