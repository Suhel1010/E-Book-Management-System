<%@page import="com.entity.BookDtls"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Book Page</title>
<%@include file="all_component/AllCss.jsp"%>
</head>
<body style="background-color: #dedddc">
	<%@include file="all_component/NavBar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>

	<div class="container">
		<div class="row p-3">

			<div class="col-md-6 text-center p-5 border bg-white ">
				<img src="Book/<%=b.getphotoName()%>"
					style="height: 160px; width: 150px"><br>
				<h4 class="mt-2">
					Book Name: <span class="text-info"><%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-info"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Cateogory: <span class="text-info"><%=b.getBookCategory()%></span>
				</h4>
			</div>

			<div class="col-md-6  text-center p-5 border bg-white ">
				<h4>
					Book Name:
					<%=b.getBookName()%></h4>

				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<h5 class="text-primary">Contact to seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i> Email:
					<%=b.getEmail()%></h5>

				<%
				}
				%>
				<div class="row">

					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-check-dollar fa-2x"></i>
						<p>Cash on Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<%
				if ("Old".equals(b.getBookCategory())) {
				%>

				<div class="text-center p-2">
					<a href="index.jsp" class="btn btn-primary">Continue Shopping</a> <a href=""
						class="btn btn-primary"><i
						class="fa-solid fa-indian-rupee-sign"></i> 200</a>

				</div>

				<%
				} else {
				%>


				<div class="text-center p-2">
					<a href="" class="btn btn-primary"><i
						class="fa-solid fa-cart-shopping"></i>Add Cart</a> <a href=""
						class="btn btn-primary"><i
						class="fa-solid fa-indian-rupee-sign"></i> 200</a>

				</div>

				<%
				}
				%>

			</div>
		</div>
	</div>


</body>
</html>