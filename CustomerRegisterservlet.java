 package com.Servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Bean.CustomerBean;
import com.Dao.CustomerregisterDao;

import Mail.mail;



@WebServlet("/cReg")
public class CustomerRegisterservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		

		CustomerBean cb = (CustomerBean) req.getAttribute("bean");

		if (cb != null) {
			int k = new CustomerregisterDao().register(cb);
			if (k > 0) {

				int q = new mail().sendMail(cb);
				if (q > 0)
					req.setAttribute("msg", "Register Successfully and mail Sent to your Registered Mail Id");

				req.setAttribute("msg", "Register Successfully");
				req.getRequestDispatcher("Signin.jsp").include(req, res);
			} else {

				req.setAttribute("msg", "Failed To Register");
				req.getRequestDispatcher("index.jsp").include(req, res);
			}
		} else {
			req.getRequestDispatcher("Signin.jsp").include(req, res);
		}
	}
		
	
	}


