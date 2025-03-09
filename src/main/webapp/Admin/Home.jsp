<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Home</title>
<%@  include file="AllCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%@  include file="NavBar.jsp"%>

     <%-- for sequel, which by url we can not access this page --%>
	<c:if test="${empty userobj }">
		<c:redirect url="../Login.jsp" />
	</c:if>
	
	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center text-danger">
							<i class="fa-solid fa-square-plus fa-3x"></i><br>
							<h3>Add Books</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center text-warning">
							<i class="fa-solid fa-book fa-3x"></i> <br>
							<h3>All Books</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center text-primary">
							<i class="fa-solid fa-box fa-3x"></i><br>
							<h3>Order</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card">
						<div class="card-body text-center text-info">
							<i class="fa-solid fa-right-from-bracket fa-3x"></i><br>
							<h3>Logout</h3>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

	<!-- Start Logout modal -->

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="text-center">
						<h4>Do You Want Logout</h4>
						<button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
						<a href="../logout" type="button" class="btn btn-info">Logout</a>
					</div>

				</div>

				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- End Logout modal -->




</body>
</html>