package com.wt.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.*;

import com.opensymphony.xwork2.ActionSupport;
import com.wt.po.Category;
import com.wt.po.CategoryDAO;
import com.wt.po.Oderitem;
import com.wt.po.Product;
import com.wt.po.ProductDAO;
import com.wt.po.User;
import com.wt.po.UserDAO;

public class ProductAction extends ActionSupport  implements DAOAction{

	public int productid;

	public int oderitemquantity;

	public int userid;
	public int categoryid;
	public double productprice;
	public String productname;
	public String productdetail;
	public int productstock;

	public String keyword;
	
	/**
	 * @return the keyword
	 */
	public String getKeyword() {
		return keyword;
	}

	/**
	 * @param keyword the keyword to set
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	/**
	 * @return the merge
	 */
	public boolean isMerge() {
		return merge;
	}

	/**
	 * @param merge the merge to set
	 */
	public void setMerge(boolean merge) {
		this.merge = merge;
	}
	// 这里用List来存放上传过来的文件，file同样指的是临时文件夹中的临时文件，而不是真正上传过来的文件
	public List<File> file;

	// 这个List存放的是文件的名字，和List<File>中的文件相对应
	public List<String> fileFileName;

	public List<String> fileContentType;

	
	public boolean merge=false;
	
	
	
	/**
	 * @return the file
	 */
	public List<File> getFile() {
		return file;
	}

	/**
	 * @param file
	 *            the file to set
	 */
	public void setFile(List<File> file) {
		this.file = file;
	}

	/**
	 * @return the fileFileName
	 */
	public List<String> getFileFileName() {
		return fileFileName;
	}

	/**
	 * @param fileFileName
	 *            the fileFileName to set
	 */
	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}

	/**
	 * @return the fileContentType
	 */
	public List<String> getFileContentType() {
		return fileContentType;
	}

	/**
	 * @param fileContentType
	 *            the fileContentType to set
	 */
	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}

	/**
	 * @return the userid
	 */
	public int getUserid() {
		return userid;
	}

	/**
	 * @param userid
	 *            the userid to set
	 */
	public void setUserid(int userid) {
		this.userid = userid;
	}

	/**
	 * @return the categoryid
	 */
	public int getCategoryid() {
		return categoryid;
	}

	/**
	 * @param categoryid
	 *            the categoryid to set
	 */
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	/**
	 * @return the productprice
	 */
	public double getProductprice() {
		return productprice;
	}

	/**
	 * @param productprice
	 *            the productprice to set
	 */
	public void setProductprice(double productprice) {
		this.productprice = productprice;
	}

	/**
	 * @return the productname
	 */
	public String getProductname() {
		return productname;
	}

	/**
	 * @param productname
	 *            the productname to set
	 */
	public void setProductname(String productname) {
		this.productname = productname;
	}

	/**
	 * @return the productdetail
	 */
	public String getProductdetail() {
		return productdetail;
	}

	/**
	 * @param productdetail
	 *            the productdetail to set
	 */
	public void setProductdetail(String productdetail) {
		this.productdetail = productdetail;
	}

	/**
	 * @return the productstock
	 */
	public int getProductstock() {
		return productstock;
	}

	/**
	 * @param productstock
	 *            the productstock to set
	 */
	public void setProductstock(int productstock) {
		this.productstock = productstock;
	}

	/**
	 * @return the oderitemquantity
	 */
	public int getOderitemquantity() {
		return oderitemquantity;
	}

	/**
	 * @param oderitemquantity
	 *            the oderitemquantity to set
	 */
	public void setOderitemquantity(int oderitemquantity) {
		this.oderitemquantity = oderitemquantity;
	}

	/**
	 * @return the productid
	 */
	public int getProductid() {
		return productid;
	}

	/**
	 * @param productid
	 *            the productid to set
	 */
	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String displayProductDetail() {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		Product product = pdao.findById(productid);

		request.setAttribute("product", product);

		System.out.println("--------------------------------------------");
		System.out.println(product.getProductdetail());
		System.out.println("--------------------------------------------");

		return SUCCESS;
	}

	public String addCart() throws IOException {
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		Product p = pdao.findById(
				productid);
		if (p.getProductstock() < oderitemquantity) {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().setContentType("text/html");
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			out.write("当前商品无货，看看其他商品吧！");
			return ERROR;// 没有库存则无法购买
		}

		List<Oderitem> oil;
		if (session.getAttribute("cart") == null) {
			oil = new ArrayList<Oderitem>();
		} else {
			oil = (List<Oderitem>) session.getAttribute("cart");
		}

		for (int i = 0; i < oil.size(); ++i) {
			Oderitem oderitem = oil.get(i);
			if (oderitem.getProduct().getProductid().equals(productid))// 已经在购物车，增加数量
			{
				oderitem.setOderitemquantity(oderitem.getOderitemquantity()
						+ oderitemquantity);
				oderitem.setOrderitemprice(oderitem.getProduct()
						.getProductprice() * oderitem.getOderitemquantity());
				return SUCCESS;
			}
		}

		Oderitem oderitem = new Oderitem();
		oderitem.setOderitemquantity(oderitemquantity);

		oderitem.setProduct(p);
		oderitem.setOrderitemprice(p.getProductprice() * oderitemquantity);

		oil.add(oderitem);

		session.setAttribute("cart", oil);

		System.out.println("!!!!!!!!!!!!");
		System.out.println(oderitem.getOderitemquantity());
		System.out.println(oderitem.getOrderitemprice());
		System.out.println("!!!!!!!!!!!!");
		return SUCCESS;
	}

	public String removeCart() {
		HttpSession session = ServletActionContext.getRequest().getSession();

		List<Oderitem> oil = (List<Oderitem>) session.getAttribute("cart");

		for (int i = 0; i < oil.size(); ++i) {
			Oderitem item = oil.get(i);
			if (item.getProduct().getProductid() == this.productid) {
				oil.remove(i);
				return SUCCESS;
			}
		}

		return ERROR;
	}

	public String displayonsale() {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		User u = (User) request.getSession().getAttribute("user");

		List<Product> pl = pdao.findByProperty("user", u);

		request.getSession().setAttribute("onsalelist", pl);

		return SUCCESS;
	}

	public String addProduct() throws IOException, ServletException {
		
		Product p = new Product();

		p.setCategory(CategoryDAO.getFromApplicationContext(ctx).findById(
				categoryid));
		p.setProductdetail(productdetail);
		p.setProductname(productname);
		p.setProductprice(productprice);
		p.setProductstock(productstock);
		if(userid!=1)
			p.setProducttag("第三方");
		else
			p.setProducttag("自营");
		
		p.setUser(udao.findById(userid));

		
		if(!merge)
			pdao.save(p);
		else
			{
				p.setProductid(productid);
				pdao.merge(p);
			}

//		String path = ServletActionContext.getServletContext().getRealPath("/");
//		String filepath = path + "frontend\\images\\products\\"
//				+ p.getProductid();
//
//		File f = new File(filepath);
//		if (!f.exists()) {
//			f.mkdirs();
//		}
//
//		Part thumbnail = ServletActionContext.getRequest().getPart("thumbnail");
//		Part detail = ServletActionContext.getRequest().getPart("detail");
//
//		thumbnail.write(filepath + "\\thumbnail.jpg");
//		detail.write(filepath + "\\detail.jpg");
//
//		System.out.println(path);
//		System.out.println(filepath);

		String root = ServletActionContext.getServletContext().getRealPath(
				"/");
		root+="frontend\\images\\products\\"+ p.getProductid();
		File f = new File(root);
		if (!f.exists()) {
			f.mkdirs();
		}

		for (int i = 0; i < file.size(); i++) {
			InputStream is = new FileInputStream(file.get(i));

			String name;
			
			if(i==0)
				name="thumbnail.jpg";
			else
				name="detail.jpg";
			
			System.out.println(root);
			
			OutputStream os = new FileOutputStream(new File(root,
					name));

			byte[] buffer = new byte[500];

			@SuppressWarnings("unused")
			int length = 0;

			while (-1 != (length = is.read(buffer, 0, buffer.length))) {
				os.write(buffer);
			}

			os.close();
			is.close();
		}

		return SUCCESS;
	}
	
	
	public String displayallproduct()
	{
		ServletActionContext.getRequest().setAttribute("productlist", pdao.findAll());
		
		return SUCCESS;
	}
	
	public String deleteproduct()//从数据库删除，在从工作目录删除
	{

		Product p=pdao.findById(productid);
		
		pdao.delete(p);
		
		
		String root = ServletActionContext.getServletContext().getRealPath(
				"/");
		root+="frontend\\images\\products\\"+ p.getProductid();
		
		File delfolder=new File(root); 
		
		
		  File oldFile[] = delfolder.listFiles();
		  try 
		  { 
		     for (int i = 0; i < oldFile.length; i++)
		     {
		        oldFile[i].delete();
		     }
		  } 
		  catch (Exception e) 
		  { 
		    System.out.println("清空文件夹操作出错!!!!!!!!!!!!!!!!!!!"); 
		    e.printStackTrace(); 
		  }
		  
		  delfolder.delete();
		
		
		return SUCCESS;
	}
	public String prepareupdateproduct()
	{

		Product p=pdao.findById(productid);
		
		ServletActionContext.getRequest().setAttribute("product", p);
		
		return SUCCESS;
	}
	
	public String updateproduct() throws IOException, ServletException
	{
		merge=true;
		
		addProduct();
		
		return SUCCESS;
	}
	
	public String search()
	{
		
		ServletActionContext.getRequest().setAttribute("featureslist", pdao.findByProductnameLikeKeyword(keyword));
		
		return SUCCESS;
	}
	
	public String searchcategory()
	{

		Category c=CategoryDAO.getFromApplicationContext(ctx).findById(categoryid);
		
		List<Product> pl=pdao.findByProperty("category", c);
		
		ServletActionContext.getRequest().setAttribute("featureslist", pl);
		
		ServletActionContext.getRequest().setAttribute("keyword", c.getCategoryname());
		
		return SUCCESS;
	}
}
