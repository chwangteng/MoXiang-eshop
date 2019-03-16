package com.wt.action;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionSupport;
import com.wt.po.MessageDAO;
import com.wt.po.Message;
import com.wt.po.Product;
import com.wt.po.ProductDAO;
import com.wt.po.User;
import com.wt.po.UserDAO;

public class MessageAction extends ActionSupport  implements DAOAction{

	public int productid;
	
	public int userid;
	
	public int messageid;
	
	/**
	 * @return the messageid
	 */
	public int getMessageid() {
		return messageid;
	}

	/**
	 * @param messageid the messageid to set
	 */
	public void setMessageid(int messageid) {
		this.messageid = messageid;
	}

	public String content;
	
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return the userid
	 */
	public int getUserid() {
		return userid;
	}

	/**
	 * @param userid the userid to set
	 */
	public void setUserid(int userid) {
		this.userid = userid;
	}

	/**
	 * @return the productid
	 */
	public int getProductid() {
		return productid;
	}

	/**
	 * @param productid the productid to set
	 */
	public void setProductid(int productid) {
		this.productid = productid;
	}
	
	public String displayProductMessages()
	{
		HttpServletRequest request=ServletActionContext.getRequest();	
		
		Product product=new Product();
		product.setProductid(productid);
		//应该不需要从数据库中重新读取，因为hibernate查询虽然是基于对象的查找但应该只用到id属性
		List<Message> messagelist=mdao.findByProperty("product", product);
		
		request.setAttribute("messagelist", messagelist);
		
		return SUCCESS;
	}
	
	
	public String addMessage()
	{

		Message m=new Message();
		m.setMessagecontent(content);
		m.setMessagetime(new Timestamp(System.currentTimeMillis()));
		
		m.setProduct(pdao.findById(productid));//from request
		m.setUser((User) ServletActionContext.getRequest().getSession().getAttribute("user"));//from session
		
		mdao.save(m);
	
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
		System.out.println(m.getMessagecontent());
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
		
		ServletActionContext.getRequest().setAttribute("productid", productid);
		
		return SUCCESS;
	}
	
	public String displayallmessage()
	{

		ServletActionContext.getRequest().setAttribute("messagelist", mdao.findAll());
		
		return SUCCESS;
	}
	
	public String deletemessage()
	{

		Message m=mdao.findById(messageid);
		
		mdao.delete(m);
		
		return SUCCESS;
	}
}
