package com.wt.action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wt.po.*;
import com.opensymphony.xwork2.ActionSupport;

public class FeaturesAction extends ActionSupport  implements DAOAction{

	public String displayFeatures()
	{
		
		HttpSession session=ServletActionContext.getRequest().getSession();
		
		if(session.getAttribute("user")==null)
			session.setAttribute("user", udao.findById(-1));//默认为游客

		List<Product> featureslist = pdao.findAll();
		System.out.println("--------------------------------------------");
		System.out.println(featureslist.size());
		System.out.println("--------------------------------------------");
		ServletActionContext.getRequest().setAttribute("featureslist", featureslist);
		
		return SUCCESS;
	}
}
