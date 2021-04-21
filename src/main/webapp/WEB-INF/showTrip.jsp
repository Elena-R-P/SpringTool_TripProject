<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

</head>
<body>
	<div class="row mb-3 p-2 bg-info fs-3">
        <div class="col text-light">
            <div class="p-2 bd-highlight">SHOW TRIP # <c:out value="${trip.id}"/></div>
        </div>
        <div class="col text-light">
            <div class="p-2 bd-highlight"><a class="d-flex justify-content-end" href="/">log out</a></div>
        </div>
    </div>
	<div class="row p-2">
		<div class="col ">
			<ul class="list-group list-group-flush">
				<li class="list-group-item text-left "><h3 class="card-title">Location: <c:out value="${trip.location}"/></h3></li>
				<li class="list-group-item text-left"><h3 class="card-title">Date: <fmt:formatDate pattern = "yyyy-MM-dd" value = "${trip.date}"/></h3></li>
				<li class="list-group-item text-left"><h3 class="card-title">Description: <c:out value="${trip.description}"/></h3></li>
				<li class="list-group-item text-left"><h3 class="card-title">Organized by: <c:out value="${trip.user.firstName}"/> <c:out value="${trip.user.lastName}"/></h3></li>
			</ul>
		</div>
		<div class="col">
			<a class="btn btn-warning d-flex justify-content-center" href="/dashboard">Main Page</a>
			<c:if test="${trip.user.id == userId}">
				<a class="btn btn-danger d-flex justify-content-center mt-3" href="/trip/edit/${trip.id}">Edit Trip</a>
			</c:if>
		</div>
	</div>
</body>
</html>