<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
<%@  include file="AllCss.jsp"%>
</head>
<body>
	<%@  include file="NavBar.jsp"%>

	<%-- for sequel, which by url we can not access this page --%>
	<c:if test="${empty userobj }">
		<c:redirect url="../Login.jsp" />
	</c:if>

	<h3 class="text-right">Hello Admin</h3>

	<c:if test="${not empty sucMsg }">
		<h4>
			<p class="text-center text-success">${sucMsg }</p>
		</h4>
		<c:remove var="sucMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failMsg }">
		<h4>
			<p class="text-center text-danger">${failMsg }</p>
		</h4>
		<c:remove var="failMsg" scope="session" />
	</c:if>

	<table class="table table-hover">
		<thead class="bg-info text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllBooks();
			for (BookDtls b : list) {
			%>
			<tr>
				<td><%=b.getBookId()%></td>
				<td><img src="../Book/<%=b.getphotoName()%>"
					style="width: 50px; height: 50px;"></td>

				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>

				<td><a href="Edit_Books.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-info"><i
						class="fa-solid fa-pen-to-square"></i> Edit</a> <a
					href="../delete?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i>
						Delete</a></td>
			</tr>

			<%
			}
			%>



		</tbody>
	</table>

</body>
</html>