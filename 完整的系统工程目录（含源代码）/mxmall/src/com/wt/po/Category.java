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
 * Category entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "category", catalog = "mxmall")
public class Category implements java.io.Serializable {

	// Fields

	private Integer categoryid;
	private String categoryname;
	private Set<Product> products = new HashSet<Product>(0);

	// Constructors

	/** default constructor */
	public Category() {
	}

	/** minimal constructor */
	public Category(String categoryname) {
		this.categoryname = categoryname;
	}

	/** full constructor */
	public Category(String categoryname, Set<Product> products) {
		this.categoryname = categoryname;
		this.products = products;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "categoryid", unique = true, nullable = false)
	public Integer getCategoryid() {
		return this.categoryid;
	}

	public void setCategoryid(Integer categoryid) {
		this.categoryid = categoryid;
	}

	@Column(name = "categoryname", nullable = false, length = 20)
	public String getCategoryname() {
		return this.categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "category")
	public Set<Product> getProducts() {
		return this.products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

}