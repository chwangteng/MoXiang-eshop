package com.wt.action;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wt.po.ConsigneeDAO;
import com.wt.po.MessageDAO;
import com.wt.po.OderitemDAO;
import com.wt.po.OrderDAO;
import com.wt.po.OrderstateDAO;
import com.wt.po.ProductDAO;
import com.wt.po.UserDAO;

public interface DAOAction {
	ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
	ConsigneeDAO cdao=ConsigneeDAO.getFromApplicationContext(ctx);
	ProductDAO pdao=ProductDAO.getFromApplicationContext(ctx);
	MessageDAO mdao=MessageDAO.getFromApplicationContext(ctx);
	OrderDAO odao=OrderDAO.getFromApplicationContext(ctx);
	UserDAO udao=UserDAO.getFromApplicationContext(ctx);
	OrderstateDAO osdao=OrderstateDAO.getFromApplicationContext(ctx);
	OderitemDAO oidao=OderitemDAO.getFromApplicationContext(ctx);
}
