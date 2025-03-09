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
<title>Insert title here</title>
<%@  include file="AllCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@  include file="NavBar.jsp"%>

	<div class="container">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Edit Book</h3>

						

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDtls b = dao.getBookById(id);
						%>

						<form action="../editBook" method="post">
						<input type="hidden" name = "id" value=<%=b.getBookId() %>>

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getBookName()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getAuthor()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getPrice()%>">
							</div>



							<div class="form-group">
								<label for="exampleInputEmail1">Book Status </label> <select
									id="inputState" name="bstatus" class="form-control">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>

								</select>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary text-center">Update</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>