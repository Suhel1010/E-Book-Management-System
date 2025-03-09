<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.User"%>
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
<title>User: Old Book</title>
<%@ include file="all_component/AllCss.jsp"%>
</head>
<body style="background-color: #d9dedd">
	<%@ include file="all_component/NavBar.jsp"%>


	<c:if test="${not empty sucMsg }">
		<div class="alert alert-success text-center">${sucMsg }</div>

		<c:remove var="sucMsg" scope="session" />
	</c:if>



	<div class="container p-4">

		<table class="table table-striped ">
			<thead class="bg-info text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list = dao.getBookByOld(email, "Old");
				for (BookDtls b : list) {
				%>

				<tr>

					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><a
						href="delete_Old_Book?em=<%=email%>&&id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>


				<%
				}
				%>


			</tbody>
		</table>

	</div>

</body>
</html>