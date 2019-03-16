package com.wt.po;

import java.sql.Timestamp;
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
 * Order entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "order", catalog = "mxmall")
public class Order implements java.io.Serializable {

	// Fields

	private Integer orderid;
	private Consignee consignee;
	private User user;
	private Orderstate orderstate;
	private Double orderpricetotal;
	private Timestamp ordertime;
	private Double orderpricereal;
	private Double orderpricepoint;
	private Set<Oderitem> oderitems = new HashSet<Oderitem>(0);

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(Consignee consignee, User user, Orderstate orderstate,
			Double orderpricetotal, Timestamp ordertime, Double orderpricereal,
			Double orderpricepoint) {
		this.consignee = consignee;
		this.user = user;
		this.orderstate = orderstate;
		this.orderpricetotal = orderpricetotal;
		this.ordertime = ordertime;
		this.orderpricereal = orderpricereal;
		this.orderpricepoint = orderpricepoint;
	}

	/** full constructor */
	public Order(Consignee consignee, User user, Orderstate orderstate,
			Double orderpricetotal, Timestamp ordertime, Double orderpricereal,
			Double orderpricepoint, Set<Oderitem> oderitems) {
		this.consignee = consignee;
		this.user = user;
		this.orderstate = orderstate;
		this.orderpricetotal = orderpricetotal;
		this.ordertime = ordertime;
		this.orderpricereal = orderpricereal;
		this.orderpricepoint = orderpricepoint;
		this.oderitems = oderitems;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "orderid", unique = true, nullable = false)
	public Integer getOrderid() {
		return this.orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "consigneeid", nullable = false)
	public Consignee getConsignee() {
		return this.consignee;
	}

	public void setConsignee(Consignee consignee) {
		this.consignee = consignee;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userid", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "orderstateid", nullable = false)
	public Orderstate getOrderstate() {
		return this.orderstate;
	}

	public void setOrderstate(Orderstate orderstate) {
		this.orderstate = orderstate;
	}

	@Column(name = "orderpricetotal", nullable = false, precision = 10)
	public Double getOrderpricetotal() {
		return this.orderpricetotal;
	}

	public void setOrderpricetotal(Double orderpricetotal) {
		this.orderpricetotal = orderpricetotal;
	}

	@Column(name = "ordertime", nullable = false, length = 19) 
	public Timestamp getOrdertime() {
		return this.ordertime;
	}

	public void setOrdertime(Timestamp ordertime) {
		this.ordertime = ordertime;
	}

	@Column(name = "orderpricereal", nullable = false, precision = 10)
	public Double getOrderpricereal() {
		return this.orderpricereal;
	}

	public void setOrderpricereal(Double orderpricereal) {
		this.orderpricereal = orderpricereal;
	}

	@Column(name = "orderpricepoint", nullable = false, precision = 10)
	public Double getOrderpricepoint() {
		return this.orderpricepoint;
	}

	public void setOrderpricepoint(Double orderpricepoint) {
		this.orderpricepoint = orderpricepoint;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "order")
	public Set<Oderitem> getOderitems() {
		return this.oderitems;
	}

	public void setOderitems(Set<Oderitem> oderitems) {
		this.oderitems = oderitems;
	}

}