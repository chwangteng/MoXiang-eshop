package com.wt.po;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "product", catalog = "mxmall")
public class Product implements java.io.Serializable {

	// Fields

	private Integer productid;
	private Category category;
	private User user;
	private Double productprice;
	private String productname;
	private String productdetail;
	private Integer productstock;
	private String producttag;
	private Set<Oderitem> oderitems = new HashSet<Oderitem>(0);
	private Set<Message> messages = new HashSet<Message>(0);

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** minimal constructor */
	public Product(Category category, User user, Double productprice,
			String productname, Integer productstock, String producttag) {
		this.category = category;
		this.user = user;
		this.productprice = productprice;
		this.productname = productname;
		this.productstock = productstock;
		this.producttag = producttag;
	}

	/** full constructor */
	public Product(Category category, User user, Double productprice,
			String productname, String productdetail, Integer productstock,
			String producttag, Set<Oderitem> oderitems, Set<Message> messages) {
		this.category = category;
		this.user = user;
		this.productprice = productprice;
		this.productname = productname;
		this.productdetail = productdetail;
		this.productstock = productstock;
		this.producttag = producttag;
		this.oderitems = oderitems;
		this.messages = messages;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "productid", unique = true, nullable = false)
	public Integer getProductid() {
		return this.productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "categoryid", nullable = false)
	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userid", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "productprice", nullable = false, precision = 10)
	public Double getProductprice() {
		return this.productprice;
	}

	public void setProductprice(Double productprice) {
		this.productprice = productprice;
	}

	@Column(name = "productname", nullable = false)
	public String getProductname() {
		return this.productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	@Column(name = "productdetail", length = 65535)
	public String getProductdetail() {
		return this.productdetail;
	}

	public void setProductdetail(String productdetail) {
		this.productdetail = productdetail;
	}

	@Column(name = "productstock", nullable = false)
	public Integer getProductstock() {
		return this.productstock;
	}

	public void setProductstock(Integer productstock) {
		this.productstock = productstock;
	}

	@Column(name = "producttag", nullable = false, length = 10)
	public String getProducttag() {
		return this.producttag;
	}

	public void setProducttag(String producttag) {
		this.producttag = producttag;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Oderitem> getOderitems() {
		return this.oderitems;
	}

	public void setOderitems(Set<Oderitem> oderitems) {
		this.oderitems = oderitems;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Message> getMessages() {
		return this.messages;
	}

	public void setMessages(Set<Message> messages) {
		this.messages = messages;
	}

}