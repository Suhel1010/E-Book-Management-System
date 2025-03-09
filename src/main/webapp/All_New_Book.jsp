<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Book</title>
<%@include file="all_component/AllCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background: #f2f2f2;
}

.btn-info {
	color: fafaf7;
}

#toast {
	min-width: 200px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 15px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<C:if test="${not empty sucCart}">

		<div id="toast">Book Added Successfully</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },1000)
		}	
        </script>

		<c:remove var="sucCart" scope="session" />

	</C:if>


	<%@include file="all_component/NavBar.jsp"%>



	<div class="container-fluid">
		<h3 class="text-center text-black">All New Book</h3>
		<div class="row p-3">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllNewBook();
			for (BookDtls b : list) {
			%>

			<div class="col-md-2.5 ml-5">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b.getphotoName()%>"
							style="width: 120px; height: 150px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p>
							Author:
							<%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="Login.jsp" class="btn btn-info btn-sm ">Add Cart</a>
							<%
							} else {
							%>
							<a href="CartModule?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%> "
								class="btn btn-info btn-sm ">Add Cart</a>
							<%
							}
							%>

							<a href="View_Book.jsp?bid=<%=b.getBookId()%>" class="btn btn-info btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-info btn-sm ml-1"> <%=b.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>


		</div>
	</div>

</body>
</html>