package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAOImpl;
import com.db.DBConnect;
import com.entity.User;


@WebServlet("/Update_Prifile")
public class UpdateProfileServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter( "fname");
			String email = req.getParameter( "email");
			String phno = req.getParameter( "phno");
			String password = req.getParameter("password");
			
			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			
			HttpSession session = req.getSession();
			
			UserDAOImpl dao  = new UserDAOImpl(DBConnect.getConn());
			boolean f = dao.checkPassword(id, password);
			
			if(f) {
				
				boolean f2 = dao.updateProfile(us);
				
				if(f2) { 
					session.setAttribute("sucMsg", "Profile Update Successfully");
					resp.sendRedirect("Edit_Profile.jsp");
					
				}else {
					session.setAttribute("failMsg", "Something wrong on server");
					resp.sendRedirect("Edit_Profile.jsp");
					
				}
				
			}else {
				
				session.setAttribute("failMsg", "Password is incorrect");
				resp.sendRedirect("Edit_Profile.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
