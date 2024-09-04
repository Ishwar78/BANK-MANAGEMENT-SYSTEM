package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.CustomerBean;
import com.Dao.SendMoneyDAO;


@WebServlet("/Sendmoney")
public class SendMoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest req, HttpServletResponse res ) throws ServletException, IOException {
        
		HttpSession  hs = req.getSession(false);
		CustomerBean cb = (CustomerBean) hs.getAttribute("bean");
		if(cb != null) {
      req = new SendMoneyDAO().send(req);
      String msg = (String)req.getAttribute("msg");
      
      if(msg != null &&msg.equals("Transaction Succesfull"));
      {
    	  float bal = cb.getBal();
    	  bal = bal-Float.parseFloat(req.getParameter("amt"));
    	  cb.setBal(bal);
    	    	  
    	  
      }
      req.setAttribute("msg", msg); 
      req.getRequestDispatcher("SendMoney.jsp").include(req, res);
		}else {
			  req.setAttribute("msg", "Session Expired");
			  req.getRequestDispatcher("index.jsp").include(req, res);
		}
	}
}
