package com.Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.CustomerBean;
import com.Dao.editprofileDAO;


@WebServlet("/editprofile")
public class editprofileservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		HttpSession hs = req.getSession(false);

		int k = new editprofileDAO().update(req);
		if (k > 0) {
			CustomerBean cb = (CustomerBean) hs.getAttribute("bean");

			cb.setCname(req.getParameter("cname"));
			cb.setActype(req.getParameter("actype"));
			cb.setHno(req.getParameter("hno"));
			cb.setCname(req.getParameter("sn"));
			cb.setCty(req.getParameter("cty"));
			cb.setSt(req.getParameter("st"));
			cb.setPcode(req.getParameter("pin"));
			cb.setMid(req.getParameter("mid"));
		

			req.setAttribute("msg", "Profile Updated");
		} else {
			req.setAttribute("msg", "Failed to Edit");
		}
		RequestDispatcher rd = req.getRequestDispatcher("welcome.jsp");
		rd.include(req, res);
	}

}
