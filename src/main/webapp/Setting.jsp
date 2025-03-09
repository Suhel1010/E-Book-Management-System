<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="all_component/AllCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>

</head>
<body style="background-color: #d9dedd">

	<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp" />
	</c:if>

	<%@ include file="all_component/NavBar.jsp"%>

	<div class="container">
		
			<h3 class="text-center mt-2">Hello, ${userobj.name}</h3>
		

		<div class="row p-5">
			<div class="col-md-4">
				<a href="Sell_Book.jsp">
					<div class="card ">
						<div class="card-body text-center">
							<div class="text-ligth">
								<i class="fa-solid fa-book fa-3x"></i>
							</div>
							<h3>Sell old Book</h3>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="OldBook.jsp">
					<div class="card ">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h3>Old Book</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="Edit_Profile.jsp">
					<div class="card text-center ">
						<div class="card-body text-center ">
							<div class="text-primary">
								<i class="fa-solid fa-pen-to-square fa-3x"></i>
							</div>
							<h3>Login & Security</h3>
						</div>
					</div>
				</a>
			</div>

			

			<div class="col-md-6 mt-2">
				<a href="Order.jsp">
					<div class="card text-center ">
						<div class="card-body text-center">
							<div class="text-info">
								<i class="fa-solid fa-box-archive fa-3x"></i>
							</div>
							<h3>My Order</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6 mt-2">
				<a href="Helpline.jsp">
					<div class="card text-center ">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-phone-volume fa-3x"></i>
							</div>
							<h3>Help Center</h3>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>





</body>
</html>