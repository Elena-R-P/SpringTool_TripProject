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
    	<div class="col p-3">
	    	<h1>Create a new Trip</h1>
			<form:form action="/trip/new" method="post" modelAttribute="trip">
			    <div class="mb-3">
			        <form:label class="form-label" path="location">Location</form:label>
			        <form:input path="location" class="form-control"/>
			        <form:errors class="text-danger" path="location"/>
			    </div>
			    <div class="mb-3">
			        <form:label class="form-label" path="description">Description</form:label>
			        <form:textarea path="description" class="form-control"/>
			        <form:errors class="text-danger" path="description"/>
			    </div>
			    <div class="mb-3">
			        <form:label class="form-label" path="date">Date</form:label>
			        <form:input path="date" class="form-control" type="date"/>
			        <form:errors class="text-danger" path="date"/>
			    </div>
			    <form:hidden value="${userId}" path="user"/>
			    <div class="mb-3">
			    	<input class="btn btn-info" type="submit" value="Submit"/>
			    </div>
			</form:form>
		</div>
    </div>
</body>
</html>