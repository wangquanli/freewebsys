package com.freewebsys.blog.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "blog_link")
public class Link implements java.io.Serializable {

	private Long id;
	
    private String url;// 链接
    
    private String name;//名称
    
    private String target;//打开方式
    
    private String description;//描述
    
    private Integer visible;//展示
    
    private Integer orderId;//排序号
    

	public Link() {
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
	
	
	@Column(name = "url", unique = false, nullable = true, length = 200)
	public String getUrl() {
        return this.url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
	@Column(name = "name", unique = false, nullable = true, length = 200)
	public String getName() {
        return this.name;
    }
    public void setName(String name) {
        this.name = name;
    }
	@Column(name = "target", unique = false, nullable = true, length = 200)
	public String getTarget() {
        return this.target;
    }
    public void setTarget(String target) {
        this.target = target;
    }
	@Column(name = "description", unique = false, nullable = true, length = 200)
	public String getDescription() {
        return this.description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
	@Column(name = "visible", unique = false, nullable = true, length = 200)
	public Integer getVisible() {
        return this.visible;
    }
    public void setVisible(Integer visible) {
        this.visible = visible;
    }
	@Column(name = "order_id", unique = false, nullable = true, length = 200)
	public Integer getOrderId() {
        return this.orderId;
    }
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }
	
}