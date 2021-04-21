<%@ page isErrorPage="true" %> 
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
            <div class="p-2 bd-highlight">QUOTE DASH</div>
        </div>
        <div class="col text-light">
            <div class="p-2 bd-highlight"><a class="d-flex justify-content-end" href="/">log out</a></div>
        </div>
    </div>
	<div class="row p-3">
	    <div class="col">
	        <h2 class="bd-highlight text-decoration-underline">Welcome, <c:out value="${user.firstName}"/> !</h2>
	    </div>
	</div>
	<div class="row p-3">
		<a class="btn btn-danger" href="/trip/new">Create new Trip</a>
	</div>
	<div class="row p-3">
		<table class="table text-center">
		    <thead>
		        <tr>
		            <th scope="col">Location</th>
		            <th scope="col">Date</th>
		            <th scope="col">Description</th>
		            <th scope="col">Organizer</th>
		            <th scope="col">Actions</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items="${trips}" var="trip">
		        <tr>
		            <td scope="row"><a href="/trip/${trip.id}"><c:out value="${trip.location}"/></a></td>
		            <td scope="row"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${trip.date}"/></td>
		            <td scope="row"><c:out value="${trip.description}"/></td>
		            <td scope="row"><c:out value="${trip.user.firstName}"/> <c:out value="${trip.user.lastName}"/></td>
		            <td scope="row">
		            	<c:if test="${trip.user.id == userId}">
		            	<div class="btn-group" role="group">
		            		<a href="/trip/edit/${trip.id}" class="btn btn-outline-info me-3">Edit</a>
		            		<form action="/trip/delete/${trip.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" value="Delete" class="btn btn-outline-danger me-3">
							</form>
		            	</div>
		            	</c:if>
		            </td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
	</div>
</body>
</html>