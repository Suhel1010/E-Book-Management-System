<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook: Register</title>
<%@ include file="all_component/AllCss.jsp"%>
</head>
<body style="background-color: #d9dedd">

	<%@ include file="all_component/NavBar.jsp"%>
	<div class="conatiner p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Page</h4>

						<c:if test="${not empty sucMsg }">
							<p class="text-center text-success">${sucMsg }</p>
							<c:remove var="sucMsg" scope ="session"/>
						</c:if>

						<c:if test="${not empty failMsg }">
							<p class="text-center text-danger">${failMsg }</p>
							<c:remove var="failMsg" scope ="session"/>
						</c:if>


						<form action="register" method="post">

							<div class="form-group">
								<label for="exampleInputPassword1">Full Name:</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Full Name" required="required" name="fname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address:</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									required="required" name="email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Phone Number:</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Phone Number" required="required"
									name="phno">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password:</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Password" required="required"
									name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms and conditions.</label>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Register</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="all_component/Footer.jsp"%>
</body>
</html>