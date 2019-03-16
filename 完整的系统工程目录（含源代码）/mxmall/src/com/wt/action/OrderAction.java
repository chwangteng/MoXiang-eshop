package com.wt.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionSupport;
import com.wt.po.Consignee;
import com.wt.po.ConsigneeDAO;
import com.wt.po.Oderitem;
import com.wt.po.Order;
import com.wt.po.OrderDAO;
import com.wt.po.Orderstate;
import com.wt.po.OrderstateDAO;
import com.wt.po.Product;
import com.wt.po.ProductDAO;
import com.wt.po.User;
import com.wt.po.UserDAO;

public class OrderAction extends ActionSupport  implements DAOAction{

	public double orderpricepoint;
	public int consigneeid;
	
	
	public String consigneeaddress;
	public String consigneename;
	public String consigneephone;
	
	public int orderid;
	
	/**
	 * @return the orderid
	 */
	public int getOrderid() {
		return orderid;
	}

	/**
	 * @param orderid the orderid to set
	 */
	public void setOrderid(int orderid) {
		this.orderid = orderid;
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

	/**
	 * @return the orderpricepoint
	 */
	public double getOrderpricepoint() {
		return orderpricepoint;
	}

	/**
	 * @param orderpricepoint the orderpricepoint to set
	 */
	public void setOrderpricepoint(double orderpricepoint) {
		this.orderpricepoint = orderpricepoint;
	}

	/**
	 * @return the consigneeid
	 */
	public int getConsigneeid() {
		return consigneeid;
	}

	/**
	 * @param consigneeid the consigneeid to set
	 */
	public void setConsigneeid(int consigneeid) {
		this.consigneeid = consigneeid;
	}

	public String preparecheckout()
	{
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		UserDAO ud=UserDAO.getFromApplicationContext(ctx);
		HttpSession session=ServletActionContext.getRequest().getSession();
		
		List<Oderitem> oil=(List<Oderitem>) session.getAttribute("cart");
		
		double total=0;
		for(int i=0;i<oil.size();++i)
		{
			total+=oil.get(i).getOrderitemprice();
		}
		
		
		Order o=new Order();
		o.setOrderpricetotal(total);
		o.setOrderpricereal(total);
		o.setOrderpricepoint((double)(0));
		
		
		ServletActionContext.getRequest().setAttribute("order", o);
		
		return SUCCESS;
	}
	
	public String displayPurchase()
	{

		User u=(User) ServletActionContext.getRequest().getSession().getAttribute("user");
		
		//List<Order> orderlist=od.findByProperty("user", u);
		List<Order> orderlist=odao.findByPropertyAndOrderByTime("user", u);
		
		ServletActionContext.getRequest().setAttribute("orderlist", orderlist);
		
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String executeOrder()
	{

		HttpSession session=ServletActionContext.getRequest().getSession();
		
		List<Oderitem> oil=(List<Oderitem>) session.getAttribute("cart");
		session.removeAttribute("cart");
		
		double total=0;
		
		
		for(int i=0;i<oil.size();++i)
		{
			total+=oil.get(i).getOrderitemprice();
		}
		
		Order o=new Order();
		o.setOrderpricetotal(total);
		o.setOrderpricereal(total-orderpricepoint/100);
		o.setOrderpricepoint(orderpricepoint);
		
		Set<Oderitem> set=new HashSet<Oderitem>();
		
		for(int i=0;i<oil.size();++i)//让多端知道一端的存在，否则级联保存时会不知道一端的id
		{
			oil.get(i).setOrder(o);
		}
		
		
		for(int i=0;i<oil.size();++i)//认为是不存在重复元素的
		{
			set.add(oil.get(i));
		}
		
		
		o.setOderitems((Set<Oderitem>) set);
		
		User user=(User) session.getAttribute("user");
		if(user.getUserid()!=(-1))//注册用户
		{
			Consignee con=ConsigneeDAO.getFromApplicationContext(ctx).findById(consigneeid);
			o.setConsignee(con);
		}
		else//游客
		{
			Consignee con=new Consignee(user,consigneename,consigneeaddress,consigneephone);
			ConsigneeDAO.getFromApplicationContext(ctx).save(con);
			o.setConsignee(con);
			
		}
		
		
		Orderstate orderstate=osdao.findById(1);//默认为未支付
		o.setOrderstate(orderstate);
		o.setOrdertime(new Timestamp(System.currentTimeMillis()));
		
		
		user.setUserpoint(user.getUserpoint()-orderpricepoint);
		
		o.setUser(user);

		udao.merge(user);/////////////////
		
		odao.save(o);
		
		ServletActionContext.getRequest().setAttribute("order", o);
		
		return SUCCESS;
	}
	
	public String preparepay()
	{

		ServletActionContext.getRequest().setAttribute("order", odao.findById(orderid));
		
		return SUCCESS;
	}
	
	//模仿京东，对自营以及第三方订单进行拆单操作，即不同卖家的订单都被拆开
	public String pay()
	{

		Order o=new Order();
		o=odao.findById(orderid);
		Order backup=new Order();
		backup=odao.findById(orderid);

		Set<Oderitem> os=backup.getOderitems();
		
		List<Order> suborderlist=new ArrayList<Order>();
		
		Iterator<Oderitem> it=os.iterator();
		
		while(it.hasNext())
		{
			int bbb=os.size();
			
			Oderitem item=new Oderitem();
			item=it.next();
			String aaa=item.getProduct().getProductname();
			
			
			item.setOrderitemid(null);//一定要设置成null！！！！！！！！！否则主键相同，hibernate会以为使用update方法
			User saler=item.getProduct().getUser();
			boolean found=false;
			
			for(int i=0;i<suborderlist.size();++i)
			{
				if(suborderlist.get(i).getOderitems().iterator().next().getProduct().getUser().getUserid()==saler.getUserid())
				{
					item.setOrder(suborderlist.get(i));
					Set<Oderitem>  set=suborderlist.get(i).getOderitems();
					set.add(item);
					suborderlist.get(i).setOderitems(set);
					//suborderlist.get(i).getOderitems().add(item);
					suborderlist.get(i).setOrderpricetotal(suborderlist.get(i).getOrderpricetotal()+item.getOrderitemprice());
					double d1=suborderlist.get(i).getOrderpricepoint();
					double d2=suborderlist.get(i).getOrderpricepoint()+(backup.getOrderpricepoint()*item.getOrderitemprice()/backup.getOrderpricetotal());
					suborderlist.get(i).setOrderpricepoint(suborderlist.get(i).getOrderpricepoint()+(backup.getOrderpricepoint()*item.getOrderitemprice()/backup.getOrderpricetotal()));
					suborderlist.get(i).setOrderpricereal(suborderlist.get(i).getOrderpricetotal()-suborderlist.get(i).getOrderpricepoint()/100);
					found=true;
					break;
				}
			}
			
			if(found==false)
			{
				Order or=new Order();
				or.setConsignee(backup.getConsignee());
				or.setOrderstate(backup.getOrderstate());
				or.setOrdertime(backup.getOrdertime());
				or.setUser(backup.getUser());
				
				Set<Oderitem>  set=new HashSet<Oderitem>();
				//set=or.getOderitems();
				set.add(item);
				//or.getOderitems().clear();
				or.setOderitems((Set<Oderitem>)set);

				or.setOrderpricetotal(item.getOrderitemprice());
				or.setOrderpricepoint(backup.getOrderpricepoint()*item.getOrderitemprice()/backup.getOrderpricetotal());
				or.setOrderpricereal(or.getOrderpricetotal()-or.getOrderpricepoint()/100);
				item.setOrder(or);
				
				suborderlist.add(or);
			}
		}
		
		for(int i=0;i<suborderlist.size();++i)
		{
			suborderlist.get(i).getOrderstate().setOrderstateid(2);
			odao.save(suborderlist.get(i));//将新拆开的订单全部写回数据库
		}
		
		
		
		//将购买商品的数量从库存中减去
		Set<Oderitem> oderset=o.getOderitems();
		Iterator<Oderitem> iterat=oderset.iterator();
		while(iterat.hasNext())
		{
			Oderitem item=new Oderitem();
			item=iterat.next();
			Product p=new Product();
			p=item.getProduct();
			p.setProductstock(item.getProduct().getProductstock()-item.getOderitemquantity());
			ProductDAO.getFromApplicationContext(ctx).merge(p);
		}
		
		odao.delete(o);//先将原来的订单以及订单项级联删除
		
		return SUCCESS;
	}
	
	public String confirmReceived()//买家确认收货,获得积分返还，积分为订单价格的百分之一
	{

		Orderstate state=osdao.findById(4);
		
		Order o=odao.findById(orderid);
		
		o.setOrderstate(state);
		
		odao.merge(o);
		
		//确认收货之后更新积分
		HttpSession session=ServletActionContext.getRequest().getSession();
		User user=(User) session.getAttribute("user");
		user.setUserpoint(user.getUserpoint()+o.getOrderpricereal()/100);
		session.setAttribute("user", user);
		
		udao.merge(user);
		
		return SUCCESS;
	}
	
	public String deliver()//模拟发货动作////////////////////////////
	{

		Order o=odao.findById(orderid);
		Orderstate state=osdao.findById(3);
		
		o.setOrderstate(state);
		odao.merge(o);
		
		return SUCCESS;
	}
	
	public String cancalorder()//将订单状态变为4，即交易失败
	{

		Order o=odao.findById(orderid);
		Orderstate state=osdao.findById(5);
		
		o.setOrderstate(state);
		odao.merge(o);
		
		return SUCCESS;
	}
	
	public String displaySold()//显示卖出的订单///////////////////////////////
	{
		HttpSession session=ServletActionContext.getRequest().getSession();
		User u=(User) session.getAttribute("user");
		
		@SuppressWarnings("unchecked")
		List<Oderitem> oil=odao.findByPropertySoldActually("user", u);
		
		List<Order>  ol=new ArrayList<Order>();
		
		for(int i=0;i<oil.size();++i)
		{
			if(!ol.contains(oil.get(i).getOrder()))
			{
				ol.add(oil.get(i).getOrder());
			}
		}
		
		ServletActionContext.getRequest().setAttribute("orderlist", ol);
		
		return SUCCESS;
	}

	public String displayallorder()
	{
		ServletActionContext.getRequest().setAttribute("orderlist", odao.findAll());
		
		return SUCCESS;
	}
	
	public String cancalorderbyadmin()
	{
		cancalorder();
		
		return SUCCESS;
	}
}
