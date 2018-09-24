<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="WEB-INF/CSS/index.css">
<title>Students Date</title>
</head>
<body>
<div class="container">
<br>
<br>
<h2>Student data</h2>
<br>
<table class="table">
	<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Age</th>
		<th>Group</th>
		<th>Marks</th>
	</tr>
	 <c:forEach items="${studednts}" var="student">	    	
       <tr>
	       <td>${student[0]}</td>
	       <td>${student[1]}</td>
	       <td>${student[2]}</td>
	       <td>${student[3]}</td>
	       <td>${student[4]}</td>
       </tr>       
     </c:forEach>	
</table>
</div>
<br>
<div class="col-12 text-center">
   <a href="search"><button class="btn btn-success">Search</button></a>
</div>   
</body>
</html>