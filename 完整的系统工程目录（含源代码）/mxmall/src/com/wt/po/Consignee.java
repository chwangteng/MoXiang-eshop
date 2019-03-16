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
 * Consignee entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "consignee", catalog = "mxmall")
public class Consignee implements java.io.Serializable {

	// Fields

	private Integer consigneeid;
	private User user;
	private String consigneename;
	private String consigneeaddress;
	private String consigneephone;
	private Set<Order> orders = new HashSet<Order>(0);

	// Constructors

	/** default constructor */
	public Consignee() {
	}

	/** minimal constructor */
	public Consignee(User user, String consigneename, String consigneeaddress,
			String consigneephone) {
		this.user = user;
		this.consigneename = consigneename;
		this.consigneeaddress = consigneeaddress;
		this.consigneephone = consigneephone;
	}

	/** full constructor */
	public Consignee(User user, String consigneename, String consigneeaddress,
			String consigneephone, Set<Order> orders) {
		this.user = user;
		this.consigneename = consigneename;
		this.consigneeaddress = consigneeaddress;
		this.consigneephone = consigneephone;
		this.orders = orders;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "consigneeid", unique = true, nullable = false)
	public Integer getConsigneeid() {
		return this.consigneeid;
	}

	public void setConsigneeid(Integer consigneeid) {
		this.consigneeid = consigneeid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "consigneename", nullable = false, length = 10)
	public String getConsigneename() {
		return this.consigneename;
	}

	public void setConsigneename(String consigneename) {
		this.consigneename = consigneename;
	}

	@Column(name = "consigneeaddress", nullable = false)
	public String getConsigneeaddress() {
		return this.consigneeaddress;
	}

	public void setConsigneeaddress(String consigneeaddress) {
		this.consigneeaddress = consigneeaddress;
	}

	@Column(name = "consigneephone", nullable = false, length = 20)
	public String getConsigneephone() {
		return this.consigneephone;
	}

	public void setConsigneephone(String consigneephone) {
		this.consigneephone = consigneephone;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "consignee")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

}