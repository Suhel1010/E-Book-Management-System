<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook: Login Page</title>
<%@ include file="all_component/AllCss.jsp"%>
</head>
<body style="background-color: #d9dedd">

	<%@ include file="all_component/NavBar.jsp"%>
	<div class="conatiner p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Login Page</h4>

						<c:if test="${not empty failMsg }">
							<p class="text-center text-danger">${failMsg }</p>
							<c:remove var="failMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty sucMsg }">
							<h5><p class="text-center text-success">${sucMsg }</p></h5>
							<c:remove var="sucMsg" scope="session" />
						</c:if>
						
						

						<form action="login" method="post">

							<div class="form-group">
								<label for="exampleInputPassword1">Email Address:</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Email Addreass" required="required"
									name="email">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password:</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Password" required="required"
									name="password">
							</div>
							
							<button type="submit" class="btn btn-primary">Login</button>
							<a href="Register.jsp">Register here</a>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>