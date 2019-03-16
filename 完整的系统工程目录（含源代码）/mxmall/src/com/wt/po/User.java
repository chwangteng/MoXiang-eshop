package com.wt.po;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user", catalog = "mxmall")
public class User implements java.io.Serializable {

	// Fields

	private Integer userid;
	private String username;
	private String userpassword;
	private Double userpoint;
	private Set<Product> products = new HashSet<Product>(0);
	private Set<Consignee> consignees = new HashSet<Consignee>(0);
	private Set<Order> orders = new HashSet<Order>(0);
	private Set<Message> messages = new HashSet<Message>(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String username, String userpassword, Double userpoint) {
		this.username = username;
		this.userpassword = userpassword;
		this.userpoint = userpoint;
	}

	/** full constructor */
	public User(String username, String userpassword, Double userpoint,
			Set<Product> products, Set<Consignee> consignees,
			Set<Order> orders, Set<Message> messages) {
		this.username = username;
		this.userpassword = userpassword;
		this.userpoint = userpoint;
		this.products = products;
		this.consignees = consignees;
		this.orders = orders;
		this.messages = messages;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "userid", unique = true, nullable = false)
	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	@Column(name = "username", nullable = false, length = 10)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "userpassword", nullable = false, length = 20)
	public String getUserpassword() {
		return this.userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

	@Column(name = "userpoint", nullable = false, precision = 10)
	public Double getUserpoint() {
		return this.userpoint;
	}

	public void setUserpoint(Double userpoint) {
		this.userpoint = userpoint;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Product> getProducts() {
		return this.products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "user")
	public Set<Consignee> getConsignees() {
		return this.consignees;
	}

	public void setConsignees(Set<Consignee> consignees) {
		this.consignees = consignees;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Message> getMessages() {
		return this.messages;
	}

	public void setMessages(Set<Message> messages) {
		this.messages = messages;
	}

}