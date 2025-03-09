package com.user.servlet;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.dao.UserDAOImpl;
import com.db.DBConnect;
import com.entity.User;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			
			HttpSession  session = req.getSession(); 
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
			
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("Admin/Home.jsp");
			}
			else {
				
				User us = dao.Login(email, password);
				if(us != null) {
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				}
				else {
					session.setAttribute("failMsg", "Email & Password Invalid");
					resp.sendRedirect("Login.jsp");
				}
				
				//resp.sendRedirect("Home.jsp");
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
