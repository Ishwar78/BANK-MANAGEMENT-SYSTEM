package com.Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.CustomerBean;
import com.Bean.transactionBean;
import com.Dao.TXHistory;


@WebServlet("/TxHis")
public class transactionhistoryservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
//	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//	}
		  protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		        
		HttpSession hs = req.getSession(false);
		CustomerBean cb = (CustomerBean) hs.getAttribute("bean");
		
		if (cb == null) {
			req.setAttribute("msg", "Session Expired");
			req.getRequestDispatcher("Signin.jsp").include(req, res);
		} else {
			long AccountNumber = cb.getAno();
			TXHistory dao = new TXHistory();
			ArrayList<transactionBean> transactions = dao.Sendinglist(AccountNumber);

			if (transactions.size() != 0) {
				req.setAttribute("history", transactions);
			System.out.println(transactions);
			req.getRequestDispatcher("TransHistory.jsp").include(req, res);
			
			
//			  if (transactions == null) {
//	                transactions = new ArrayList<>();
			} 
//
//	            req.setAttribute("history", transactions);
//	            req.getRequestDispatcher("TransHistory.jsp").include(req, res);
		else {
				req.setAttribute("msg", "No transactions found for the selected option.");
				req.getRequestDispatcher("TransHistory.jsp").include(req, res);
			
		}

		}
	
	}
	}
