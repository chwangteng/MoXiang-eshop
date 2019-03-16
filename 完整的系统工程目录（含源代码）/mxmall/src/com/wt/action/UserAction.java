package com.wt.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionSupport;
import com.wt.po.User;
import com.wt.po.UserDAO;

public class UserAction extends ActionSupport  implements DAOAction{

	public String username;
	public String userpassword;
	public String verifypassword;
	
	
	
	public int userid;
	public double userpoint;
	
	/**
	 * @return the userpoint
	 */
	public double getUserpoint() {
		return userpoint;
	}


	/**
	 * @param userpoint the userpoint to set
	 */
	public void setUserpoint(double userpoint) {
		this.userpoint = userpoint;
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
	 * @return the verifypassword
	 */
	public String getVerifypassword() {
		return verifypassword;
	}


	/**
	 * @param verifypassword the verifypassword to set
	 */
	public void setVerifypassword(String verifypassword) {
		this.verifypassword = verifypassword;
	}


	public String register() throws IOException
	{
		System.out.println("------------------------");
		System.out.println("registerExecution");
		System.out.println("------------------------");
		
		List<User> users=udao.findByUsername(username);//查找用户名是否有重复
		
		if(users.size()==0)
		{
			System.out.println("可以注册");
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			out.write("");
			
			User u=new User();
			u.setUsername(username);
			u.setUserpassword(userpassword);
			u.setUserpoint((double)(0));
			udao.save(u);

			
			List<User> ul=udao.findByUsername(username);
			HttpServletRequest request=ServletActionContext.getRequest();
			request.getSession().setAttribute("user", ul.get(0));
			
			return SUCCESS;
		}
		else
		{
			ServletActionContext.getResponse().setCharacterEncoding("utf8");
	        ServletActionContext.getResponse().setContentType("text/html");
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			out.write("该用户名已经被注册，请选择其他用户名注册或直接登录");
			
			return "input";
		}
	}
	
	
	public String login() throws IOException
	{

		
		List<User> users=udao.findByUsername(username);
		
		ServletActionContext.getResponse().setCharacterEncoding("utf8");
        ServletActionContext.getResponse().setContentType("text/html");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		
		if(users.size()==0)
		{
			out.write("不存在该用户");
			return "input";
		}
		else
		{
			if(users.get(0).getUserpassword().equals(userpassword))
			{
				ServletActionContext.getRequest().getSession().setAttribute("user", users.get(0));
				return SUCCESS;
			}
			else
			{
				out.write("用户名或密码错误");
				return "input";
			}
		}
	}

	public String logout()
	{
		ServletActionContext.getRequest().getSession().removeAttribute("user");;
		
		return SUCCESS;
	}
	
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the userpassword
	 */
	public String getUserpassword() {
		return userpassword;
	}

	/**
	 * @param userpassword the userpassword to set
	 */
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	
	public String displayalluser()
	{

		ServletActionContext.getRequest().setAttribute("userlist", udao.findAll());
		
		return SUCCESS;
	}
	
	public String deleteuser()
	{

		User u=udao.findById(userid);
		
		udao.delete(u);
		
		return SUCCESS;
	}
	
	
	
	public String prepareupdateuser()
	{
		
		User u=udao.findById(userid);
		
		ServletActionContext.getRequest().setAttribute("user", u);
		
		
		return SUCCESS;
	}
	
	
	public String updateuser()
	{

		User u=udao.findById(userid);
		
		u.setUserpassword(userpassword);
		u.setUserpoint(userpoint);
		
		udao.merge(u);
		
		return SUCCESS;
	}
}
