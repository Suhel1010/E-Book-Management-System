<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Book</title>
<%@include file="all_component/AllCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background: #f2f2f2;
}

.btn-info {
	color: fafaf7;
}
</style>
</head>
<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/NavBar.jsp"%>

	<div class="container-fluid">
		<h3 class="text-center text-black">All Recent Book</h3>
		<div class="row p-3">


			<%
			String ch = request.getParameter("ch");
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getBookBySearch(ch);
			for (BookDtls b : list2) {
			%>
			<div class="col-md-2.5 ml-5">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b.getphotoName()%>"
							style="width: 120px; height: 150px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p>
							Author:
							<%=b.getAuthor()%></p>

						<%
						if (b.getBookCategory().equals("Old")) {
						%>
						Categories:
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
	</div>

</body>
</html>