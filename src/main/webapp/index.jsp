<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book:Index</title>
<%@include file="all_component/AllCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("Img/book.jpg");
	height: 65vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background: #f2f2f2;
}

.btn-info {
	color: fafaf7;
}
</style>
</head>
<body style="background-color: #f2f2f2">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/NavBar.jsp"%>

	<!-- Start Recent Book -->

	<div class="container-fluid back-img"></div>
	<div class="container">
		<h3 class="text-center text-black">Recent Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-2.5 ml-5">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b.getphotoName()%>"
							style="width: 120px; height: 150px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p>
							Author:
							<%=b.getAuthor()%></p>

						<%
						if (b.getBookCategory().equals("Old")) {
						%>Categories:
						<%=b.getBookCategory()%></p>


						<div class="row">
							<a href="View_Book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-info btn-sm ml-2">View Details</a> <a href=""
								class="btn btn-info btn-sm ml-1"><%=b.getPrice()%></a>
						</div>

						<%
						} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="Login.jsp" class="btn btn-info btn-sm ">Add Cart</a>
							<%
							} else {
							%>
							<a href="CartModule?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%> "
								class="btn btn-info btn-sm ">Add Cart</a>
							<%
							}
							%>

							<a href="View_Book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-info btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-info btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
						<%
						}
						%>
						<p>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-3">
			<a href="All_Recent_Book.jsp" class="btn btn-info btn-sm text white">View
				All</a>
		</div>

	</div>

	<!-- End Of Recent Book -->
	<hr>

	<!-- Start Of New  Book -->


	<div class="container">
		<h3 class="text-center text-black">New Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>

			<div class="col-md-2.5 ml-5">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b.getphotoName()%>"
							style="width: 120px; height: 150px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p>
							Author:
							<%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="Login.jsp" class="btn btn-info btn-sm ">Add Cart</a>
							<%
							} else {
							%>
							<a href="CartModule?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%> "
								class="btn btn-info btn-sm ">Add Cart</a>
							<%
							}
							%>

							<a href="View_Book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-info btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-info btn-sm ml-1"> <%=b.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>
	<div class="text-center mt-3">
		<a href="All_New_Book.jsp" class="btn btn-info btn-sm text white">View
			All</a>
	</div>

	</div>

	<!-- End of New Book -->
	<hr>
	<!-- Start of Old Book -->


	<div class="container">
		<h3 class="text-center text-black">Old Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-2.5 ml-5">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b.getphotoName()%>"
							style="width: 120px; height: 150px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p>
							Author:
							<%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>

						<div class="row">
							<a href="View_Book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-info btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-info btn-sm ml-1"> <%=b.getPrice()%>
							</a>
						</div>

						<p>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-3">
			<a href="All_Old_Book.jsp" class="btn btn-info btn-sm text white">View
				All</a>
		</div>

	</div>

	<!-- End of Old Book -->

	<%@include file="all_component/Footer.jsp"%>

</body>
</html>