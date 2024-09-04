package com.filter;

import java.io.IOException
;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import com.Bean.CustomerBean;
import com.Dao.LoginDao;

@WebFilter("/clogin")
public class loginfilter extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
    		throws IOException, ServletException {


		String uname = req.getParameter("uname");
		String upass = req.getParameter("upass");

		Long ano = new LoginDao().getaccno(uname, upass);

		if (ano == null) {
			req.setAttribute("msg", "Invalid Username/Password");
			CustomerBean cb = null;
			req.setAttribute("bean", cb);
		} else {
			CustomerBean cb = new LoginDao().getallinformation(ano);
			cb.setAno(ano);
			cb.setPass(upass);
			req.setAttribute("bean", cb);
		}
            chain.doFilter(req, res);
        }
    }

