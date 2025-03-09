<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@include file="all_component/AllCss.jsp"%>
</head>
<body style="background-color: #f2f2f2">
	<%@include file="all_component/NavBar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty sucMsg}">
		<div class="alert alert-info" role="alert">${sucMsg}</div>
		<c:remove var="sucMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failMsg}">
		<div class="alert alert-danger text-center" role="alert">${failMsg}</div>
		<c:remove var="failMsg" scope="session" />
	</c:if>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card ">
					<h3 class="text-center text-success">Your Selected Items</h3>
					<div class="card-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								double totalPrice = 0.00;

								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>

								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="RemoveBook?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>

								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>



							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Details of Your Items</h3>

						<form action="order" method="post">

							<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="name"
										name="username" class="form-control" id="inputEmail4"
										value="<%=u.getName()%>" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										name="email" class="form-control" id="inputPassword4"
										value="<%=u.getEmail()%>" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number </label> <input
										type="number" class="form-control" name="phno"
										id="inputEmail4" value="<%=u.getPhno()%>" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input
										type="address" class="form-control" name="address"
										id="inputPassword4" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										name="landmark" class="form-control" id="inputEmail4" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="city"
										name="city" class="form-control" id="inputPassword4" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										name="state" class="form-control" id="inputEmail4" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin Code</label> <input type="city"
										name="pincode" class="form-control" id="inputPassword4"
										required>
								</div>
							</div>

							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control"
									name="payment">
									<option value="noselect">--select--</option>
									<option value="cod">Cash On Delivery</option>
								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-info">Order Now</button>
								<a href="index.jsp" class="btn btn-info">Continue Shopping</a>
							</div>

						</form>
					</div>
				</div>
			</div>

		</div>
	</div>


</body>
</html>