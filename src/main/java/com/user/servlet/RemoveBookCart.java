package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDAOImpl;
import com.db.DBConnect;

@WebServlet("/RemoveBook")
public class RemoveBookCart extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid")); 
		int cid = Integer.parseInt(req.getParameter("cid"));
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		boolean f = dao.deleteBook(bid,uid,cid);

		HttpSession session = req.getSession();

		if (f) {

			session.setAttribute("sucMsg", "Book Removed Successfully");
			resp.sendRedirect("CheckOut.jsp");
		} else {
			session.setAttribute("failMsg", "Something wrong on server");
			resp.sendRedirect("CheckOut.jsp");

		}
	}

}
