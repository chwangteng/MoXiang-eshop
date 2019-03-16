package com.wt.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Oderitem entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "oderitem", catalog = "mxmall")
public class Oderitem implements java.io.Serializable {

	// Fields

	private Integer orderitemid;
	private Product product;
	private Order order;
	private Integer oderitemquantity;
	private Double orderitemprice;

	// Constructors

	/** default constructor */
	public Oderitem() {
	}

	/** full constructor */
	public Oderitem(Product product, Order order, Integer oderitemquantity,
			Double orderitemprice) {
		this.product = product;
		this.order = order;
		this.oderitemquantity = oderitemquantity;
		this.orderitemprice = orderitemprice;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "orderitemid", unique = true, nullable = false)
	public Integer getOrderitemid() {
		return this.orderitemid;
	}

	public void setOrderitemid(Integer orderitemid) {
		this.orderitemid = orderitemid;
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
	@JoinColumn(name = "orderid", nullable = false)
	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Column(name = "oderitemquantity", nullable = false)
	public Integer getOderitemquantity() {
		return this.oderitemquantity;
	}

	public void setOderitemquantity(Integer oderitemquantity) {
		this.oderitemquantity = oderitemquantity;
	}

	@Column(name = "orderitemprice", nullable = false, precision = 10)
	public Double getOrderitemprice() {
		return this.orderitemprice;
	}

	public void setOrderitemprice(Double orderitemprice) {
		this.orderitemprice = orderitemprice;
	}

}