package com.wt.po;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * OderitemId entity. @author MyEclipse Persistence Tools
 */
@Embeddable
public class OderitemId implements java.io.Serializable {

	// Fields

	private Integer orderid;
	private Integer productid;

	// Constructors

	/** default constructor */
	public OderitemId() {
	}

	/** full constructor */
	public OderitemId(Integer orderid, Integer productid) {
		this.orderid = orderid;
		this.productid = productid;
	}

	// Property accessors

	@Column(name = "orderid", nullable = false)
	public Integer getOrderid() {
		return this.orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	@Column(name = "productid", nullable = false)
	public Integer getProductid() {
		return this.productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof OderitemId))
			return false;
		OderitemId castOther = (OderitemId) other;

		return ((this.getOrderid() == castOther.getOrderid()) || (this
				.getOrderid() != null && castOther.getOrderid() != null && this
				.getOrderid().equals(castOther.getOrderid())))
				&& ((this.getProductid() == castOther.getProductid()) || (this
						.getProductid() != null
						&& castOther.getProductid() != null && this
						.getProductid().equals(castOther.getProductid())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getOrderid() == null ? 0 : this.getOrderid().hashCode());
		result = 37 * result
				+ (getProductid() == null ? 0 : this.getProductid().hashCode());
		return result;
	}

}