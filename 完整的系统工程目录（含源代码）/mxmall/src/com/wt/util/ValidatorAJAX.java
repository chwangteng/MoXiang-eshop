package com.wt.util;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
 



import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Result;
import com.opensymphony.xwork2.util.ValueStack;
 
public class ValidatorAJAX implements Result {

	private static final long serialVersionUID = -4391089449418887682L;

	@SuppressWarnings("unchecked")
    @Override
    public void execute(ActionInvocation arg0) throws Exception {
        //获值栈中fieldErrors的值
        ValueStack vc = ActionContext.getContext().getValueStack();
        Map<String, String[]>  ferrors = (Map<String,String[]>)  vc.findValue("fieldErrors");
        //获得输出流
        ServletActionContext.getResponse().setCharacterEncoding("utf8");
        ServletActionContext.getResponse().setContentType("text/html");
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        if(ferrors.size()==0)
        {
        	out.print("");
            out.close();
            return;
        }
        
        //将map转换为json
        JSONObject json =JSONObject.fromObject(ferrors);
        //想客户端输出
        System.out.println(json.toString());
        out.print(json.toString());
        

        out.close();
//        for (Map.Entry<String, String[]> entry : ferrors.entrySet())
//           System.out.println("key:" + entry.getKey() + "  value:" + entry.getValue());
    }
 
}

