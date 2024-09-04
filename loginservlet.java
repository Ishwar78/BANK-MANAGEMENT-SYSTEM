package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.CustomerBean;


@WebServlet("/clogin")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		

		CustomerBean cb = (CustomerBean) req.getAttribute("bean");
		if (cb == null) {
			req.getRequestDispatcher("Signin.jsp").include(req, res);
		} else {
			HttpSession hs = req.getSession();
			hs.setAttribute("bean", cb);
			req.getRequestDispatcher("welcome.jsp").include(req, res);
		}
	}

}
