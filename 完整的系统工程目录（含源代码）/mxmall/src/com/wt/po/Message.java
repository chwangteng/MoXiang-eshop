package com.wt.po;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Message entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "message", catalog = "mxmall")
public class Message implements java.io.Serializable {

	// Fields

	private Integer messageid;
	private Product product;
	private User user;
	private Timestamp messagetime;
	private String messagecontent;

	// Constructors

	/** default constructor */
	public Message() {
	}

	/** full constructor */
	public Message(Product product, User user, Timestamp messagetime,
			String messagecontent) {
		this.product = product;
		this.user = user;
		this.messagetime = messagetime;
		this.messagecontent = messagecontent;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "messageid", unique = true, nullable = false)
	public Integer getMessageid() {
		return this.messageid;
	}

	public void setMessageid(Integer messageid) {
		this.messageid = messageid;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "productid", nullable = false)
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userid", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "messagetime", nullable = false, length = 19)
	public Timestamp getMessagetime() {
		return this.messagetime;
	}

	public void setMessagetime(Timestamp messagetime) {
		this.messagetime = messagetime;
	}

	@Column(name = "messagecontent", nullable = false)
	public String getMessagecontent() {
		return this.messagecontent;
	}

	public void setMessagecontent(String messagecontent) {
		this.messagecontent = messagecontent;
	}

}