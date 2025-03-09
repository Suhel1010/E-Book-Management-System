package com.user.servlet;
		
import java.awt.im.InputContext;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDAOImpl;
import com.dao.CartDAOImpl;
import com.db.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/CartModule")
public class CartServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			BookDtls b = dao.getBookById(bid); 
			
			Cart c = new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
			boolean f = dao2.addCart(c);
			
			HttpSession session = req.getSession();
			
			if(f) {
				
				session.setAttribute("sucCart","Book added successfully");
				resp.sendRedirect("All_New_Book.jsp");
				
			}else {

				session.setAttribute("failCart","Something wrong on server");
				resp.sendRedirect("All_New_Book.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
