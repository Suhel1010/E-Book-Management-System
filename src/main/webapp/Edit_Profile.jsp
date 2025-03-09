<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@ include file="all_component/AllCss.jsp"%>
</head>
<body style="background-color: #d9dedd">
	<%@ include file="all_component/NavBar.jsp"%>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-info p-2">Edit Profile</h4>

						<c:if test="${not empty failMsg }">
							<h5>
								<p class="text-center text-danger">${failMsg }</p>
							</h5>
							<c:remove var="failMsg" scope="session" />
						</c:if>

						<c:if test="${not empty sucMsg }">
							<h5>
								<p class="text-center text-success ">${sucMsg }</p>
							</h5>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<form action="Update_Prifile" method="post">

							<input type="hidden" value="${userobj.id}" name="id">

							<div class="form-group">
								<label for="exampleInputPassword1">Full Name:</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Full Name" required="required" name="fname"
									value="${userobj.name }">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address:</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									required="required" name="email" value="${userobj.email }">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Phone Number:</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Phone Number" required="required"
									name="phno" value="${userobj.phno }">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password:</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Password" required="required"
									name="password">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>