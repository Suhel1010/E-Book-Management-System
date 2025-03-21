<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid p-2 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i> E-Books
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0 " action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>

		<c:if test="${not empty userobj }">

			<div class="col-md-3">
				<a href="Login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user"></i> ${userobj.name}</a> <a href="logout"
					class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i>
					Logout</a>
					<a href="CheckOut.jsp"><i class="fa-solid fa-cart-shopping fa-2x ml-4 "></i></a>
			</div>

		</c:if>

		<c:if test="${empty userobj }">

			<div class="col-md-3">
				<a href="Login.jsp" class="btn btn-success"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a> <a
					href="Register.jsp" class="btn btn-success"><i
					class="fa-solid fa-user"></i> Register</a>
			</div>

		</c:if>

	</div>

</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="index.jsp"><i
		class="fa-solid fa-house"></i> Home</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">

			<li class="nav-item active"><a class="nav-link"
				href="All_Recent_Book.jsp">Recent Book</a></li>

			<li class="nav-item active"><a class="nav-link disabled"
				href="All_New_Book.jsp">New Book</a></li>
			<li class="nav-item active"><a class="nav-link disabled"
				href="All_Old_Book.jsp">Old Book</a></li>

		</ul>
		<form class="form-inline my-2 my-lg-0">

			<a href="Setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit">
				<i class="fa fa-cog"></i> Setting
			</a>
			<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
				<i class="fa-solid fa-phone"></i> Contact Us
			</button>
		</form>
	</div>
</nav>