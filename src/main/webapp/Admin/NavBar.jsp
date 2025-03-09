<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid p-2 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i> E-Books
			</h3>
		</div>
		
		<div class="col-md-3">
			<c:if test="${not empty userobj }">
				<a class="btn btn-success text-white"><i
					class="fa-solid fa-user"></i> ${userobj.name }</a>

				<a data-toggle="modal" data-target="#exampleModalCenter"
					class="btn btn-success text-white"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>

			</c:if>

			<c:if test="${ empty userobj }">
				<a href="../Login.jsp" class="btn btn-success"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a>
				<a href="../Register.jsp" class="btn btn-success"><i
					class="fa-solid fa-user"></i> Register</a>
			</c:if>
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
			
			<div class="modal-footer">
				
			</div>
		</div>
	</div>
</div>

<!-- End Logout modal -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="Home.jsp"><i
		class="fa-solid fa-house"></i> Home</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
	</div>
</nav>