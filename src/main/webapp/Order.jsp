<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Book</title>
<%@ include file="all_component/AllCss.jsp"%>
</head>
<body style="background-color: #d9dedd">
	<%@ include file="all_component/NavBar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>

	<div class="container p-1">
		<h3 class="text-center text-danger mt-2">Your Order</h3>
		<table class="table table-striped mt-3">
			<thead class="bg-info text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
				List<Book_Order> blist = dao.getBook(u.getEmail());
				for (Book_Order b : blist) {
				%>

				<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUserName()%></td>
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

	</div>

</body>
</html>