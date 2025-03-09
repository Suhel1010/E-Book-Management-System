package com.admin.servlet;

import java.awt.print.Book;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDAOImpl;
import com.db.DBConnect;

@WebServlet("/delete")
public class BookDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteBook(id);

			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("sucMsg", "Book Deleted Successfully");
				resp.sendRedirect("Admin/all_books.jsp");

			} else {
				session.setAttribute("failMsg", "Someting Wrong on Server");
				resp.sendRedirect("Admin/all_books.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
