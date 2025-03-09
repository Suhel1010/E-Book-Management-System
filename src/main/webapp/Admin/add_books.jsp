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

	<%-- for sequel, which by url we can not access this page --%>
	<c:if test="${empty userobj }">
		<c:redirect url="../Login.jsp" />
	</c:if>

	<div class="container">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Add Book</h3>

						<c:if test="${not empty sucMsg }">
							<p class="text-center text-success">${sucMsg }</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failMsg }">
							<p class="text-center text-danger">${failMsg }</p>
							<c:remove var="failMsg" scope="session" />
						</c:if>

						<form action="../AddBooks" method="post"
							enctype="multipart/form-data">

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
								<label for="exampleInputEmail1">Book Categories*</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>--select--</option>
									<option value="New">New Book</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Book Status </label> <select
									id="inputState" name="bstatus" class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Add</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>