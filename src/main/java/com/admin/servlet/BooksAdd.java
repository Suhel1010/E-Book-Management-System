package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.BookDAOImpl;
import com.db.DBConnect;
import com.entity.BookDtls;

@WebServlet("/AddBooks")
@MultipartConfig
public class BooksAdd extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			String bookName = req .getParameter("bname");
			String author = req .getParameter("author");
			String price= req .getParameter("price");
			String categories = req .getParameter("categories");
			String status = req .getParameter("bstatus");
			Part part = req.getPart("bimg");   // for get file
			String fileName = part.getSubmittedFileName();
			
			BookDtls b = new BookDtls(bookName,author,price,categories,status,fileName,"admin");
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			
			
			
			boolean f = dao.addBooks(b);
			
			HttpSession session = req.getSession();
			
			if(f) {
				
				String  path = getServletContext().getRealPath("") +"Book";
				File file = new  File(path);
				part.write(path +File.separator +fileName);
				
				session.setAttribute("sucMsg", "Book Add Successfully");
				resp.sendRedirect("Admin/add_books.jsp");
			}
			else {
				session.setAttribute("failMsg", "Something Wrong on Server");
				resp.sendRedirect("Admin/add_books.jsp");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
