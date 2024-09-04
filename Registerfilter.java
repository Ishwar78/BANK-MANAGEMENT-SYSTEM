package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

import com.Bean.CustomerBean;
import com.Dao.LoginDao;


@WebFilter("/cReg")
public class Registerfilter extends HttpFilter implements Filter {
       
    

	private static final long serialVersionUID = 1L;


	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {


		String user = req.getParameter("mid");
		Long accNo = new LoginDao().checkUser(user);
		
		if (accNo == null) {
		
		CustomerBean cb = new CustomerBean();
		
		cb.setAno(Long.parseLong(req.getParameter("ano")));
		cb.setCid(Integer.parseInt(req.getParameter("cid")));
		cb.setCname(req.getParameter("cname"));
		cb.setBal(Float.parseFloat(req.getParameter("bal")));
		cb.setActype(req.getParameter("atype"));
		cb.setHno(req.getParameter("hno"));
		cb.setSn(req.getParameter("sn"));
		cb.setCty(req.getParameter("cty"));
		cb.setSt(req.getParameter("st"));
		cb.setPcode(req.getParameter("pcode"));
		cb.setMid(req.getParameter("mid"));
		cb.setPass(req.getParameter("pass"));
cb.setNumber(Long.parseLong(req.getParameter("pno")));
		
		
		req.setAttribute("bean", cb);
		}else {
			req.setAttribute("bean", null);
			req.setAttribute("msg", "Already Registered account");
		
		}
		chain.doFilter(req, res);
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
