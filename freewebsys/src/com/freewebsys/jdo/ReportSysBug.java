package com.freewebsys.jdo;

import java.io.Serializable;
import java.util.Date;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@SuppressWarnings("serial")
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class ReportSysBug implements Serializable {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.SEQUENCE)
	private Long id;

	@Persistent
	private String contactName;

	@Persistent
	private String contactEmail;

	@Persistent
	private Date createDate;

	@Persistent
	private String tittle;

	@Persistent
	private String bugDesc;

	@Persistent
	private String suggest;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getTittle() {
		return tittle;
	}

	public void setTittle(String tittle) {
		this.tittle = tittle;
	}

	public String getSuggest() {
		return suggest;
	}

	public void setSuggest(String suggest) {
		this.suggest = suggest;
	}

	public String getBugDesc() {
		return bugDesc;
	}

	public void setBugDesc(String bugDesc) {
		this.bugDesc = bugDesc;
	}

	@Override
	public String toString() {
		return "ReportSysBug [bugDesc=" + bugDesc + ", contactEmail="
				+ contactEmail + ", contactName=" + contactName
				+ ", createDate=" + createDate + ", id=" + id + ", suggest="
				+ suggest + ", tittle=" + tittle + "]";
	}
	

}
