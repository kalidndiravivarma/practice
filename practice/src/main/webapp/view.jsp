<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="WEB-INF/CSS/index.css">
<title>View</title>
</head>
<body>
 <div class="container">
	  <div class="row">	  	
  		<div class="col-md-11 col-md-offset-1">
  		<a href="index.jsp" style="float:right"><h2>Home</h2></a>
  		<br>
		<h2>${updatestatus }</h2>	
	 <c:forEach items="${studednt}" var="std">   	
            <c:if test="${std.name==null }">NULL</c:if>
      
	  		<form id="updateform" action="Updatestudent" method="POST">
		    	<div class="form-group">
		    		<p>User_ID:</p>
		    		<input class="form-control" type="text" id="id" name="id" value="${std.id}">
		    	</div>
		    	<br>
		    	<div class="form-group">
		    		<p>Name:</p>
		    		<input class="form-control" type="text" id="name" name="name" value="${std.name}">
		    	</div>
		    	<br>
		    	<div class="form-group">
		    		<p>Marks:</p>
		    		<input class="form-control" type="text" id="marks" name="marks" value="${std.marks}">
		    	</div>
		    	<div class="form-group">
		    		<p>Age:</p>
		    		<input class="form-control" type="text" id="age" name="age" value="${std.age}">
		    	</div>
		    	<br>
		    	<div class="form-group">
		    		<p>Group:</p> 
		    		<input class="form-control" type="text" id="groups" name="groups" value="${std.groups}">
		    	</div>
		    	<br>	
		    	<div class="col-12">
		            <button type="button" class="btn btn-success" id="editbtn">Edit</button>
		            <button type="submit" class="btn btn-success" id="update" style="float:right">Update</button>
		        </div>	    			    	
	    	</form>	    	
	</c:forEach>	
	</div>
  </div>  	
</div>

  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
	<script type="text/javascript">
	 $(function(){
	    
		updatedisable();
		$("input").prop('disabled', true);
		
		function updatedisable(){
			$("#update").prop("disabled", true);
		}
		
		$("#editbtn").click(function(){
			$("input").prop('disabled', false);
			updateenable()
			$("#editbtn").prop("disabled", true);
			$("#id").prop('disabled', true);
		});
		
		function updateenable(){
			$("#update").prop("disabled", false);
		}
		
		jQuery.validator.addMethod("lettersonly", function(value, element) {
			return this.optional(element) || /^[a-z ]+$/i.test(value);
		}, "Letters only please"); 
    	
    	$("#updateform").validate({
    		rules:{
    			name:{
    				required:true,    				
		        	minlength:3,
		        	maxlength:15,
		        	lettersonly:true
    			},
    			marks:{
    				required:true,
    				number:true,
    				maxlength:2,
    			},
    			age:{
    				required:true,
    				number: true,
    				maxlength:2,
    			},
    			groups:{
    				required:true,
    				lettersonly:true
    			},
    		},
    		messages: {
	            "name": {	            	
	                required: "Please enter a name",
	                maxlength: "Username shoudn't be morethen 15 letters",
               	 	minlength: "Username must contain 4 letters",
               		lettersonly:"please enter alphabetic characters only",
	            },
	            "marks": {
	                required: "Please enter a valid phone no",
	                number:" please enter numeric value ex: 98",
	                maxlength:"Not morethen 99"
	            },
	            "age": {
	            	required: "Please enter your age",
	                number:" please enter valid age ex: 27",
	                maxlength:"Not morethen 99"
	            },
	            "groups": {
	                required: "Please enter group",
	                lettersonly:"please enter alphabetic characters only"
	            }
	        },
	        errorPlacement: function(error, element) 
	        {
	        	error.insertAfter( element );
	         },
	        submitHandler: function(form) {
	            $('#updateform').submit();
	          }
    	});
		
	});
	</script>
	

</body>
</html>