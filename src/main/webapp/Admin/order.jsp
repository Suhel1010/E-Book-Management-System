<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Orders</title>
<%@  include file="AllCss.jsp"%>
</head>
<body>
	<%@  include file="NavBar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="../Login.jsp"></c:redirect>
	</c:if>


	<h3 class="text-right">Hello Admin</h3>

	<table class="table table-hover">
		<thead class="bg-info text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No.</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
			List<Book_Order> blist = dao.getAllOrder();
			for (Book_Order b : blist) {
			%>

			<tr>
				<th scope="row"><%=b.getOrderId()%></th>
				<td><%=b.getUserName()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getFulladd()%></td>
				<td><%=b.getPhno()%></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPaymeentType()%></td>

			</tr>



			<%
			}
			%>

		</tbody>
	</table>

</body>
</html>