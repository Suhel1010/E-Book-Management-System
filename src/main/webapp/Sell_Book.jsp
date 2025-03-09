<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book</title>
<%@ include file="all_component/AllCss.jsp"%>
</head>
<body style="background-color: #d9dedd">

	<c:if test="${empty userobj }">
		<c:redirect url="Login.jsp" />
	</c:if>

	<%@ include file="all_component/NavBar.jsp"%>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center text-info p-2">Sell Old Book</h4>

						<c:if test="${not empty sucMsg }">
							<p class="text-center text-success">${sucMsg }</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failMsg }">
							<p class="text-center text-danger">${failMsg }</p>
							<c:remove var="failMsg" scope="session" />
						</c:if>

						<form action="Add_Old_Book" method="post"
							enctype="multipart/form-data">
							
							<input type="hidden" value="${userobj.email }" name="user">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>



							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Sell</button>
							</div>

						</form>



					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>