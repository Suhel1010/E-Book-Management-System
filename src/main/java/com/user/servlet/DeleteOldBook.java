package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDAOImpl;
import com.db.DBConnect;

@WebServlet("/delete_Old_Book")
public class DeleteOldBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String em = req.getParameter("em");
			int id = Integer.parseInt(req.getParameter("id"));
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f = dao.oldBookDelete(em, "Old",id);

			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("sucMsg", "Old Book Deleted Successfully");
				resp.sendRedirect("OldBook.jsp");
			} else {
				session.setAttribute("failMsg", "Something wrong on server");
				resp.sendRedirect("OldBook.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
