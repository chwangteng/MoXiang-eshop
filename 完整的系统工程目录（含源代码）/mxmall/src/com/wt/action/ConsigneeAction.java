package com.wt.action;

import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionSupport;
import com.wt.po.Consignee;
import com.wt.po.ConsigneeDAO;
import com.wt.po.User;
import com.wt.po.UserDAO;

public class ConsigneeAction extends ActionSupport implements DAOAction{

	public String consigneename;
	public String consigneeaddress;
	public String consigneephone;
	
	
	
	/**
	 * @return the consigneename
	 */
	public String getConsigneename() {
		return consigneename;
	}


	/**
	 * @param consigneename the consigneename to set
	 */
	public void setConsigneename(String consigneename) {
		this.consigneename = consigneename;
	}


	/**
	 * @return the consigneeaddress
	 */
	public String getConsigneeaddress() {
		return consigneeaddress;
	}


	/**
	 * @param consigneeaddress the consigneeaddress to set
	 */
	public void setConsigneeaddress(String consigneeaddress) {
		this.consigneeaddress = consigneeaddress;
	}


	/**
	 * @return the consigneephone
	 */
	public String getConsigneephone() {
		return consigneephone;
	}


	/**
	 * @param consigneephone the consigneephone to set
	 */
	public void setConsigneephone(String consigneephone) {
		this.consigneephone = consigneephone;
	}


	
	
	
	
	public String displayconsignee()
	{
		
		User u=(User) ServletActionContext.getRequest().getSession().getAttribute("user");
		
		if(u.getUserid()!=(-1))//-1是游客，即未注册用户
		{
			ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
			cdao.getFromApplicationContext(ctx);
			
			List<Consignee> clist=cdao.findByProperty("user", u);
			
			ServletActionContext.getRequest().setAttribute("consigneelist", clist);
		}
		
		return SUCCESS;
	}
	
	
	public String addconsignee()
	{
		User u=(User) ServletActionContext.getRequest().getSession().getAttribute("user");

		Consignee c=new Consignee();
		c.setUser(u);
		c.setConsigneeaddress(consigneeaddress);
		c.setConsigneename(consigneename);
		c.setConsigneephone(consigneephone);
		
		cdao.save(c);
		
		Set<Consignee> con=u.getConsignees();
		con.add(c);
		
		u.setConsignees(con);
		
		ServletActionContext.getRequest().getSession().setAttribute("user", u);
		
		return SUCCESS;
	}
}
