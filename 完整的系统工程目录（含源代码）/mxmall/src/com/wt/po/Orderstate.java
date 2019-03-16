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
 * Orderstate entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "orderstate", catalog = "mxmall")
public class Orderstate implements java.io.Serializable {

	// Fields

	private Integer orderstateid;
	private String orderstatename;
	private Set<Order> orders = new HashSet<Order>(0);

	// Constructors

	/** default constructor */
	public Orderstate() {
	}

	/** minimal constructor */
	public Orderstate(String orderstatename) {
		this.orderstatename = orderstatename;
	}

	/** full constructor */
	public Orderstate(String orderstatename, Set<Order> orders) {
		this.orderstatename = orderstatename;
		this.orders = orders;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "orderstateid", unique = true, nullable = false)
	public Integer getOrderstateid() {
		return this.orderstateid;
	}

	public void setOrderstateid(Integer orderstateid) {
		this.orderstateid = orderstateid;
	}

	@Column(name = "orderstatename", nullable = false, length = 20)
	public String getOrderstatename() {
		return this.orderstatename;
	}

	public void setOrderstatename(String orderstatename) {
		this.orderstatename = orderstatename;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "orderstate")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

}